
# **Van Lich Mobile App**
---
# **VANLICH API**
---
## **Note**
First of all, this is some note for this SERVER.
- This server was build for short context, so it's have no enough API for a real application.
- This repo use local mongodb and localhost, so instruction is going to follow localhost. You need to build your own server, or contact me to get auth api key.
- Need more time to test.
- THIS IS RESTful API.

That all. Now it's time to go to document for API.

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
# **Documentation**

## **Basic syntax**
----
> Denote that http://localhost:5066 just an example.
> 
> All propeties have suffixes "id" must be **24 hex digit string** or **null**.
>
> if you see {{id}} in example, it present for id variable, in fact you can pass id value directly, for example: 64719f860d017547d511f51e instead of {{id}} 
#### GET
> Only GET method support query
``` http
GET http://localhost:5066/api/v1/<yourmodel>?
```
*With Id*
``` http
GET http://localhost:5066/api/v1/<yourmodel>/debug/{{id}}
```
> Query all have two elements *skip* and *limit*:
> * **skip**: Skip "skip" element in collection (default: 0)
> * **limit**: Limit "limit" element in collection (default: 10, 5 or 3 depend on the case)
> 
> You can pass either or none.

*Example*
``` http
GET http://localhost:5066/api/v1/<yourmodel>?skip=2&limit=5
### or
GET http://localhost:5066/api/v1/<yourmodel>?limit=5
### or
GET http://localhost:5066/api/v1/<yourmodel>?skip=2
### or
GET http://localhost:5066/api/v1/<yourmodel>?
```
Result example will have inspecific section.
> **Denote** that there are custom controls base on your model, but almost model support query in GET method.

#### POST
``` http
POST http://localhost:5066/api/v1/<yourmodel>
Content-Type: application/json

{
    // don't push id here
    // data here
}
```
#### PUT
``` http
PUT http://localhost:5066/api/v1/<yourmodel>/{{id}}
Content-Type: application/json

{
    // don't need id here.
    // data here
}
```
#### DELETE
``` http
DELETE http://localhost:5066/api/v1/<yourmodel>/{{id}}
```
----
## **Health check**
#### **GET**
``` http
GET http://localhost:5066/api/v1/health
```
> If you get HTTP status code 200 OK, it's mean that server is healthy. 
>
> Return a string contains "OK".
---
## **Content**
----
### **GET**
#### Get content by Id (not recommend)
```HTTP
GET http://localhost:5066/api/v1/content/debug/{{id}}
```
> id must 24 hex string

For example
```HTTP
@id=64704ecc79725509dc2e188e
GET http://localhost:5066/api/v1/content/debug/{{id}}
```
Sample output:
```JSON
{
  "Id": "64704ecc79725509dc2e188e",
  "debug": true,
  "name": "SchemeHolding",
  "userID": "hold",
  "mainGraphicUrl": "hold",
  "nOfStars": 1,
  "nOfFavs": 1,
  "nOfComments": 1,
  "nOfShares": 1,
  "caption": "Hold",
  "description": "Hold",
  "content": "Content Holding",
  "type": "story",
  "createDate": "2023-05-25T14:01:38.594Z",
  "catagories": [
    "story",
    "batrieu",
    "lichsu"
  ],
  "graphics": []
}
```
#### **GET contents in database**
```HTTP
GET http://localhost:5066/api/v1/content/?skip=0&limit=1
```
Example output
```JSON
[
  {
    "Id": "6470b92d7b21a9a06e26cc8b",
    "debug": false,
    "name": "SchemeHolding2",
    "userID": null,
    "mainGraphicUrl": "hold",
    "nOfStars": 1,
    "nOfFavs": 1,
    "nOfComments": 1,
    "nOfShares": 1,
    "caption": "Hold",
    "description": "Hold",
    "content": "Content Holding",
    "type": "story",
    "createDate": "2023-05-25T14:01:38.594Z",
    "catagories": [
      "story",
      "batrieu",
      "lichsu"
    ],
    "graphics": []
  }
]
```
#### **Get by Seach**
```HTTP
GET http://localhost:5066/api/v1/content/search/?name=hold&skip=1&limit=1
```
sample output
```JSON
[
  {
    "Id": "64704ecc79725509dc2e188e",
    "debug": true,
    "name": "SchemeHolding", //Got %Hold% match case is intensitive
    "userID": null,
    "mainGraphicUrl": "hold",
    "nOfStars": 1,
    "nOfFavs": 1,
    "nOfComments": 1,
    "nOfShares": 1,
    "caption": "Hold",
    "description": "Hold",
    "content": "Content Holding",
    "type": "story",
    "createDate": "2023-05-25T14:01:38.594Z",
    "catagories": [
      "story",
      "batrieu",
      "lichsu"
    ],
    "graphics": []
  }
]
```
#### **Get by Collection**
```HTTP
@id=647192168229721a1b3ebde2
GET http://localhost:5066/api/v1/content/collection/?collectionid={{id}}
```
> note that this query is also support *skip* and *limit* too. 
#### **Get suggest content**
```HTTP
GET http://localhost:5066/api/v1/content/suggest/?limit=2
```

