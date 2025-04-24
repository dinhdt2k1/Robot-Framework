*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Process
Library     String

*** Variables ***
${URL}     https://www.lazada.vn
${username}   0828160336
${pass}       dinhdothi@2k1

*** Keywords ***
Test-precondition
    [Documentation]     Tiền điều kiện để thực thi test
    Log    Pre-condition

Test-postCondition
    [Documentation]     Trả lại môi trường ban đầu để sẵn sàng cho test case mới
    Log    Post-condition

Open Web
    [Documentation]     Open 1 web với địa chỉ cụ thể trên trình duyệt example: open browser Chrome, truy cập tới trang web
    Open Browser    ${URL}   chrome
    Maximize Browser Window


Close Web
    [Documentation]     Đóng browser
    Close Browser

Find Text
    [Documentation]     Sử dụng keyword page should contain trong thư viện selenium kiểm tra element "text" xuất hiện trên web đang mở
    [Arguments]     ${text}
    Page Should Contain     ${text}

Search Keyword
    [Documentation]     Open web browser to research the object
    [Arguments]    ${keyword}
    Click Element    name=q
    Input Text    name=q    ${keyword}
    Press Keys    name=q    ENTER
    Wait Until Page Contains    ${keyword}

Add To Cart
   [Documentation]     Add a product in to cart
   [Arguments]   ${keyword}
   Click Element    xpath=//span[text()='Add to Cart']
   Wait Until Page Contains    ${keyword}

Confirm Cart
   [Documentation]     Confirm that there are no products in the cart
   [Arguments]   ${keyword}
   Input Text    xpath=//input[@type='text']    ${username}
   Input Text    xpath=//input[@type='password']    ${pass}
   Click Element    xpath=//div[@class="iweb-button-mask"]
   Sleep    2
   ${mesCartEmpty}=   Get Text    class=cart-empty-text
   Should Be Equal As Strings  ${mesCartEmpty}  ${keyword}
