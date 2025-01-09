*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Variables         resource.variables.robot

*** Variables ***
${BASE_URL}       http://localhost:7272
${BROWSER_PATH}   ${EXECDIR}${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver-win64${/}chromedriver.exe

*** Keywords ***
Open Browser To Form Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${BASE_URL}/Form.html
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Fill Form
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}
    Input Text      id=firstname         ${firstname}
    Input Text      id=lastname          ${lastname}
    Input Text      id=destination       ${destination}
    Input Text      id=contactperson     ${contactperson}
    Input Text      id=relationship      ${relationship}
    Input Text      id=email             ${email}
    Input Text      id=phone             ${phone}

Submit Form
    Click Button    id=submitButton

Validate Error Message
    [Arguments]    ${expected_message}
    ${actual_message}=    Get Text    css=#errors
    Run Keyword If    '${actual_message}' != '${expected_message}'    Fail    Expected text '${expected_message}', but found '${actual_message}'.

Complete Page Should Be Open
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.