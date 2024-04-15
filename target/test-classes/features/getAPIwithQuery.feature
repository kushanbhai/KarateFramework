Feature: GET API with query parameters

Scenario: get all active users
* def query = {status: 'active',gender:'female'}
Given url baseUrl +'/public/v2/users'
And params query
When method GET
Then status 200
* print response

Scenario: get all active users
* def query = {status: 'active'}
Given url baseUrl +'/public/v2/users'
And params query
When method GET
Then status 200
* def jsonResp = response
* print jsonResp
* def usercount = jsonResp.length
* print usercount
* match usercount == 10