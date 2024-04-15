Feature: create user using POST api

Background:
	* url 'https://gorest.co.in'
	* def requestPayload =
	"""
	{
	  
    "name": "Sanjay Mathur",
    "gender": "male",
    "email": "sanmathur@gmail.com",
    "status": "active"
	}
	"""
Scenario: create a user with given data
Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' +tokenID
When method post
Then status 201
And match $.id == '#present'
And match $.name == '#present'
And match $.name == 'Sanjay Mathur'
And match $.email == 'sanmathur@gmail.com' 	