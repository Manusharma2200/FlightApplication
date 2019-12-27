*** Settings ***
Library           SeleniumLibrary
Library           get_sum
Resource          Commonlyusedkeywords.txt

*** Test Cases ***
OpenBrowser
    Open Browser    https://www.google.com    chrome
    Maximize Browser Window
    Sleep    2
    Close Browser

WebElement_Button
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Click Button    xpath://input[@value='Click Me']
    sleep    1
    ${var1}    Get Text    //span[@id='myButton']
    Log To Console    ${var1}
    Close Browser

WebElement_Checkbof2
    [Setup]    OpenBrowser_ngendigital
    211log3
    Select Frame    id=iframe-015
    Page Should Contain Checkbox    xpath://input[@value='bmw']
    Select Checkbox    xpath://input[@value='bmw']
    Checkbox Should Be Selected    xpath://input[@value='bmw']
    Sleep    2
    Unselect Checkbox    xpath://input[@value='bmw']
    [Teardown]    Close Browser

WebElement_List
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-015
    Page Should Contain List    xpath://select[@id='FromCity']
    @{cities1}    Get List Items    xpath://select[@id='FromCity']
    : FOR    ${city1}    IN    @{cities1}
    \    Log    ${city1}
    List Selection Should Be    xpath://select[@id='FromCity']    Toronto
    Select From List By Label    xpath://select[@id='FromCity']    New York
    Sleep    3
    Select From List By Index    xpath://select[@id='FromCity']    2
    Sleep    3
    Close Browser

WebElement_RadioButton
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-015
    Page Should Contain Radio Button    flight    flighthotel
    Select Radio Button    flight    flighthotel
    sleep    3
    Radio Button Should Be Set To    flight    flighthotel
    sleep    3
    Close Browser

WebElement_Image
    Open Browser    https://ngendigital.com/practice    chrome
    Click Image    xpath://*[@id="n-52555261-navBarId"]/div[1]/div/a/img
    sleep    3
    Run Keyword And Continue On Failure    Title Should Be    Manu
    Close Browser

WebElement_Table
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-015
    Log To Console    Console Log Begins
    ${width}    ${height}    xpath:/html/body/fieldset[7]/table
    Log To Console    Width is :    ${width}
    Log To Console    Height is :    ${height}
    [Teardown]    Close Browser

GeneralPracice
    ${text}=    Set Variable    Test Begins :
    Log To Console    ${text}
    ${text1}=    Set Variable    get_sum    1    2
    Log To Console    ${text1}

Flight Application Login
    Set Selenium Speed    1 sec
    Open Browser    https://ngendigital.com/demo-application    chrome
    Select Frame    id=iframe-015
    Login to flight application    support@ngendigital.com    abc123
    [Teardown]    Close Browser

Flight Application Invalid credentials error validation
    Set Selenium Speed    1 sec
    Open Browser    https://ngendigital.com/demo-application    chrome
    Select Frame    id=iframe-015
    Login to flight application    user1@gmail.com    abc123
    ${error_text}=    Get Text    xpath://div[@id='InvalidLogin']//label
    Log To Console    ${error_text}
    Should Be Equal As Strings    Invalid username/password    ${error_text}
    [Teardown]    Close Browser

*** Keywords ***
OpenBrowser_ngendigital
    Open Browser    https://ngendigital.com/practice    chrome
