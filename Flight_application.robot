*** Settings ***
Resource          CommonKeywords.txt
Library           SeleniumLibrary
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01_Login screen - objects on the page
    LoginAndNavigateToUrl
    ChangeToIframe
    ObjectsOnWebPage
    [Teardown]    Close Browser

TC02_Login screen - default text for username and password
    LoginAndNavigateToUrl
    ChangeToIframe
    DefaultValueaOfUsernameAndPassword

TC03_User doesn't enter email
    LoginAndNavigateToUrl
    ChangeToIframe
    EmptyUsername
    [Teardown]    Close Browser

TC04_User doesn't enter password
    LoginAndNavigateToUrl
    ChangeToIframe
    EmptyPassword
    [Teardown]    Close Browser

TC05_User doesn't enter email and password
    LoginAndNavigateToUrl
    ChangeToIframe
    EmptyUsernameAndPassword
    [Teardown]    Close Browser

TC06_User enters invalid email format
    Set Selenium Speed    0.2
    LoginAndNavigateToUrl
    ChangeToIframe
    InvalidEmail
    [Teardown]    Close Browser

TC_Load Excel Data
    Load Excel Data    Sheet1    TC07    email

TC07_User logs in with valid username and password
    LoginAndNavigateToUrl
    ChangeToIframe
    LoginToFlightApplication
    Select Frame    id=iframe-115
    VerifyAfterLogin
    [Teardown]    Close Browser
