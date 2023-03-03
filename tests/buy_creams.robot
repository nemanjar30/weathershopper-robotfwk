*** Settings ***
Documentation       This file contains the UI test for shopping cream based on weather
Resource            ../resources/web_setup.resource
Resource            ../resources/keywords/dashboard_keywords.resource
Resource            ../resources/keywords/cream_catalog_keywords.resource
Resource            ../resources/keywords/checkout_keywords.resource
Resource            ../resources/keywords/confirmation_keywords.resource

Test Setup          Open web browser
Test Teardown       Tear down web test


*** Test Cases ***
As a user, I should be able to add creams to cart and go through payment processing
    [Documentation]  User chooses cream type based on current temperature, puts 2 least expensive creams in cart and
    ...  proceeds with payment
    [Tags]  TestType:Regression
    ${cream_type}  Click on appropriate buy button based on current temperature
    Add products, verify and go to cart  ${cream_type}
    Verify products in cart and go to payment  ${cream_type}
    Populate card details and click pay
    Verify confirmation page