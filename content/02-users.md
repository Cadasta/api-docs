## Managing a User Account

Developers who use the Cadasta Platform are required to set up a user account. You can create and register a new user through the GUI or using the API. 

To register a user through the API requires you to enter the Virtual Machine and run the server. You can do so by following the steps outlined in the <a href="https://github.com/Cadasta/cadasta-platform/blob/master/README.rst">Cadasta README</a>. Once inside, you can follow the API instructions on how to <a href="https://docs.cadasta.org/en/01-gettingstarted.html#createnewaccount" target="_blank">Register a New User / Create a New User Account</a>.

You can use the Cadasta API to manage these accounts, provided that you have their username and password. This section outlines how to do that, focusing on endpoints that start with `api/v1/account/`. Here all the examples use the `localhost:8000` domain, but you may need to change the domain and port according to your needs.


### Account object

An `account` JSON object contains the following properties:

Property | Type Description
---|---|---
`username` | `String` | The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` | `String` | The user's full name.
`email` | `String` | The user's email address.
`email_verified` | `Boolean` | Indicates whether the user has verified their email address.
`last_login` | `String` | Date and time of last user login.
`language` | `String` | The current available language codes are [‘en’, ‘fr’, ‘es’, ‘id’, ‘pt’‘]. Default is “en-us”.


#### Example Account JSON Object

```json
{
  "username": "janedoe",
  "full_name": "Jane Doe",
  "email": "jane@cadasta.org",
  "email_verified": true,
  "last_login": "2016-10-25T20:20:14.192918Z",
  "language": "en",
  "measurement": "metric",
  "avatar": "https://s3-us-west-2.amazonaws.com/cadasta-platformdemo-bucket/avatars/quybdrsgicebb9t7zat3gbym.png"
}
```


### Register a New User / Create a New User Account


```endpoint
POST /api/v1/account/register/
```

Use this method and endpoint to register a new user to the platform. Note: this does not log the user in-- it simply creates a new account for them. This method is required so that users can log in and grab the authentification token later.


**Request Payload**

Property | Type | Required? | Description
---|---|:---:|---
`username` | `String` | x |The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` | `String` |  | The user's full name.
`email` | `String` | x |The user's email address.
`password` | `String` | x |The user's password.
`language` | `String` | The current available language codes are [‘en’, ‘fr’, ‘es’, ‘id’, ‘pt’‘]. Default is “en-us”.

**Curl command example**

```curl
curl -X POST localhost:8000/api/v1/account/register/ -H 'Content-Type: application/json' --data '{"username":"yourusername", "password":"yourpassword", "email":"youremail@example.com"}'
```

**Response**

