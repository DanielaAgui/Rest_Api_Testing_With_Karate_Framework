Feature: Validate complex schema

  Background: Set up base url
    Given url 'https://fakestoreapi.com'

  Scenario: Schema validation for GET endpoint
    Given path '/products/1'
    When method get
    Then status 200
    #Definimos un schema con fuzzy matcher para cada uno de los objetos internos
    * def ratingSchema = {"rate": '#number', "count": '#number'}
    #Definimos un schema para el objeto principal
    #Para incluir un schema interno en el principal usamos ##(nombre_schema_interno)
    * def mainSchema = {"id": '#number', "title": '#string', "price": '#number', "description": '#string', "category": '#string', "image": '#string', "rating": '##(ratingSchema)'}
    And match response == mainSchema


