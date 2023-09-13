*** Settings ***
Resource    settings.robot
Resource    variables.robot

***Test Cases***
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

    *** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}

Capture Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}
    