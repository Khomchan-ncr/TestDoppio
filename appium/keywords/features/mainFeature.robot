*** Keywords ***

Tap product in list product main page
    [Arguments]    ${product}
    ${new_string}=    Replace String Using Regexp    ${main_page_product_name}    Product    ${product}
    mainPage.Tap product in list    ${new_string}    

