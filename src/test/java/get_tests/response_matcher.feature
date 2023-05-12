Feature: Validate the get endpoint response

  Background: Set up base path
    Given url 'https://fakestoreapi.com'

    Scenario: To get the data from JSON format
      Given path '/products/categories'
      #Indicamos que la request está en formato JSON
      And header Accept = 'application/json'
      When method GET
      Then status 200
      And print response

    Scenario: To get the data from XML format
      Given path '/products/categories'
      #Indicamos que la request está en formato XML
      And header Accept = 'application/xml'
      When method GET
      Then status 200
      And print response

    Scenario: Get Request with match response
      Given path '/products/categories'
      When method GET
      Then status 200
      And print response
      #Verificamos que la respuesta sea igual a la dada
      And match response ==
      """
      [
        "electronics",
        "jewelery",
        "men's clothing",
        "women's clothing"
      ]
      """

    Scenario: Get Request with match response
      Given path '/products'
      When method GET
      Then status 200
      And print response
      #Verificamos que dentro del objeto se encuentre lo que buscamos
      #Variable dentro del objeto principal
      And match response contains deep {"title": "Mens Casual Premium Slim Fit T-Shirts "}
      #Variable dentro de un objeto dentro del objeto principal
      And match response contains deep {"rating":{"count": 120}}
