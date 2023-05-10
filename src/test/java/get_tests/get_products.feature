Feature: Get tests Fake Store API

  #Base path para uso de todos los test que usan esta url
  Background: Set up base path
    Given url 'https://fakestoreapi.com'

  Scenario: Get products from application in JSON format
    #Url de la api a usar
    Given url 'https://fakestoreapi.com/products'
    #Método de la request de la api
    When method GET
    #Estado de respuesta de la api esperado
    Then status 200

  Scenario: Get products from application in JSON format
    #Base path
    Given url 'https://fakestoreapi.com'
    #Context path, cambia para cada endpoint
    And path '/products/1'
    When method GET
    Then status 200

