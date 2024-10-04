*** Keywords ***

Verify product that in cart
    [Arguments]    ${price}    ${product}
    cartPage.Verify product amount
    cartPage.Verify product price    ${price}
    cartPage.Verify product name    ${product}
