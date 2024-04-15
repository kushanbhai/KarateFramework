Feature: GET API feature

Scenario: get user details
Given url baseUrl +'/public/v2/users'
And path '6850120'
When method GET
Then status 200
* print response
* def jsonResp = response
* print actName = jsonResp.name
* print actId = jsonResp.id
* print actEmail = jsonResp.email
* print actName
* match actName == 'Soma Saini'
* match actId == 6850120
* match actEmail == 'saini_soma@rohan.example'

Scenario: get user details - user not found
Given url baseUrl +'/public/v2/users'
And path '1'
When method GET
Then status 404