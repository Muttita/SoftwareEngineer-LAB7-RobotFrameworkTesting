*** Settings ***
Resource          resource.robot

*** Test Cases ***

# --- Test Set 1 ---
Test Case 1-1 - Open Form
    [Tags]    TestSet1
    Open Browser To Form Page

Test Case 1-2 - Empty Destination
    [Tags]    TestSet1
    Fill Form    Somsong    Sandee    ${EMPTY}    Sodsai Sandee    Mother    somsong@kkumail.com    081-111-1234
    Submit Form
    Validate Error Message    Please enter your destination.
    Capture Page Screenshot
    Close Browser

# --- Test Set 2 ---
Test Case 2-1 - Open Form
    [Tags]    TestSet2
    Open Browser To Form Page

Test Case 2-2 - Empty Email
    [Tags]    TestSet2
    Fill Form    Somsong    Sandee    Europe    Sodsai Sandee    Mother    ${EMPTY}    081-111-1234
    Submit Form
    Validate Error Message    Please enter a valid email address.
    Capture Page Screenshot
    Close Browser

# --- Test Set 3 ---
Test Case 3-1 - Open Form
    [Tags]    TestSet3
    Open Browser To Form Page

Test Case 3-2 - Invalid Email
    [Tags]     TestSet3
    Fill Form    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@    081-111-1234
    Submit Form
    Validate Error Message    Please enter a valid email address.
    Capture Page Screenshot
    Close Browser

# --- Test Set 4 ---
Test Case 4-1 - Open Form
    [Tags]     TestSet4
    Open Browser To Form Page

Test Case 4-2 - Empty Phone Number
    [Tags]     TestSet4
    Fill Form    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    ${EMPTY}
    Submit Form
    Validate Error Message    Please enter a phone number.
    Capture Page Screenshot
    Close Browser

# --- Test Set 5 ---
Test Case 5-1 - Open Form
    [Tags]     TestSet5
    Open Browser To Form Page

Test Case 5-2 - Invalid Phone Number
    [Tags]     TestSet5
    Fill Form    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    191
    Submit Form
    Validate Error Message    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Capture Page Screenshot
    Close Browser