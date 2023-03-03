*** Settings ***
Documentation       This file contains common keywords used for the Payment Confirmation page
Resource            ../page_objects/confirmation_page.resource


*** Keywords ***
# -------------------------------------------------------------------
# Confirmation Keywords
# -------------------------------------------------------------------
Verify confirmation page
    ${text}  Get title text from confirmation page
    IF  "${text}" == "PAYMENT SUCCESS"
        Verify success text on page
        log  Payment successful
    ELSE
        Verify failure text on page
        log  Payment failed
    END

