*** Settings ***
Documentation       Page file for catalog
Resource            ../web_common.resource


*** Variables ***
${ALL_CREAM_NAMES}          //div[@class='text-center col-4']//p[1]
${CREAM_PRICE}              (//div[@class='text-center col-4'])[{}]//p[2]
${ADD_TO_CART_BTN}          //button[@onclick[contains(.,{})]]
${GO_TO_CART_BTN}           css:span#cart


*** Keywords ***
Get cream price
    [Arguments]  ${index}
    ${cream_price}  Format string  ${CREAM_PRICE}  ${index}
    ${innerHTML}  Get Element Attribute    ${cream_price}    innerHTML
    [Return]  ${innerHTML}

Click add to cart button
    [Arguments]  ${price}
    ${add_button}  Format string  ${ADD_TO_CART_BTN}  ${price}
    Click on element  ${add_button}

Get list of creams
    ${creams}  Get Text From All Matching Elements  ${ALL_CREAM_NAMES}
    [Return]  ${creams}

Click go to cart button
    Click on element  ${GO_TO_CART_BTN}

Verify number of items in cart
    [Arguments]  ${number}
    ${innerHTML}  Get Element Attribute    ${GO_TO_CART_BTN}    innerHTML
    Should Be Equal As Strings  ${innerHTML}  ${number} item(s)