*** Settings ***
Library           SeleniumLibrary
Resource          CommonKeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01_Book a Flight - Round Trip between To and From Destinations_Verify 'From' cities
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    Validationonmanagebooking
    ValidateFromCity
    Logout
    [Teardown]    Close Browser

TC02_Book a Flight - Round Trip between To and From Destinations_Verify 'To' cities
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    Validationonmanagebooking
    ValidateToCity
    Logout
    [Teardown]    Close Browser

TC03_Book a Flight - Round Trip between To and From Destinations_Verify 'Class'
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    Validationonmanagebooking
    ValidateClass
    Logout
    [Teardown]    Close Browser

TC04_Book a Flight \ - Verify Radio button should not be select by default
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    Validationonmanagebooking
    Radio Button Validations
    Logout
    [Teardown]    Close Browser

TC05_Book a Flight - One way Trip between To and From Destinations_From Toronto to Paris_Economy
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    Validationonmanagebooking
    Book firstfare flight
