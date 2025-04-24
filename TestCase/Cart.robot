*** Settings ***
Resource    ../Resource/Common.resource
Suite Setup     Test-precondition
Suite Teardown      Test-postCondition

*** Variables ***
${TextExpected}     smart tivi
${product}          xpath=//img[@type='product']
${successMes}       Successfully added to cart
${btnGoToCart}      class=cart-icon
${mesCartEmpty}     There are no items in this cart
*** Test Cases ***
Search in Home and add to cart then verify cart empty
    Open Web
    Sleep    2
    Search Keyword    ${TextExpected}
    Sleep    2
    Find Text         ${TextExpected}
    Sleep    2
    Click Element     ${product}
    Sleep    2
    Add To Cart       ${successMes}
    Sleep    2
    Click Element     ${btnGoToCart}
    Sleep    2
    Confirm Cart      ${mesCartEmpty}
    Sleep    2

