Feature: create user using PUT api

Background:
	* url 'https://gorest.co.in'
	* def random_String = 
	"""
	function(length){
		const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		let result = '';
    const charactersLength = characters.length;
    for ( let i = 0; i < length; i++ )
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    		return result;
	}
	"""
	* def randomString = random_String(10)
	* print randomString
	* def requestPayload =
	"""
	{
	  
    "name": "Sanjay Mathur",
    "gender": "male",
    "status": "active"
	}
	"""
	* requestPayload.email = randomString +"@gmail.com"
	* print requestPayload
Scenario: create a user with given data
Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' +tokenID
When method post
Then status 201
And match $.id == '#present'

# fetch the user id from the POST call response
* def userID = $.id
* print userID
# PUT Call -- update the user
* def requestPutPayload =
	"""
	{
	  "gender": "female",
    "status": "inactive"
	}
	"""
Given path '/public/v2/users/'+userID
And request requestPutPayload
And header Authorization = 'Bearer ' +tokenID
When method put
Then status 200
And match $.id == '#present'	
And match $.name == '#present'
And match $.email == requestPayload.email
And match $.id == userID	


