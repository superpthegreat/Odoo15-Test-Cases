*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${HOSPITAL PATIENT URL}      http://localhost:8069/web#cids=1&menu_id=304&action=415
${BROWSER}        Chrome

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
    I want to see hospital patient
    Sleep    2s
    Click create
    Sleep    2s
    Input my patient name    Nye
    Sleep    2s
    Input my age    9
    Sleep    2s
    Click save
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

I want to see hospital patient
    Go To    ${HOSPITAL PATIENT URL}


Click create
    Click Element       //*[contains(text(),'Create')]

Input my patient name
    [Arguments]    ${name}
    Input Text    name    ${name}

Input my age
    [Arguments]    ${age}
    Input Text    age    ${age}

Click save
    Click Element       //*[contains(text(),'Save')]