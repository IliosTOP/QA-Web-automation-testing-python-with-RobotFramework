*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary


*** Keywords ***
open the browser with the url
    [arguments]     ${browser_name}     ${url}
    create webdriver        ${browser_name}
    go to                   ${url}