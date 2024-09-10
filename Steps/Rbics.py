from io import BytesIO
import datetime
from pathlib import Path
from urllib.parse import urlencode
from behave import *
import requests
import pandas as pd
from rtutility.dataop.fetch.database import ImportFromDatabase
from pandas.testing import assert_frame_equal
import logging
logging.basicConfig(level=logging.DEBUG, format="%(levelname)s %(asctime)s : %(message)s")


@given(u'sidweb api base url {Sidweb_url}')
def base_url(context,Sidweb_url:str):
    context.base_url = Sidweb_url


@when(u'Append the Following parameters for sidweb_api')
def append_params(context):
    context.sid_param_url = f"{context.base_url}?{urlencode(dict(context.table))}"

@when(u'Make api request for rbics data')
def api_request(context):
    response = requests.get(context.sid_param_url,verify=False)
    if response.status_code==200:
        context.sid_response = response.content
        logging.info(response.status_code)
    else:
        raise ValueError('No RESPONSE')

@then(u'save the response into csv file {Sid_api_response}')
def save_csv(context,Sid_api_response:str):
    pd.read_csv(BytesIO(context.sid_response),na_filter=False,sep='|').to_csv(Sid_api_response,index=False)


@given(u'Read the data from database {Rbics_query} at {Cutoff_date}')
def fetch_data(context,Rbics_query,Cutoff_date:str):
    with open(Path(Rbics_query)) as fp:
        context.rbics = fp.read().format(datetime.datetime.strptime(Cutoff_date,'%Y-%m-%d').strftime('%Y%m%d'))
    context.Brutus_SIDExternal = ImportFromDatabase("brutus1.bat.ci.dom", "SIDExternal")
    context.Brutus_SIDExternal.query = context.rbics
    context.Rbics_Data = context.Brutus_SIDExternal.read()
    context.Rbics_Data.to_csv("Rbics_query_data.csv")

@when(u'pivot the data')
def pivot_data(context):
    context.Rbics_pivot_data = context.Rbics_Data.copy()
    context.Rbics_pivot_data = context.Rbics_pivot_data.pivot(index ='stoxxId', columns=['itemName'],values = 'value').reset_index()
    context.Rbics_pivot_data = context.Rbics_pivot_data.rename(columns={'stoxxId':'internalId','l6Id':'l6Id@RbicsFocus'})

@when(u'save the data at {rbics_output}')
def save_rbic_data(context,rbics_output:str):
    context.Rbics_pivot_data.to_csv(Path(rbics_output),index=False)

@then(u'validate the data of {Sid_api_response} with {rbics_output}')
def validate_data(context,Sid_api_response:str,rbics_output:str):
    context.Sidweb_api_df = pd .read_csv(Sid_api_response,na_filter=False,sep = ',') 
    context.Rbics_DB_df = pd .read_csv(rbics_output,na_filter=False) 
    context.Final_df =  context.Sidweb_api_df[['internalId','l6Id@RbicsFocus']].merge(context.Rbics_DB_df,on='internalId',how='left',suffixes=('_API','_DB'))
    context.Final_df['l6Id@RbicsFocus_API'] =pd.to_numeric(context.Final_df['l6Id@RbicsFocus_API'])
    assert_frame_equal(context.Final_df[['l6Id@RbicsFocus_API']],context.Final_df[['l6Id@RbicsFocus_DB']].rename(columns={"l6Id@RbicsFocus_DB":"l6Id@RbicsFocus_API"}),check_dtype=False)
    