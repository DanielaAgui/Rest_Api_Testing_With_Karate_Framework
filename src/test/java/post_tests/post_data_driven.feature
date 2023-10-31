Feature: Create test with template

  #Escenario con datos de entrada
  Scenario Outline: Post test with template method <method>
    Given url 'https://fakestoreapi.com/products'
    #Usamos las variables del ejemplo <nombre_variable>
    When method <method>
    Then status <status>
    Examples:
      | method | status |
      | post   | 200    |
      | get    | 200    |

  Scenario Outline: Data driven test
    Given url 'https://restful-booker.herokuapp.com/auth'
    #Usamos las variables de los ejemplos como expresiones embebidas dentro de la request
    And request {"username": '#(username)', "password": '#(password)'}
    When method post
    Then status 200
    And print response
    Examples:
      | username | password    |
      | "user1"  | "password1" |
      | "user2"  | "password2" |
      | "user3"  | "password3" |

  Scenario Outline: Data driven test with external file
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request {"username": '#(username)', "password": '#(password)'}
    When method post
    Then status 200
    And print response
    #Leemos el archivo externo en el ejemplo para llenar las variables
    Examples:
      | read('classpath:testData.csv') |




