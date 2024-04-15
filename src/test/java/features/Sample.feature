Feature: print Hello World feature

Scenario: Hello World Scenario
	* print 'Hello World'
	* print 'Kushan Choudhury'
	
Scenario: declare and print variables
	* def balance = 200
	* def fee = 20
	* def tax = 10
	* print 'total amount ->' +(balance +fee + tax)
	
Scenario: calculator
	* def a = 20
	* def b = 10
	* print 'multiply ->' +(a*b)		
	