Feature: validate the data of sid web api with Database for Rbics

    Scenario Outline: validate the Rbics data
    Given sidweb api base url <Sidweb_url>
    When Append the Following parameters for sidweb_api
        | param_name   | param_value    |
        | indexSymbol  | <index_Symbol> |
        | compDate     | <Cutoff_date>  |
        | secAttrDate  | <Cutoff_date>  |
        | calendarName | STOXXCAL       |
        | targetCcys   | EUR            |
        | vendorItems  | RBICSFOCUS     |
        | output       | csv            |

    When Make api request for rbics data
    Then save the response into csv file <Sid_api_response>

    Given Read the data from database <Rbics_query> at <Cutoff_date>
    When pivot the data 
    When save the data at <rbics_output>
    Then validate the data of <Sid_api_response> with <rbics_output>

    Examples:
        | Sidweb_url                                                | Cutoff_date | index_Symbol | Rbics_query               | Sid_api_response                              | rbics_output                           |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-03-28  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-02-29  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-01-31  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-12-29  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-11-30  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-10-31  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-09-29  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-08-31  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-07-31  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-06-30  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-05-31  | TW1P         | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-03-28  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-02-29  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-01-31  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-12-29  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-11-30  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-10-31  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-09-29  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-08-31  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-07-31  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-06-30  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-05-31  | SXW1E        | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-03-28  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-02-29  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-01-31  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-12-29  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-11-30  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-10-31  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-09-29  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-08-31  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-07-31  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-06-30  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-05-31  | SXISOBP      | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-03-28  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-02-29  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2024-01-31  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-12-29  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-11-30  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-10-31  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-09-29  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-08-31  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-07-31  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-06-30  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |
        | http://brutus2.bat.ci.dom/sidwebapi/api/Index/GetUniverse | 2023-05-31  | STXWAP       | Features\\Data\\Rbics.sql | Features\\Data\\Sid_web_api_rbic_response.csv | Features\\Data\\Rbics_query_output.csv |