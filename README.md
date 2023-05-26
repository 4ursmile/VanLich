
# **Van Lich Mobile App**
---
## VANLICH API
---
## **Note**
First of all, this is some note for this SERVER.
- This server was build for short context, so it's have no enough API for a real application.
- This repo use local mongodb and localhost, so instruction is going to follow localhost. You need to build your own server, or contact me to get auth api key.
- Need more time to test.
- THIS IS RESTful API.

That all. Now it's time to go to document for API.
> REMEMBER! THIS IS RESTfulAPI

What need to do with this Repo?
> - [x] replate configure with your server
> - [ ] Keep it's origin 
> - [x] Contact me for auth api
---
## Table of content (for Document)
|Section Name| Method|
|------------| ---|
|[Basic Syntax](#basic-syntax)|GET / POST / PUT / DELETE |
|[For healt check](#health-check)| GET|
|[Content](#content)|GET / POST / PUT / DELETE |
|[Comment](#comment)|GET / POST / PUT / DELETE |
|[Collection](#collection)|GET / POST / PUT / DELETE |
|[User](#user)|GET / POST / PUT / DELETE |
---
---
# **Document**

## **Basic syntax**
----
> Denote that http://localhost:5066 just an example.
#### GET
> Only GET method support query
``` JS
GET http://localhost:5066/api/v1/<yourmodel>?
```
*With Id*
``` JS
GET http://localhost:5066/api/v1/<yourmodel>/debug/id
```
#### POST
``` JS
POST http://localhost:5066/api/v1/<yourmodel>/id
Content-Type: application/json

{
    // data here
}
```
#### PUT
``` JS
PUT http://localhost:5066/api/v1/<yourmodel>/id
Content-Type: application/json

{
    // data here
}
```
#### DELETE
``` JS
DELETE http://localhost:5066/api/v1/<yourmodel>/id
```
----
## **Health check**
#### GET
``` JS
GET http://localhost:5066/api/v1/health
```
> If you get HTTP status code 200 OK, it's mean that server is healthy. 
>
> Return a string contains "OK".
----
## **Content**