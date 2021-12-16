*** Settings ***
Documentation    Valid login page test demo using robot framework and page objects
Resource          ../pageObjects/generic.robot
Resource          ../pageObjects/loginPage.robot
Test Setup        generic.open the browser with the url       ${browser_name}     ${landing_page_url}
Test Teardown     Close Browser

*** Variables ***
${browser_name}       Edge

*** Test Cases ***
Validate Successful Login
    loginPage.type username and password      ${valid_username}         ${valid_password}
    loginPage.agree the terms and conditions
    loginPage.click on the sign in button
    loginPage.validate the login was successful

