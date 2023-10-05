Feature: Validation using json file

  Background:
    Given url 'https://fakestoreapi.com'

  Scenario: To get the data in Json format and validate from file
    Given path '/products/1'
    When method GET
    Then status 200
    #Variable para leer el archivo json
    * def actualResponse = read('classpath:JsonResponse.json')
    And match response == actualResponse

