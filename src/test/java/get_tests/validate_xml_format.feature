Feature: Validate the get endpoint response

  Background: Set up base url
    Given url 'https://fakestoreapi.com'

  Scenario: Validate XML format
    Given path '/products/1'
    And header Accept = 'application/xml'
    When method GET
    Then status 200
    And print response
    And match root/price == 109.95