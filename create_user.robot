*** Settings ***
Resource    settings.robot
Resource    variables.robot

*** Test Cases ***
Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Capture Screenshot    Filled_Login_Form.png
    Click Button    xpath=//button[contains(text(), 'Sign in')]
    Wait Until Page Contains Element  xpath=//h4[contains(text(), 'Unidades')]
    Capture Screenshot    Login_Successful.png
    Close Browser

Create User
    Login as Admin
    Click Button    id=create_user_button
    Input Text    id=user_username    ${NEW_USERNAME}
    Input Text    id=user_password    ${NEW_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Create')]
    Wait Until Page Contains    User Created Message
    Capture Screenshot    User_Created.png
    Close Browser

*** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}

Capture Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}