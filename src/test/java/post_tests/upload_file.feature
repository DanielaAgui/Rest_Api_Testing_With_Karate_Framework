Feature: Upload file using Karate Framework

  Background: Setup the base path
    Given url 'https://postman-echo.com'

  Scenario: Upload file in the test application
    Given path '/post'
    #Definimos una variable que lee el archivo a subir
    * def fileRead = read:('classpath:temp.txt')
    #Creamos un objeto para cargar archivos
    #Variables de lectura del archivo, nombre del archivo, Content-type de la api
    And multipart file file = {fileRead, filename:'temp.txt', Content-type:'multipart/form-data'}
    When method post
    Then status 200
    And print response