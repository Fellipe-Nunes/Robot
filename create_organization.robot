*** Settings ***
Resource    settings.robot
Resource    variables.robot

*** Test Cases ***
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

    *** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}

Capture Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}
    