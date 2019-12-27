*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Library           String

*** Variables ***
${columnnumber}    ${EMPTY}in5sum

*** Test Cases ***
tc1

ReadExcelDemo
    Open Excel    C:/Users/kanik/Demo/Book1.xls
    Check Cell Type    Sheet1    2    1
    ${rowcount}    Get Row Count    Sheet1
    ${columncount}    Get Column Count    Sheet1
    ${columnnumber}=    Evaluate    0
    : FOR    ${rowindex}    IN RANGE    1    ${rowcount}
    \    Exit For Loop If    ${columnnumber}==5
    \    ${data}    Read Cell Data By Coordinates    Sheet1    ${columnnumber}    ${rowindex}
    \    ${columnnumber}=    Evaluate    ${columnnumber} + 1
    \    Log Many    ${rowindex}    ${columnnumber}
    \    Log    ${data}

ReadExcel
    Open Excel    C:/Users/kanik/Demo/Book1.xls
    @{row values}    Get Row Values    Sheet1    1
    Log To Console    @{row values}

dummytc
    ${sum}=    Evaluate    1+1
    log    ${sum}