The response contains an [account JSON object](#account-object).

#### Example Response

```json
{
  "username": "j_smith",
  "full_name": "Joe Smith",
  "email": "joe.smith@example.com",
  "email_verified": false
}
```



### Log a User In / Get Authorization Key

```endpoint
POST /api/v1/account/login/
```

Getting your authorization token is one of the first things you need to do before using the Cadasta Platform API. That's because many endpoints of Cadasta's API require an authenticated user. To authenticate a user, you need to sign API requests with an authorization token, which you can obtain by logging the user in.

_Note that logging a user into the API does not log them into the platform._

**Request Payload**

Property | Type | Required? | Description
---|---|:---:|---
`password` | `String` | x | The user's password.
`username` | `String` | x | The user's username.

**Curl command example**

```curl
curl -X POST localhost:8000/api/v1/account/login/ --data '{"username":"yourusername", "password":"yourpassword"}'
```

**Response**

The response contains a JSON object with the following properties:

Property | Type | Description
---|---|---
`auth_token` | `String` | The authorization token. Use it to sign requests to the API.

#### Example Response

```json
{
  "auth_token": "UER33kHWhdLPq9nKkvENFtLvu3FF68GQ"
}
```



### Log a User Out

**Curl command example**

```curl
curl -X POST -d "username={username}&password={password}" http://demo.cadasta.org/api/v1/account/logout/
```

```endpoint
POST /api/v1/account/logout/
```
Logging a user out removes their authorization token. Requests cannot be signed with any token obtained previously.

Note that logging a user out of the API does not log them out of the platform.

**Response**

When the logout was successful, you receive an empty response with status code `200`.


### Get the User Account

```endpoint
GET /api/v1/account/
```
This method and endpoint returns the account information for the user authenticated with the request.

**Curl command example**

```curl
curl -X GET localhost:8000/api/v1/account/ -H ‘Authorization: token xxxxxxxxxxxxxxxxxxxxxx’ -H 'Accept: application/json; indent=4'
```

*Note:* The last part -H ‘Accept: application/json; indent=4’ is optional but it displays the response object nicely with indentation (as shown on the right).


**Response**

The response contains an [account JSON object](#account-object).

#### Example Response

```json
{
  "username": "j_smith",
  "full_name": "Joe Smith",
  "email": "joe.smith@example.com",
  "email_verified": false,
  "last_login": "2016-10-20T19:20:27.848272Z"
}
```








### Update a User Account

```endpoint
PATCH /api/v1/account/
```

Update a user's credentials using this method and endpoint.


**Request Payload**

Property | Type | Required? | Description
---|---|:---:|---
`username` | `String` | x | The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` | `String` | | The user's full name.
`email` | `String` | x | The user's email address.
`language` | `String` | The current available language codes are [‘en’, ‘fr’, ‘es’, ‘id’, ‘pt’‘]. Default is “en-us”.

**Curl command example**

```curl
curl -X PATCH localhost:8000/api/v1/account/ -H 'Authorization: token xxxxxxxxxxxxxxxxxxxxxx' -H 'Content-Type: application/json' --data '{"username":"newUserName", "email": "youremail@example.com", "language": "fr"}'
```

*Note:* This changes the the username from “username” to “newUserName” and the “language” from the default value “en-us” to “fr”

**Response**

The response contains an [account JSON object](#account-object).

#### Example Response

```json
{
  "username": "j_smith",
  "full_name": "Joe Smith",
  "email": "joe.smith@example.com",
  "email_verified": false,
  "last_login": "2016-10-20T19:20:27.848272Z"
}
```











### Change the password

```endpoint
POST /api/v1/account/password/
```

This method and endpoint changes the password for a user's account.

**Request Payload**

Property | Type | Required? | Description
---|---|:---:|---
`new_password` | `String` | x | The new password.
`re_new_password` | `String` | x | A confirmation of the new password.
`current_password` | `String` | x | The current password.

**Curl command example**

```curl
curl -X POST localhost:8000/api/v1/account/password/ -H ‘Authorization: token xxxxxxxxxxxxxxxxxxxxxx’ -H ‘Content-Type: application/json’ --data '{"new_password":"Example2017", "re_new_password": "Example2017","current_password":"OldOne2016"}'
```

**Response**

If the password was changed successfully, an empty response with response code `200` is returned.











## Manage Platform Users

This section refers to endpoints that begin with `/api/v1/users/`.

These endpoints are for use by superusers only – individuals who have special account access for an instance of of the Cadasta Platform. They can be used as an entry point to see all users in the platform.

### Platform user response object

Here is a table of the first tier properties of the `users` object:

Property | Type Description
---|---|---
`username` | `String` | The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` |  `String` | The user's full name.
`email` |  `String` | The user's email associated with their account. Must be valid email address.
`organizations` |  `Array` | An array of organizations the user is a member of. (See the `organizations` object table below for more information).
`last_login` | `String` | Date and time of last user login.
`is_active`| `Boolean` | Whether or not the user is active.

The `organizations` object contains the following properties:

Property | Type | Description
---|---|---
`id` | `String` | The ID of the organization.
`name` | `String` | The name of the organization.

#### Example User JSON Object

```json
{
  "username": "janesmith",
  "full_name": "Jane Smith",
  "email": "j.smith@example.com",
  "last_login": "2016-10-20T19:20:27.848272Z",
  "is_active": true,
  "organizations": [{
    "id": "90ush89adh89shd89sah89sah",
    "name": "Cadasta"
  }, {
    "id": "kxzncjkxhziuhsaiojdioasjd",
    "name": "Foo Corp."
  }]
}
```







### List Platform Users

```endpoint
GET /api/v1/users/
```
This method and endpoint return all of the users in the platform.

**Response**

The response contains a [list of user JSON objects](#platform-user-response-object), including the organizations the user is a member of.

#### Example Response

```json
{
  "count": 1,
  "next": null,
  "previous": null,
  "results": [
    {
      "username": "janesmith",
      "full_name": "Jane Smith",
      "email": "j.smith@example.com",
      "last_login": "2016-10-20T19:20:27.848272Z",
      "is_active": true,
      "organizations": [{
        "id": "90ush89adh89shd89sah89sah",
        "name": "Cadasta"
      }, {
        "id": "kxzncjkxhziuhsaiojdioasjd",
        "name": "Foo Corp."
      }]
    }
  ]
}
```









### Get a Platform User

Use this method to view a single user in the platform.

```endpoint
GET /api/v1/users/{username}/
```

**Response**

The response contains a [user JSON object](#platform-user-response-object), including the organizations the user is a member of.


#### Example Response

```json
{
  "username": "janesmith",
  "full_name": "Jane Smith",
  "email": "j.smith@example.com",
  "last_login": "2016-10-20T19:20:27.848272Z",
  "is_active": true,
  "organizations": [{
    "id": "90ush89adh89shd89sah89sah",
    "name": "Cadasta"
  }, {
    "id": "kxzncjkxhziuhsaiojdioasjd",
    "name": "Foo Corp."
  }]
}
```

### Update a Platform User

```endpoint
PATCH /api/v1/users/{username}/
```

Use this method and endpoint to update some of the fields associated with a specific username.

**Request Payload**

All fields are optional, if a field is not present in the request payload, that field will not be updated.

Property | Type | Required? | Description
---|---|:---:|---
`username` | `String` | | The user's username (30 characters or fewer. Letters, digits and @/./+/-/_ only.)
`full_name` |  `String` | | The user's full name.
`email` |  `String`  | | The user's email associated with their account.
`is_active`| `Boolean` |  | Whether or not the user is active.

**Response**

The response contains a [user JSON object](#platform-user-response-object) that includes the organizations the user is a member of.

#### Example Response

```json
{
  "username": "janesmith",
  "full_name": "Jane Smith",
  "email": "j.smith@example.com",
  "last_login": "2016-10-20T19:20:27.848272Z",
  "is_active": true,
  "organizations": [{
    "id": "90ush89adh89shd89sah89sah",
    "name": "Cadasta"
  }, {
    "id": "kxzncjkxhziuhsaiojdioasjd",
    "name": "Foo Corp."
  }]
}
```
