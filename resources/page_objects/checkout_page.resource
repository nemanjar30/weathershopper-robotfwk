*** Settings ***
Documentation       Page file for checkout
Resource            ../web_common.resource


*** Variables ***
${ALL_PRODUCTS}                //table/tbody/tr/td
${PAY_WITH_CARD_BTN}           //button[@class='stripe-button-el']
${PRICE_TOTAL}                 css:p#total
${EMAIL_TEXT_FIELD}            css:input#email
${CARD_NUMBER_TEXT_FIELD}      css:input#card_number
${EXP_DATE_TEXT_FIELD}         css:input#cc-exp
${CVC_TEXT_FIELD}              css:input#cc-csc
${ZIP_CODE_TEXT_FIELD}         css:input#billing-zip
${PAY_BTN}                     css:button#submitButton
${STRIPE_IFRAME}               css:iframe[name='stripe_checkout_app']


*** Keywords ***
Get list of products in cart
    ${creams}  Get Text From All Matching Elements  ${ALL_PRODUCTS}
    [Return]  ${creams}

Click on pay with card button
    Click on element  ${PAY_WITH_CARD_BTN}

Get overall price
    ${price}  Get Element Attribute    ${PRICE_TOTAL}    innerHTML
    [Return]  ${price}

Enter email
    [Arguments]  ${email}
    Enter text  ${EMAIL_TEXT_FIELD}  ${email}

Enter card number
    [Arguments]  ${card_number}
    Press keys  ${CARD_NUMBER_TEXT_FIELD}  ${card_number}

Enter expiration date
    [Arguments]  ${exp_date}
    Press keys  ${EXP_DATE_TEXT_FIELD}  ${exp_date}

Enter cvc number
    [Arguments]  ${cvc}
    Press keys  ${CVC_TEXT_FIELD}  ${cvc}

Enter zip code
    [Arguments]  ${zip_code}
    Press keys  ${ZIP_CODE_TEXT_FIELD}  ${zip_code}

Click pay button
    Click on element  ${PAY_BTN}

Switch to stripe frame
    Switch to frame  ${STRIPE_IFRAME}