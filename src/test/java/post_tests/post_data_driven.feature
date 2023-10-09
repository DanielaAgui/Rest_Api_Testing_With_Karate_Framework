Feature: Create test with template

  #Escenario con datos de entrada
  Scenario Outline: Post test with template
    Given url 'https://0bad87cb-e6b4-4509-86d1-dbc4e36b9340.mock.pstmn.io/post'
    When method post
    Then status 200
    And print response
    #Siempre tiene que ir con datos como ejemplos
    Examples:
      | id   | type       |
      | 5003 | "Cake"     |
      | 5004 | "Popsicle" |

  #Usar una de las variables del ejemplo <nombre_variable>
  Scenario Outline: Post test with template
    Given url 'https://0bad87cb-e6b4-4509-86d1-dbc4e36b9340.mock.pstmn.io/post'
    When method post
    Then status 200
    Examples:
      | id   | type       |
      | "5003" | "Cake"     |
      | "5004" | "Popsicle" |

  Scenario Outline: Data driven test
    Given url 'https://0bad87cb-e6b4-4509-86d1-dbc4e36b9340.mock.pstmn.io'
    And path '/post'
    #Usamos las variables de los ejemplos como expresiones embebidas dentro de la request
    And request { "id": '#(id)', "type": '#(type)' }
    When method post
    Then status 200
    And print "response ", response
    Examples:
      | id   | type       |
      | "5005" | "Cake"     |
      | "5006" | "Popsicle" |




