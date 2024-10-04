*** Keywords ***

Verify product that in cart
    [Arguments]    ${amount}    ${price}    ${product}
    Wait Title Cart Page Show On Display
    cartPage.Verify product amount    ${amount}
    cartPage.Verify product price    ${price}
    cartPage.Verify product name    ${product}
