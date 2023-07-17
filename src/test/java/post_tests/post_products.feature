Feature: Post tests Fake Store API

  Background: Create and initialize base url
    Given url 'https://fakestoreapi.com'

  Scenario: Basic POST test
    Given path '/products'
    And request {"id": 1,"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price": 109.95,"description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category": "men's clothing","image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating": {"rate": 3.9,"count": 120}}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 200
    And print response

  Scenario: Basic POST test
    Given path '/products'
    And request
    """
    {
    "id": 15,
    "title": "Mens Cotton Jacket",
    "price": 109.95,
    "description": "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
    "rate": 3.9,
    "count": 120
    }
    }
    """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 200
    And print response
    And match response.title == 'Mens Cotton Jacket'
    And match response.price == '#number'