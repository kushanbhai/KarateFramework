Feature: Update user using PUT api

Background:
	* url 'https://gorest.co.in'
	* def requestPayload =
	"""
	{
    "gender": "male",
    "email": "karate@gmail.com"
	}
	"""
Scenario: update a user with given data
Given path '/public/v2/users/6853877'
And request requestPayload
And header Authorization = 'Bearer ' +tokenID
When method put
Then status 200
And match $.id == '#present'
And match $.name == '#present'
And match $.name == 'Sanjay Mathur'
And match $.gender == 'male'
#And match $.email == 'sanmathur@gmail.com' 	