Feature: To execute JavaScript function

  Scenario: Execute JavaScript function without parameter
    #Definimos una variable y creamos una función
    * def getIntValue = function() {return 10;}
    #Invocamos en imprimimos la función
    Then print "Function value: ", getIntValue()

  Scenario: Execute JavaScript function without parameter
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    Then print "Function value: ", getRandomValue()

  Scenario: Execute JavaScript function with parameter
    #Definimos una variable y creamos una función con parámetros
    * def getStringValue = function(arg) {return "Hello " + arg}
    #Invocamos la función pasando los parámetros e imprimimos el resultado
    Then print "Function value: ", getStringValue("everyone")