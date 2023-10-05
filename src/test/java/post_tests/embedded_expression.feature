Feature: To execute embedded expressions

  Background: Create and initialize base url
    Given url 'https://fakestoreapi.com'

  Scenario: Post request with embedded expressions - functions
    Given path '/products'
    #Creamos una función Javascript
    * def getId = function() {return Math.floor((Math.random() * 100) + 1);}
    #Pasamos la función como variable '#()'
    And request {"id": '#(getId())',"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price": 109.95, "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category": "men's clothing","image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating": {"rate": 3.9,"count": 120}}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 200
    And print response

  Scenario: Post request with embedded expressions - variable
    Given path '/products'
    #Definimos la variable
    * def id = 5
    #Usamos la variable '#()'
    And request {"id": '#(id)',"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price": 109.95, "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category": "men's clothing","image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating": {"rate": 3.9,"count": 120}}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 200
    And print response