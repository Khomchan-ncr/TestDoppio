*** Keywords ***

Verify product amount
    [Arguments]    ${amount}
    ${new_string}=    Replace String Using Regexp    ${cart_page_product_amount}    amount    ${amount}
    AppiumLibrary.Element text should be       ${new_string}    ${amount}

Verify product price
    [Arguments]    ${price}
    AppiumLibrary.Element text should be        ${cart_page_product_price}    ${price}

Verify product name
    [Arguments]    ${product}
    ${new_string}=    Replace String Using Regexp    ${cart_page_product_name}    Product    ${product}
    AppiumLibrary.Element text should be        ${new_string}    ${product}

Wait Title Cart Page Show On Display
    commonKeyword.Wait until show on display    ${cart_page_my_cart_title}    timeout=${GLOBAL_TIMEOUT}
    