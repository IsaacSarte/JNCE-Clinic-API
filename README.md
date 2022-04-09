# JNCE Clinic API
### by: Isaac Sarte & Argie Barcena

```
  Ruby 3.0.2
  Rails 6.1.5
  NodeJS 12.18.3
  Yarn 1.22.4
```

* ## **Base URL**

```
https://jnceclinicapi.herokuapp.com
```

===============================

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

<br/>
<h3><strong>Note: Feedback is for public users.</strong></h3>

### Admin Retrieve All Feedbacks
```
HTTP Method: GET
URL: {{url}}/api/v1/users/
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Show Feedback
```
HTTP Method: GET
URL: {{url}}/api/v1/users/{{user_id}}
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Retrieve All Appointments
```
HTTP Method: GET
URL: {{url}}/api/v1/appointments
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Show Appointment
```
HTTP Method: GET
URL: {{url}}/api/v1/appointments/{{id}}
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Change Appointment Status
```
HTTP Method: PUT
URL: {{url}}/api/v1/appointments/{{id}}
```
##### Sample Request Body

```
{
    "status" : "done"
}
```

##### Payload

Name | Description | Required | 
--- | --- | --- | 
status | Appointment status | Yes |

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Retrieve All Logs
```
HTTP Method: GET
URL: {{url}}/api/v1/logs
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Show Log
```
HTTP Method: GET
URL: {{url}}/api/v1/logs/{{id}}
```

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

### Admin Create Log
```
HTTP Method: POST
URL: {{url}}/api/v1/logs
```

##### Sample Request Body

```
{
    "appointment_id" : 1
    "admin_id": 1
}
```

##### Payload

Name | Description | Required | 
--- | --- | --- | 
appointment_id | Appointment id | Yes |
admin_id | Admin id | Yes |

##### Headers

Name | Required | 
--- | --- | 
authorization token | Yes |

===============================

* ## **Services Feature**

### Retrieve All Services
```
HTTP Method: GET
URL: {{url}}/api/v1/services
```

===============================

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
    "phone": 01212312312,
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
![image](https://user-images.githubusercontent.com/82153590/162556701-0e728985-33b6-4a2b-8886-c21ef3b6bba9.png)
