Feature: Get tests Fake Store API

  #Base path para uso de todas las api que usan esta url
  Background: Set up base url
    Given url 'https://fakestoreapi.com'

  Scenario: Get request from url
      #Url de la api a usar
    Given url 'https://fakestoreapi.com/products'
      #Método de la request de la api
    When method GET
      #Estado de respuesta de la api esperado
    Then status 200
    And print response

  Scenario: Get request from path
      #Path, cambia para cada endpoint
    Given path '/products/1'
    When method GET
    Then status 200

  Scenario: Get request with headers
    Given path '/products/1'
      #Key y value del header
    And header Accept = 'application/json'
    When method GET
    Then status 200

  Scenario: Get request with headers
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
