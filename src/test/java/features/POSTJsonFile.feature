Feature: create user using POST api using json file

Background:
	* url 'https://gorest.co.in'
	* def requestPayload = read('classpath:src/test/resources/payload/user.json')
Scenario: create a user with given data
Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' +tokenID
When method post
Then status 201
And match $.id == '#present'
And match $.name == '#present'
And match $.name == 'Sanjay Mathur'
And match $.email == 'sanmathur123@gmail.com' 	