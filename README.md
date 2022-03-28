# JNCE Clinic API
### by: Isaac Sarte & Argie Barcena

```
  Ruby 3.0.2
  Rails 6.1.5
  NodeJS 12.18.3
  Yarn 1.22.4
```

* ## **Admin Side/Feature**

### Admin Sign up
```
HTTP Method: POST
URL: {{url}}/admins/
```

##### Sample Request Body

```
{
    "email": "admin1@example.com",
    "password": "123456"
}
```

##### Parameters

Name | Description | Required | 
--- | --- | --- | 
email | Admin email | Yes |
password | Admin password | Yes |

### Admin Sign in
```
HTTP Method: POST
URL: {{url}}/admins/sign_in
```

##### Sample Request Body

```
{
    "email": "admin1@example.com",
    "password": "123456"
}
```

##### Parameters

Name | Description | Required | 
--- | --- | --- | 
email | Admin email | Yes |
password | Admin password | Yes |

### Admin Sign out
```
HTTP Method: DELETE
URL: {{url}}/admins/sign_out
```

##### Sample Request Body

```
{
    "email": "admin1@example.com",
    "password": "123456"
}
```

##### Parameters

Name | Description | Required | 
--- | --- | --- | 
email | Admin email | Yes |
password | Admin password | Yes |

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

* ## **Feedback Feature**

### Create User Feedback

```
HTTP Method: POST
URL: {{url}}/api/v1/users
```

##### Sample Request Body

```
{
    "fullname" : "test user"
    "email": "testuser@example.com",
    "phone": 123123,
    "message": "test message feedback"
}
```

##### Parameters

Name | Description | Required | 
--- | --- | --- | 
fullname | User fullname | Yes |
email | User email | Yes |
phone | User phone | Yes |
message | User message | Yes |

# ERD
![image](https://user-images.githubusercontent.com/82153590/160395231-103a96d4-d347-4495-81fc-efd598930e10.png)
