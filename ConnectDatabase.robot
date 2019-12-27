*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary

*** Test Cases ***
TC01_DatabaseAutomation
    Connect To Database    pymssql    tempdb    ManuTestUser    pass    localhost    1433
    @{queryResults}    Query    select * from Student
    Log Many    @{queryResults}
    ${RowCount}    Row Count    select * from Student
    Log    ${RowCount}

TC02_MinusQueryChecks
    Connect To Database    pymssql    tempdb    ManuTestUser    pass    localhost    1433
    @{queryResults}    Query    SELECT * \ \ \ FROM Student \ \ \ except \ \ \ \ SELECT * \ \ \ FROM Student
    Log Many    @{queryResults}
    ${rowcount}    Row Count    SELECT * \ \ \ FROM Student \ \ \ except \ \ \ \ SELECT * \ \ \ FROM Student
    log    ${rowcount}
    Row Count Is Equal To X    SELECT * \ \ \ FROM Student \ \ \ except \ \ \ \ SELECT * \ \ \ FROM Student    0
    Row Count Is 0    SELECT * \ \ \ FROM Student \ \ \ except \ \ \ \ SELECT * \ \ \ FROM Student

TC03_TableMustExist
    Connect To Database    pymssql    tempdb    ManuTestUser    pass    localhost    1433
    Table Must Exist    Student

TC04_Check if exists in database
    Connect To Database    pymssql    tempdb    ManuTestUser    pass    localhost    1433
    Check If Exists In Database    select LastName from Student where FirstName = 'Manu'

Login using credentials from DB
    Connect To Database    pymssql    tempdb    ManuTestUser    pass    localhost    1433
    Table Must Exist    NgenDigital
    ${username}    Query    select username from NgenDigital where id=1
    ${password}    Query    select password from NgenDigital where id=1
    Open Browser    https://ngendigital.com/demo-application
    Select Frame    id=iframe-015
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='email']    ${username[0][0]}
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='password']    ${password[0][0]}
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://div[contains(text(),'Sign In')]
