Feature: Validate the get endpoint response

  Background: Set up base url
    Given url 'https://fakestoreapi.com'

  Scenario: Validate JSON format
    Given path '/products'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    #Verificamos datos especificos del json
    #Indicamos el objeto que vamos a verificar
    And match response[0].category == "men's clothing"
    And match response[2].rating.rate == 4.7
    And match response[3].id == 4
    #Verificamos todos los valores de un objeto
    And match response[0].rating[*] == [3.9, 120]
    #Verificar si contiene cualquiera de los valores
    And match response[2].rating[*] contains any [500, 200]