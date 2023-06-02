Feature: Validate the get endpoint response

  Background: Set up base url
    Given url 'https://fakestoreapi.com'

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
    And match response.[0].price == '#number'

      #https://github.com/karatelabs/karate#self-validation-expressions
  Scenario: Validate using JavaScript expressions
    Given path '/products'
    And header Accept = 'application/json'
    When method GET
    Then status 200
      #Expresiones JavaScript que evalúen un valor verdadero o falso
      #El _ significa el valor que se está validando
    And match response.[0].id == '#? _ == 1'
      #Valida longitud
    And match response.[0].title == '#string? _.length >= 1'

      #https://github.com/karatelabs/karate#schema-validation
  Scenario: Validate using advanced validation array
    Given path '/products/category/jewelery'
    And header Accept = 'application/json'
    When method GET
    Then status 200
      #Valida si es un array
    And match response == '#[]'
      #Valida si es un array de x longitud
    And match response == '#[4]'
