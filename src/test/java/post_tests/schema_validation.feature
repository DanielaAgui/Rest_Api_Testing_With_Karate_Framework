Feature: Validate the Json schema

  Background: Create and initialize base Url
    Given url 'https://fakestoreapi.com'

  Scenario: Create a post request and validate json schema
    Given path '/products'
    #Creamos una variable con el cuerpo de request
    * def body = read('classpath:JsonResponse.json')
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request body
    When method post
    And status 200
    #Comparamos la respuesta con el schema de la misma
    #Para el schema usamos fuzzy matchers
    And match response ==
    """
    {
      "id": '#number',
      "title": '#string',
      "price": '#number',
      "description": '#string',
      "category": '#string',
      "image": '#string',
      "rating": '#ignore'
    }
    """

