*** Settings ***
Resource    ../keywords/keywordAssignment.robot
Variables    ../data/config.yaml
Variables    ../data/variables.yaml
Library      SeleniumLibrary
Suite Setup    Log    Suite is starting
Suite Teardown    Log    Suite is ending
*** Test Cases ***
AM-01 Arguments Scalar
    Validate Age    16
    Validate Age    20

AM-02 Arguments List
    Print Fruits    apple    banana    cherry

AM-03 Arguments Dictionary
    ${user_info} =    Create Dictionary    name=John Doe    age=30    city=New York
    Print User Info    &{user_info}

AM-04 Default Value In Arguments
    Greet User    
    Greet User    John

AM-05 Get Arguments Many List
    Print All Items    apple    banana    cherry    mango

AM-06 Test Global And Local Variables
    Set Global Variable    ${GLOBAL_VAR}    Global Value
    Use Local Variable

AM-07 Test Fetching Variables From YAML
    Log    \nUser Name: ${user.name} \nUser Age: ${user.age} \nUser City: ${user.city}

AM-08 Preload Variables From YAML
    Open browser    ${app_url}    chrome
    Input text    //input[@type='text']    ${credentials.username}
    Input text    //input[@type='password']    ${credentials.password}
    Close Browser

AM-09 Return Scalar
    ${square}=    Calculate Square    4
    Should Be Equal As Integers    ${square}    16

AM-10 Return List
    @{my_fruits}=    Create Fruit List
    Log    \n${my_fruits[0]}

AM-11 Return Dictionary
    &{user}=    Create User Info
    Log    \nName: ${user.name} \nAge: ${user.age} \nCity: ${user.city}

AM-12 IF/IF-Else Statement
    ${age}    Set Variable    17
    Run Keyword If    ${age} > 18    Log To console    \nYou are an adult
    ...    ELSE IF    ${age} == 18    Log To console    \nYou just became an adult
    ...    ELSE    Log To console    \nYou are underage

AM-13 For Loop
    @{fruits}=    Create List    apple    banana    cherry
    FOR    ${fruit}    IN    @{fruits}
        Log   \n${fruit}
    END

AM-14 Break And Continue In Loop
    FOR    ${number}    IN RANGE    1    10
        Run Keyword If    ${number} == 5    Exit For Loop
        Run Keyword If    ${number} == 3    Continue For Loop
        Log    \n${number}
    END

AM-15 Ignore Error And Return Status
    # Attempt to click an invalid locator and capture the status
    ${status}=    Run Keyword And Return Status    Click element    invalid_locator
    Log    \nStatus: ${status}

    # Attempt to Input text into an invalid locator and ignore any errors
    ${result}=    Run Keyword And Ignore Error    Input text    invalid_locator    value
    Log    \nIgnored the error and continued:${result}

AM-16 Recursive Keyword
    ${result}=    Calculate Factorial    ${5}
    Should Be Equal As Integers    ${result}    120

AM-17 Setup and teardown
    [Setup]    Open browser    ${app_url}    gc
    Log   Test is running
    [Teardown]    Close Browser

AM-18 Suite Setup And Suite Teardown
    Log    \nRunning Test 18

AM-19 Teardown in Test Case, Keyword And Suite
    [Teardown]    Log    \nTest Case Teardown is running
    Log    \nRunning Test 19
    Keyword With Teardown

AM-20 Use Tags In Test Case
    [Tags]    smoke
    Log    This is a smoke test

AM-21 Use Many Tags In Test Case
    [Tags]    smoke    critical
    Log    This is a smoke and critical test

AM-22 Exclude Tags Run Test Case
    [Tags]    regression    critical
    Log    This is a exclude regression

## AM-23-25
Parallel Test 1
    [Tags]    testpabot    pabot
    Log    Running Test 1

Parallel Test 2
    [Tags]    testpabot    pabot
    Log    Running Test 2

Parallel Test 3
    [Tags]    testpabot    pabot
    Log    Running Test 3

Parallel Test 4
    Log    Running Test 4

Parallel Test 5
    Log    Running Test 5
## AM-23-25
      