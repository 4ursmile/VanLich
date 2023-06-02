
<h1 style="text-align: center;"><b>Van Lich Mobile App</b></h>

<p align="middle">
  <img src="https://github.com/UIT-21521109/VanLich/assets/105123355/09a83e0f-8138-4ad8-b9b2-0faa6bcfcd5d" margin="5%" width="50%" />
</p>

## ***powered by***


<p align="middle">
  <img src="https://static-00.iconduck.com/assets.00/flutter-plain-icon-827x1024-okfp25wt.png" margin="5%" width="12%" />
  <img src="https://codeopinion.com/wp-content/uploads/2018/07/Bitmap-MEDIUM_ASP.NET-Core-Logo_2colors_Square_RGB.png" margin="5%" width="17%" />
  <img src="https://www.pngall.com/wp-content/uploads/13/Mongodb-PNG-Image-HD.png" margin="5%" width="17%" />
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Tensorflow_logo.svg/1200px-Tensorflow_logo.svg.png" margin="5%" width="15%" />
  <img src="https://www.freepnglogos.com/uploads/logo-mysql-png/logo-mysql-mysql-and-moodle-elearningworld-5.png" margin="5%" width="15%" />
</p>

---
## **VANLICH**
---

## **Table of content**
|**Section**| 
|:---:| 
|[Members/roles](#members)|
|[User ](#user-guide)|
|[Note](#note)| 
|[architecture](#architecture)| 
|[**documentation(*)**](#documentation)|
---
## **Members**
### **Mobile team**
|**Name**|**Name**|**Name**|
|:---:|:---: | :---:|
|[Trần Đình Nhật Trí](https://github.com/cheesepp)|[Nguyễn Trần Việt Anh](https://github.com/anhng195)|[Nguyễn Phước Anh Tuấn](https://github.com/purified-water)|

### **six-star mascot/tester**
|**Name**|
|:---:|
|[Lê Thanh Minh](https://github.com/Kryst4lize)|
### **Backend teamsss**
|**Name**|
|:---:|
|[Trần Hoàng Bảo Ly](https://github.com/UIT-21521109) (designer part time)|

<h2 align="middle">Our mood now</h2 >
<p align="middle">
<img src="https://thumbs.gfycat.com/FreePiercingHamster-max-1mb.gif" alt= “Ly-mood-now” width="50%" >
</p>

---
## **User guide**
Apk release: [link](https://drive.google.com/file/d/1P4KqEYlPwww2pAO10rRaPJ1rCChIGFox/view?usp=sharing)

You need to install docker [Here](https://docs.docker.com/desktop/)

Run following command:
install git if you don't have before
```console
sudo apt-get update
sudo apt-get install git-all
git version
```
```console
git clone https://github.com/UIT-21521109/VanLich.git
cd VanLichAPI .
```
> read [**note**](#note) before start.
```console
docker build -t vanlichapi .
```
Finally.
```console
docker run -d -p 8080:80 --name vanlichcontainer vanlichapi .
```
That's all.

## **Note**
First of all, this is some note for this SERVER.
- This server was build for short context, so it's have no enough API for a real application.
- This repo use local mongodb and localhost, so instruction is going to follow localhost. You need to build your own server, or contact me to get auth api key. (a cloud version)
- Need more time to test.
- THIS IS RESTful API.

That all. Now it's time to go to document for API.

What need to do with this Repo?
> - [x] replate configure with your server
> - [ ] Keep it's origin 
> - [x] Contact me for auth api
---
# **Architecture**

---
# **Documentation**

## Table of content (for Document)
|Section Name| Method|
|------------| ---|
|[Basic Syntax](#basic-syntax)|GET/POST/PUT/DELETE |
|[For healt check](#health-check)| GET|
|[**Content(*)**](#content)|GET/POST/PUT/DELETE |
|[Comment](#comment)|GET/POST/PUT/DELETE |
|[Collection](#collection)|GET/POST/PUT/DELETE |
|[User](#user)|GET/POST/PUT/DELETE |
---

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

#### **Get related or/and type content**
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
  "parentCommentId": "6470853b08814c5d77fbf795",
  "createDate": "2023-05-25T14:23:02.107Z",
  "nOfLikes": 1,
  "nOfChildComments": 0
}
```
#### **GET by Content ** (recomment)
> query in comment/content include:
> 1. **contentid**: Id of current content you want to get comments.
> 2. **parentcommentid**: type of content you want to get (maybe current content).
> 3. **skip**: ...
> 4. **limit**: ...
> 5. **order**: true/false sort comment in number of like
>
> You can pass either or none
 * if you dont pass parentcommentid mean that you want root comment in content.
> 
 * if you pass parentcommentid, i suggest you pass contentid too, it'll speed up. respone.
```HTTP
### For root comment
GET http://localhost:5066/api/v1/comment/content/?contentid={{contentid}}
### For child comment
GET http://localhost:5066/api/v1/comment/content/?contentid={{contentid}}&parentcommentid={{id}}
```
> Of course skip and limit
----
### **POST**
```HTTP
POST  http://localhost:5066/api/v1/comment/
Content-Type: application/json

{
    //don't push id here (recommend)
    "userId": null,
    "contentId": "5f9f6f46739418a6bc8191d3",
    "text": "This is root comment 44",
    "parentCommentId": null,
    "nOfLikes": 1,
    "nOfChildComments": 0
}
```
----
### **PUT**
```HTTP
PUT  http://localhost:5066/api/v1/comment/{{id}}
Content-Type: application/json

{
    // don't need id here (recommend)
    "userId": null,
    "contentId": "5f9f6f46739418a6bc8191d3",
    "text": "This is root comment 44",
    "parentCommentId": null,
    "createDate": "2023-05-25T14:23:02.107Z",
    "nOfLikes": 1,
    "nOfChildComments": 0
}
```
----
### **DELETE**
```HTTP
DELETE  http://localhost:5066/api/v1/comment/{{id}}
```
---
## **Collection**
----
### **GET**
#### **GET by id** (not recommend)
```HTTP
GET http://localhost:5066/api/v1/collection/debug/{{id}}
```
Sample reply
```HTTP
HTTP/1.1 200 OK
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 07:55:12 GMT
Server: Kestrel
Transfer-Encoding: chunked

{
  "Id": "647192168229721a1b3ebde2",
  "name": "Hold",
  "userId": null,
  "description": "this is collection 2",
  "thumbnail": "this is link 3",
  "contentIds": [
    "6470b92d7b21a9a06e26cc8b"
  ],
  "createdDate": "2020-01-01T00:00:00Z"
}
```
#### **GET collection in database ** 
> query include:
> 1. **skip**: ...
> 2. **limit**: ...
>
> You can pass either or none
```HTTP
GET http://localhost:5066/api/v1/collection/?skip=0&limit=2
```
#### **GET search collection by name** 
> query include:
> 1. **name**:
> 2. **skip**: ...
> 3. **limit**: ...
>
> You can pass either or none
```HTTP
GET http://localhost:5066/api/v1/collection/search/?name=HE
```
> Of course skip and limit

Sample reply
```HTTP
HTTP/1.1 200 OK
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 08:07:51 GMT
Server: Kestrel
Transfer-Encoding: chunked

[
  {
    "Id": "6470cf4fe20723ff7e22b331",
    "name": "schem",
    "userId": null,
    "description": "this is test22",
    "thumbnail": "32",
    "contentIds": [],
    "createdDate": "2023-05-26T15:25:03.885Z"
  }
]
```
#### **GET suggest collection** 
```HTTP
GET http://localhost:5066/api/v1/collection/suggest/?limit=2
```
Sample reply
```HTTP
HTTP/1.1 200 OK
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 08:46:54 GMT
Server: Kestrel
Transfer-Encoding: chunked

[
  {
    "Id": "6470cf4fe20723ff7e22b331",
    "name": "schem",
    "userId": null,
    "description": "this is test22",
    "thumbnail": "32",
    "contentIds": [],
    "createdDate": "2023-05-26T15:25:03.885Z"
  },
  {
    "Id": "6470d037d8717b32ae9f6d98",
    "name": "Hold",
    "userId": null,
    "description": "this is collection 2",
    "thumbnail": "this is link 3",
    "contentIds": [],
    "createdDate": "2020-01-01T00:00:00Z"
  }
]
```
----
### **POST**
```HTTP
POST http://localhost:5066/api/v1/collection/
Content-Type: application/json

{
    //don't push id here (recommend)
    "name": "Hold",
    "userId": null,
    "description": "this is collection 2",
    "thumbnail": "this is link 3",
    "contentIds": ["6470b92d7b21a9a06e26cc8b"],
    "createdDate": "2020-01-01T00:00:00.000Z"
}
```
----
### **PUT**
```HTTP
PUT http://localhost:5066/api/v1/collection/{{id}}
Content-Type: application/json

{
    //don't need id here
    "name": "Hold",
    "userId": null,
    "description": "this is collection 2",
    "thumbnail": "this is link 3",
    "contentIds": ["6470b92d7b21a9a06e26cc8b"],
    "createdDate": "2020-01-01T00:00:00.000Z"
}
```
### **DELETE**
```HTTP
DELETE http://localhost:5066/api/v1/collection/{{id}}
```
---

## **User**
> Authentication (Work in progess).
----
### **GET**
#### **Get currently active user** (for testing)
```HTTP
GET http://localhost:5066/api/v1/user/active
```
Sample reply
```HTTP
HTTP/1.1 200 OK
Connection: close
Content-Type: application/json; charset=utf-8
Date: Sat, 27 May 2023 08:54:20 GMT
Server: Kestrel
Transfer-Encoding: chunked

{
  "Id": "646f6cdd739418a6bc8191d1",
  "name": "admin233",
  "email": "21521109@gm.uit.edu.vn",
  "password": "hashfunction",
  "avatarUrl": "http",
  "contentIds": [],
  "commentIds": [],
  "favContentIds": [],
  "starContentIds": [],
  "saveContentIds": []
}
```
----
### **POST**
```HTTP
POST http://localhost:5066/api/v1/user/ 
Content-Type: application/json

{
  //don't push id here
  "name": "admin233",
  "email": "21521109@gm.uit.edu.vn",
  "password": "hashfunction",
  "avatarUrl": "http",
  "contentIds": [],
  "commentIds": [],
  "favContentIds": [],
  "starContentIds": [],
  "saveContentIds": []
}

```
### **PUT**
```HTTP
PUT http://localhost:5066/api/v1/user/{{id}}
Content-Type: application/json

{
  //don't push id here
  "name": "grandadmin",
  "email": "21521109@gm.uit.edu.vn",
  "password": "secret",
  "avatarUrl": "http",
  "contentIds": [],
  "commentIds": [],
  "favContentIds": [],
  "starContentIds": [],
  "saveContentIds": []
}

```
### **DELETE**
```HTTP
DELETE http://localhost:5066/api/v1/user/{{id}}
```
---
**Note that, In all case POST will reply a model like example in Content/POST and PUT and DELETE will reply NoContent like example in Content PUT/DELETE.**


---
# Work in progress.....................................
---
