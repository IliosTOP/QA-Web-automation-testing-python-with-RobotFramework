*** Settings ***
Documentation    Invalid login page test demo using robot framework and page objects
Resource          ../pageObjects/generic.robot
Resource          ../pageObjects/loginPage.robot
Test Setup        generic.open the browser with the url       ${browser_name}     ${landing_page_url}
Test Teardown     Close Browser
Library           DataDriver        file=../testData/loginData.csv      encoding=utf_8   dialect=unix
Test Template     Validate UnSuccesful Login

*** Variables ***
${browser_name}       Edge

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Validate UnSuccesful Login
    [arguments]         ${username}      ${password}
    loginPage.type username and password      ${username}         ${password}
    loginPage.agree the terms and conditions
    loginPage.click on the sign in button
    loginPage.validate error message shows Incorrect username/password.

