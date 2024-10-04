*** Keywords ***

Tap product in list
    [Arguments]    ${locator}
    commonKeyword.Wait until show on display    ${locator}    ${GLOBAL_TIMEOUT}
    commonKeyword.Swipe until page contain element    ${locator}
    commonKeyword.Click element when element show on display    ${locator}

Tap cart icon in main page
    commonKeyword.Click element when element show on display    ${main_page_cart_icon}