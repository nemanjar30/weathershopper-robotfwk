*** Settings ***
Documentation       This file contains keywords for test setup and teardown for web tests
Library             SeleniumLibrary
Library             String
Library             Collections
Resource            data_creation.resource

*** Variables ***
${INTERACTION_TIMEOUT}      45s
${SCRIPT_TIMEOUT}           1000ms\


*** Keywords ***
# ------------------------------------------------------------
# Element Keywords
# These are keywords applicable to many element types
# e.g. left click, enter text, get text etc
# ------------------------------------------------------------
Click on element
    [Documentation]  Left clicks on an element
    [Arguments]  ${locator}
    Wait until page contains element  ${locator}
    Wait until element is visible  ${locator}
    Wait until element is enabled  ${locator}
    Wait until keyword succeeds  ${INTERACTION_TIMEOUT}  ${SCRIPT_TIMEOUT}
    ...  Click element  ${locator}

Get text from all matching elements
    [Documentation]  An expected condition to get text from all matching elements
    ...  Returns a list containing all text strings found for matching elements
    [Arguments]  ${locator}
    Wait until element is enabled  ${locator}
    Wait until keyword succeeds  ${INTERACTION_TIMEOUT}  ${SCRIPT_TIMEOUT}
    ...  Wait until element is visible  ${locator}
    @{elements}  Get web elements  ${locator}
    @{list}  Create list
    FOR  ${element}  IN  @{elements}
        ${element_text}  Get text  ${element}
        ${stripped_text}  Strip String  ${SPACE}${element_text}${SPACE}
        Append To List  ${list}  ${stripped_text}
    END
    [Return]  @{list}

Convert elements in list to lower case
    [Documentation]  Returns a list containing all text strings in lower case
    [Arguments]  ${elements}
    @{list}  Create list
    FOR  ${element}  IN  @{elements}
        ${lower_case}  Convert to lower case  ${element}
        Append To List  ${list}  ${lower_case}
    END
    [Return]  @{list}

Enter text
    [Documentation]  Enters text on an element text field
    [Arguments]  ${locator}  ${text}
    Wait until element is visible  ${locator}
    Wait until element is enabled  ${locator}
    Wait until keyword succeeds  ${INTERACTION_TIMEOUT}  ${SCRIPT_TIMEOUT}
    ...  input text  ${locator}  ${text}

Switch to frame
    [Documentation]  An expected condition for switching to an IFrame specified by a locator
    [Arguments]  ${locator}
    Wait until element is visible  ${locator}
    Wait until element is enabled  ${locator}
    Select frame  ${locator}

Get element text
    [Documentation]  An expected condition to get the text of an locator
    ...  Returns a String containing the elements text
    [Arguments]  ${locator}
    Wait until keyword succeeds  ${INTERACTION_TIMEOUT}  ${SCRIPT_TIMEOUT}
    ...  Wait until element is visible  ${locator}
    ${element_text}  Get text  ${locator}
    ${stripped_text}  Strip String  ${SPACE}${element_text}${SPACE}
    [Return]  ${stripped_text}