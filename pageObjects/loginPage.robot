*** Settings ***
Documentation    Suite description

*** Variables ***
${valid_username}                     rahulshettyacademy
${valid_password}                     learning
${landing_page_url}                   https://rahulshettyacademy.com/loginpagePractise/
${username_textbox_id}                username
${password_textbox_id}                password
${terms_css_locator}                  .termsText
${sign_in_button_id}                  signInBtn
${incorrect_alert_css_selector}       div[class="alert alert-danger col-md-12"]
${next_page_xpath_selector}           //a[contains(text(),'ProtoCommerce Home')]
*** Keywords ***
type username and password
    [arguments]          ${username}     ${password}
    input text           id:${username_textbox_id}       ${username}
    input password       id:${password_textbox_id}       ${password}
agree the terms and conditions
    click element        css:${terms_css_locator}
click on the sign in button
    click element        id:${sign_in_button_id}
validate error message shows Incorrect username/password.
    Wait Until Element Is Visible       css:${incorrect_alert_css_selector}
    Element Text Should Be              css:${incorrect_alert_css_selector}     Incorrect username/password.

validate the login was successful
    Wait Until Element Is Visible       ${next_page_xpath_selector}
    Title Should Be                     ProtoCommerce
