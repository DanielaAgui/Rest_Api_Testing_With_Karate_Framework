Feature: Get tests Fake Store API

  Scenario: Get products from application in JSON format
    #Url de la api a usar
    Given url 'https://fakestoreapi.com/products'
    #Método de la request de la api
    When method GET
    #Estado de respuesta de la api esperado
    Then status 200

