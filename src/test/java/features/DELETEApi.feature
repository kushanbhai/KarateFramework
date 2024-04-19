Feature: create user using POST api

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
# fetch the user id
* def userID = $.id
* print userID

#delete the user
Given path '/public/v2/users/'+userID
And header Authorization = 'Bearer ' +tokenID
When method delete
Then status 204

#get the same user with the same user id
Given path '/public/v2/users/'+userID
And header Authorization = 'Bearer ' +tokenID
When method get
Then status 404
Then match $.message == 'Resource not found'


