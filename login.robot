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

*** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}

Capture Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}
