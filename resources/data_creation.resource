*** Settings ***
Documentation       This file contains keywords for generation test data
Library             FakerLibrary

*** Variables ***
@{CREDIT_CARD_NUMBERS}  4242424242424242  4000056655665556  5555555555554444  5200828282828210  5105105105105100
...  6011111111111117  6011000990139424  3566002020360505

*** Keywords ***
Get fake email
    [Documentation]  Create random number and email, then catenate them so it creates a unique email then return
    ...  the value in the keyword
    ${domain_name}  FakerLibrary.Domain Name
    ${numbers}  Get random number  5
    ${email}  FakerLibrary.Safe Email
    ${email_domain}  Get Regexp Matches  ${email}  \\@\\S+
    ${test_email}  Replace String  ${email}  ${email_domain}[0]  _${numbers}@${domain_name}
    [Return]  ${test_email}

Get fake card number
    [Documentation]  Get random card number from a list of valid card numbers
    ${credit_card}  Evaluate  random.choice($CREDIT_CARD_NUMBERS)  random
    [Return]  ${credit_card}

Get random number
    [Documentation]  Gets a random number of legth specified by argument
    ...  then returns the value from the keyword
    [Arguments]  ${number_of_digits}
    ${number}  FakerLibrary.Random Number  digits=${number_of_digits}  fix_len=True
    [Return]  ${number}

Get fake expiration date
    [Documentation]  Create random card number and a user name then
    ...  catenate them then return the value in the keyword
    ${exp_date}  FakerLibrary.Credit Card Expire
    [Return]  ${exp_date}

Get fake cvc number
    [Documentation]  Create random cvc number
    ${cvc}  Get random number  3
    [Return]  ${cvc}

Get fake zip code
    [Documentation]  Create random zip code
    ${zip_code}  Get random number  5
    [Return]  ${zip_code}