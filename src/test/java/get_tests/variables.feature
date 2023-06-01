Feature: Variables creation in Karate

  Background:
    * def web_page = "Google"
    * def page_load_timeout = 20

  Scenario: To create a variable
    #Las variables creadas dentro de un escenario solo pueden usar usadas dentro del mismo
    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int_variable: ", var_int
    And print "String_variable: ", var_string
    #Las variables en el background pueden ser usadas en todos los escenarios
    And print "Web_page_variable: ", web_page
    And print "Timeout_variable: ", page_load_timeout







