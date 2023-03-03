*** Settings ***
Documentation       Page file for dashboard
Resource            ../web_common.resource


*** Variables ***
${CURRENT_TEMPERATURE}         css:span#temperature
${BUY_BTN}                     //button[@class='btn btn-primary'][contains(.,'Buy {}')]


*** Keywords ***
Click buy button
    [Arguments]  ${cream_type}
    ${buy_creme_button}  Format string  ${BUY_BTN}  ${cream_type}
    Click on element  ${buy_creme_button}

Get current temperature
    ${innerHTML}  Get Element Attribute    ${CURRENT_TEMPERATURE}    innerHTML
    ${temperature}  Fetch from left  ${innerHTML}  <sup
    [Return]  ${temperature}
