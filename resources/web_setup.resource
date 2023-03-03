*** Settings ***
Documentation       This file contains keywords for test setup and teardown for web tests
Library             SeleniumLibrary

*** Variables ***
${PORTAL_URL}      http://weathershopper.pythonanywhere.com/.
${BROWSER}         Chrome

*** Keywords ***
# -----------------------------------------------------------
# Web Setup Keywords for controlling the browser itself
# -----------------------------------------------------------
Open web browser
    [Documentation]  Opens the browser and navigates to the dashboard page
    Open Browser  ${PORTAL_URL}  ${BROWSER}
    Maximize Browser Window

Tear down web test
    [Documentation]  Tears down the overall test suite, takes a screenshot on test failure
    ...  and closes all open browser windows
    Run keyword if test failed  Run keyword and continue on failure
    ...  SeleniumLibrary.Capture page ScreenShot
    Close all browsers
