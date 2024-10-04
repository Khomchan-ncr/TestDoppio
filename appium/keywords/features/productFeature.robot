*** Settings ***
Library    AppiumLibrary

*** Keywords ***

Tap add to cart and get price in product
    commonKeyword.Swipe until page contain element    ${product_page_add_to_cart}
    ${price_product}=    productPage.Get price product
    commonKeyword.Click element when element show on display    ${product_page_add_to_cart}
    RETURN    ${price_product}