#### **Get related content**
> query in related include:
> * **id**: id of current content.
> * **type**: type of content you want to get (maybe current content).
> * **skip**: ...
> * **limit**: ...
>
> You can pass either or none
```HTTP
GET http://localhost:5066/api/v1/content/related/?type=video
### or
GET http://localhost:5066/api/v1/content/related/?id={{id}}&type=story
```
> Of course skip and limit
----
### **POST**
```HTTP
POST http://localhost:5066/api/v1/content
Content-Type: application/json

{
    //No id here (recommend), or id must be 24 hex digit string 
    "debug": false,
    "name": "aas",
    "userID": null,
    "mainGraphicUrl": "hold",
    "nOfStars": 0,
    "nOfFavs": 0,
    "nOfComments": 0,
    "nOfShares": 0,
    "caption": "Hold",
    "description": "Hold",
    "content": "Content Holding",
    "type": "video",
    "createDate": "2023-05-26T14:01:38.594Z",
    "catagories": [
      "storytelling",
      "batrieu",
      "lichsu"
    ],
    "graphics": []
}
```
Sample reply
```HTTP
HTTP/1.1 201 Created
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 06:13:26 GMT
Server: Kestrel
Location: http://localhost:5066/api/v1/Content?id=64719f860d017547d511f51e
Transfer-Encoding: chunked

{
  "Id": "64719f860d017547d511f51e", //server reply id
  "debug": false,
  "name": "aas",
  "userID": null,
  "mainGraphicUrl": "hold",
  "nOfStars": 1,
  "nOfFavs": 1,
  "nOfComments": 1,
  "nOfShares": 1,
  "caption": "Hold",
  "description": "Hold",
  "content": "Content Holding",
  "type": "story",
  "createDate": "2023-05-25T14:01:38.594Z",
  "catagories": [
    "story",
    "batrieu",
    "lichsu"
  ],
  "graphics": []
}
```
----
### **PUT**
```HTTP
PUT http://localhost:5066/api/v1/content/64719f860d017547d511f51e
Content-Type: application/json

{
    "Id": "64719f860d017547d511f51e" // unnecessary 
    "debug": false,
    "name": "aas",
    "userID": null,
    "mainGraphicUrl": "hold",
    "nOfStars": 0,
    "nOfFavs": 0,
    "nOfComments": 0,
    "nOfShares": 0,
    "caption": "Hold",
    "description": "Hold",
    "content": "Content Holding",
    "type": "video",
    "createDate": "2023-05-26T14:01:38.594Z",
    "catagories": [
      "storytelling",
      "batrieu",
      "lichsu"
    ],
    "graphics": []
}
```
Sample reply
```HTTP
HTTP/1.1 204 No Content
Connection: close
Date: Sat, 27 May 2023 06:20:30 GMT
Server: Kestrel
```
----
### **DELETE**
```HTTP
DELETE http://localhost:5066/api/v1/content/{{id}}
```
Sample reply
```HTTP
HTTP/1.1 204 No Content
Connection: close
Date: Sat, 27 May 2023 06:20:30 GMT
Server: Kestrel
```
---
## **Comment**
----
### **GET**
#### **GET by id** (not recommend)
```HTTP
GET http://localhost:5066/api/v1/comment/debug/{{id}}
```
Sample reply
```HTTP
HTTP/1.1 200 OK
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 06:34:43 GMT
Server: Kestrel
Transfer-Encoding: chunked

{
  "Id": "646f6f46739418a6bc8191d3",
  "userId": "6470852e08814c5d77fbf793",
  "contentId": "6470853608814c5d77fbf794",
  "text": "Comment",
  "parentCommentIds": "6470853b08814c5d77fbf795",
  "createDate": "2023-05-25T14:23:02.107Z",
  "nOfLikes": 1,
  "nOfChildComments": 0
}
```