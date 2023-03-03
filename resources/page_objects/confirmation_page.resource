*** Settings ***
Documentation       Page file for payment confirmation
Resource            ../web_common.resource


*** Variables ***
${PAGE_TXT}               //div[@class='row justify-content-center']
${BODY_TXT}               //p[@class='text-justify']
${SUCCESS_BODY}           Your payment was successful. You should receive a follow-up call from our sales team.
${FAILURE_BODY}           Oh, oh! Your payment did not go through. Please bang your head against a wall,
                          ...  curse the software gods and then try again.


*** Keywords ***
Get title text from confirmation page
    ${text}  Get element text  ${PAGE_TXT}
    [Return]  ${text}

Verify success text on page
    ${actual_value}  Get element text  ${BODY_TXT}
    Should be equal as strings  ${actual_value}  ${SUCCESS_BODY}

Verify failure text on page
    ${actual_value}  Get element text  ${BODY_TXT}
    Should Contain  ${actual_value}  ${FAILURE_BODY}
