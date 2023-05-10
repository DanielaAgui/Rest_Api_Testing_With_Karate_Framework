Feature: Validate the get endpoint response

  Background: Set up base path
    Given url 'https://jsonplaceholder.typicode.com'

    Scenario: To get the data from JSON format
      Given path '/posts/1/comments'
      #Indicamos que la request está en formato JSON
      And header Accept = 'application/json'
      When method GET
      Then status 200
      And print response

    Scenario: To get the data from JSON format
      Given path '/posts/1/comments'
      #Indicamos que la request está en formato XML
      And header Accept = 'application/xml'
      When method GET
      Then status 200
      And print response
