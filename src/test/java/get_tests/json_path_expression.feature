Feature: To use the Json path expression

  Background: Set up base url
    Given url 'https://fakestoreapi.com'

        #https://github.com/json-path/JsonPath
  Scenario: To get the value or property using json path expression
    Given path '/products'
    When method get
    Then status 200
    #Usamos JsonPath para consultar elementos en un json
    #Buscamos todos los titulos
    * def jsonId = karate.jsonPath(response, "$..title")
    #Buscamos todos los elementos iguales a
    * def jsonCount = karate.jsonPath(response, "$[?(@.rating.count == 400)]")
    #Buscamos un elemento hijo de otro que sea igual a
    * def jsonDescription = karate.jsonPath(response, "$[?(@.rating.count == 400)].description")
    And print "jsonId --> ", jsonId
    And print "jsonCount --> ", jsonCount
    And print "jsonDescription --> ", jsonDescription


  Scenario: To get the value or property using json path expression
    Given path '/products'
    When method get
    Then status 200
    #Definimos una variable
    * def num = 400
    #Concatenamos la variable en el jsonPath
    * def jsonCount = karate.jsonPath(response, "$[?(@.rating.count == " + num + ")]")
    And print "jsonCount --> ", jsonCount


