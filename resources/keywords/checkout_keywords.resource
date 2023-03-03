*** Settings ***
Documentation       This file contains common keywords used for the Checkout page
Resource            ../page_objects/checkout_page.resource


*** Keywords ***
# -------------------------------------------------------------------
# Checkout Keywords
# -------------------------------------------------------------------
Verify products in cart and go to payment
    [Arguments]  ${cream_type}
    @{products}  Get list of products in cart
    @{creams}  Convert elements in list to lower case  ${products}
    IF  "${cream_type}" == "moisturizers"
        Should contain  ${creams}[0]  aloe
        Should be equal as strings  ${creams}[1]  ${PRICE_1}
        Should contain  ${creams}[2]  almond
        Should be equal as strings  ${creams}[3]  ${PRICE_2}
    ELSE
        Should contain  ${creams}[0]  spf-50
        Should be equal as strings  ${creams}[1]  ${PRICE_1}
        Should contain  ${creams}[2]  spf-30
        Should be equal as strings  ${creams}[3]  ${PRICE_2}
    END
    Verify overall price
    Click on pay with card button

Verify overall price
    ${sum}  Evaluate  ${PRICE_1}+${PRICE_2}
    ${expected_price}  Catenate  Total: Rupees ${sum}
    ${actual_price}  Get overall price
    Should be equal as strings  ${actual_price}  ${expected_price}

Populate card details and click pay
    ${email}  Get fake email
    ${card_number}  Get fake card number
    ${exp_date}  Get fake expiration date
    ${cvc}  Get fake cvc number
    ${zip_code}  Get fake zip code
    Switch to stripe frame
    Enter email  ${email}
    Enter card number  ${card_number}
    Enter expiration date  ${exp_date}
    Enter cvc number  ${cvc}
    Enter zip code  ${zip_code}
    Click pay button
