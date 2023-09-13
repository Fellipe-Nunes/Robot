*** Settings ***
Resource    settings.robot
Resource    variables.robot

*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Capture Screenshot    Filled_Login_Form.png
    Click Button    xpath=//button[contains(text(), 'Sign in')]
    Wait Until Page Contains Element  xpath=//h4[contains(text(), 'Unidades')]
    Capture Screenshot    Login_Successful.png
    Close Browser

Create Organization
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element  xpath=//h4[contains(text(), 'Unidades')]
    Click Button    id=create_organization_button
    Input Text    id=organization_name    New Organization
    Input Text    id=organization_description    This is a new organization.
    Click Button    xpath=//button[contains(text(), 'Create')]
    Wait Until Page Contains    Organization Created Message
    Capture Screenshot    Organization_Created.png
    Close Browser

Create Project
    Open Browser    ${URL}    ${BROWSER}
    Click Button    xpath=//button[contains(text(), 'Sign in')]
    Wait Until Page Contains Element  xpath=//h4[contains(text(), 'Unidades')]
    Click Button    id=create_project_button
    Input Text    id=project_name    New Project
    Input Text    id=project_description    This is a new project.
    Click Button    xpath=//button[contains(text(), 'Create')]
    Wait Until Page Contains    Project Created Message
    Capture Screenshot    Project_Created.png
    Close Browser

Create User
    Click Button    id=create_user_button
    Input Text    id=user_username    ${NEW_USERNAME}
    Input Text    id=user_password    ${NEW_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Create')]
    Wait Until Page Contains    User Created Message
    Capture Screenshot    User_Created.png

*** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}

Capture Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}
