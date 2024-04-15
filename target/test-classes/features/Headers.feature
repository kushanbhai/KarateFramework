Feature: GET API Headers feature


Scenario: pass the user request with headers Part_1
Given header Content-Type = 'text/xml;charset=ISO-8859-1'
And header Accept-Encoding = 'gzip,deflate'
And header Connection = 'Keep-Alive'
And header Expect = '100-continue'
And header User-Agent = 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'
And header Authorization = 'Bearer ecb773a6bf2a5691e8e78c7d24bca27db0feb131f395e8b5fe857927279b8609' 
When url baseUrl +'/public/v2/users'
And path '6850112'
When method GET
Then status 200
* print response

Scenario: pass the user request with headers Part_2
* def request_headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given headers request_headers
When url baseUrl +'/public/v2/users'
And path '6850112'
When method GET
Then status 200
* print response

Scenario: pass the user request with headers Part_3
* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given url baseUrl +'/public/v2/users'
And path '6850112'
When method GET
Then status 200
* print response
