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

* ## **Public User Side/Feature**

# Cloning the Repo

* `git clone https://github.com/IsaacSarte/jnce-clinic-api.git`

# After Cloning the Repo

```
  $ bundle install
  $ npm install
  $ rails db:create
  $ rails db:migrate
  $ rails s
```

# ERD
![JNCE-Clinic-ERD](https://user-images.githubusercontent.com/82153590/159286700-a2cc342c-1833-4314-b6e8-16b3450a4311.png)
