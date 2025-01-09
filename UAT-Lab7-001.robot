*** Settings ***
Resource          resource.robot

*** Test Cases ***
Test Case 1 - Open Form
    Open Browser To Form Page

Test Case 2 - Record Success
    Fill Form    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    081-111-1234
    Submit Form
    Complete Page Should Be Open
    Close Browser
