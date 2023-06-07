Feature: Post request with external file

  Background: Create and initialize base Url
    Given url 'https://fakestoreapi.com'

  Scenario: Create a post request with a Json file
    Given path '/products'
    * def body = read('classpath:JsonResponse.json')
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request body
    When method post
    And status 200
