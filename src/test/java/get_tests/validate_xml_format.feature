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

    #https://github.com/karatelabs/karate#fuzzy-matching
  Scenario: Validate using fuzzy matcher
    Given path '/products'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response.[0].category == '#present'
    And match response.[2].rating.rate == '#notnull'
    And match response.[3].id == '#ignore'
    And match response.[0].rating[*] == '#array'
