*** Settings ***
Documentation       This file contains common keywords used for the Dashboard page
Resource            ../page_objects/dashboard_page.resource


*** Keywords ***
# -------------------------------------------------------------------
# Dashboard Keywords
# -------------------------------------------------------------------
Click on appropriate buy button based on current temperature
    ${temperature}  Get current temperature
    ${int_temp}  Convert to integer  ${temperature}
    IF    ${int_temp} < 19
        Click buy button  moisturizers
        ${type}  Catenate  moisturizers
    END
    IF    ${int_temp} > 34
        Click buy button  sunscreens
        ${type}  Catenate  sunscreens
    END
    [Return]  ${type}

