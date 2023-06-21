*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${PROJECT URL}      http://localhost:8069/web#cids=1&menu_id=317&action=440
${BROWSER}        Chrome
${button_on_popup_page}     action_view_tasks

*** Test Cases ***
My login test case
    I want to open odoo login page
    Sleep    2s
    Input my username    student@gmail.com
    Sleep    2s
    Input my password    student
    Sleep    2s
    Submit my credentials
    Sleep    2s
    I should see this page
    Sleep    2s
    I want to see project
    Sleep    2s
    Click create
    Sleep    2s
    Input my project name    Half Life 3
    Sleep    2s
    Click modal create button
    Sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
I want to open odoo login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login | My Website

Input my username
    [Arguments]    ${username}
    Input Text    login    ${username}

Input my password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit my credentials
    Click Element       //*[contains(text(),'Log in')]

I should see this page
    Title Should Be    Odoo - Discuss

I want to see project
    Go To    ${PROJECT URL}


Click create
    Click Element       //*[contains(text(),'Create')]

Input my project name
    [Arguments]    ${name}
    Input Text    name    ${name}

Click modal create button
    Set Focus To Element    ${button_on_popup_page}
    Click Element    ${button_on_popup_page}