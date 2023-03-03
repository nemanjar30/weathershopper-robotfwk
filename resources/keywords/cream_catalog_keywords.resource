*** Settings ***
Documentation       This file contains common keywords used for the Catalog page
Resource            ../page_objects/cream_catalog_page.resource


*** Keywords ***
# -------------------------------------------------------------------
# Cream Catalog Keywords
# -------------------------------------------------------------------
Fetch cream price
    [Arguments]  ${index}
    ${string1}  Get cream price  ${index}
    IF    'Rs.' in '${string1}'
        ${string2}  Fetch from right  ${string1}  Rs.
        ${price}  Convert to integer  ${string2}
    ELSE
        ${string2}  Fetch from right  ${string1}  Price:
        ${price}  Convert to integer  ${string2}
    END
    [Return]  ${price}

Add products, verify and go to cart
    [Arguments]  ${cream_type}
    IF  "${cream_type}" == "moisturizers"
       ${lowest_price_1}  Find cream with specific ingredient for lowest price  aloe
       ${lowest_price_2}  Find cream with specific ingredient for lowest price  almond
       Set test variable  ${PRICE_1}  ${lowest_price_1}
       Set test variable  ${PRICE_2}  ${lowest_price_2}

    ELSE
       ${lowest_price_1}  Find cream with specific ingredient for lowest price  spf-50
       ${lowest_price_2}  Find cream with specific ingredient for lowest price  spf-30
       Set test variable  ${PRICE_1}  ${lowest_price_1}
       Set test variable  ${PRICE_2}  ${lowest_price_2}
    END
    Click add to cart button  ${lowest_price_1}
    Verify number of items in cart  1
    Click add to cart button  ${lowest_price_2}
    Verify number of items in cart  2
    Click go to cart button

Find cream with specific ingredient for lowest price
    [Arguments]  ${ingredient}
    @{creams}  Get list of creams
    @{creams}  Convert elements in list to lower case  ${creams}
    @{price_list}  Create List
    FOR  ${index}  ${cream}  IN ENUMERATE  @{creams}
        ${index}  Evaluate    ${index} + 1
        ${contains}  Evaluate   "${ingredient}" in "${cream}"
        IF  ${contains} == ${True}
            ${price}  Fetch cream price  ${index}
            Append To List  ${price_list}  ${price}
        END
    END
    ${lowest_price}  Evaluate  min($price_list)
    [Return]  ${lowest_price}