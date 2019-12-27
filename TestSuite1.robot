*** Settings ***
Force Tags        ForceTag1
Default Tags      DefaultTag1
Test Template
Library           ExcelLibrary
Resource          Userdefinedresource_Keywords.txt
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${var1}           4    # My first scalar variable
${var2}           4    # My second scalar variable
@{user}           Manu    Robot
&{credentials}    username=manu    password=manu

*** Test Cases ***
TestScalarVariable
    Should Be Equal    ${var1}    ${var2}

TestLIstVariable
    [Tags]    TCTag1
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{user}[0]    @{user}[1]
    [Teardown]    TeardownDemo

TestDictionaryVariable
    Should Be Equal As Strings    &{credentials}[username]    &{credentials}[password]

TemplateTestCase
    [Template]    Should Be Equal As Integers    # This is a Template
    2    4
    6    6
    4    5

TestUserdefinedresources
    Comparetwovariables

*** Keywords ***
SetupDemo
    Log To Console    This is a setup method

TeardownDemo
    Log To Console    This is a teardown demo
