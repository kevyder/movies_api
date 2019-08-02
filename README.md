# Movies API

System details:

* Ruby 2.6.0

* Ruby on Rails 5.2.3

* [JSON API format](https://jsonapi.org/)

* [Rubocop code standard](https://www.rubocop.org/en/stable/)


### HEADERS AND AUTHENTICATION
  > Content-Type: application/json
  
  > Authorization: Token token={user token}

### ENDPOINTS
> '*' for authentication required

#### SIGN UP - POST
> {HOST}/api/v1/signup

* #### PARAMS. 
  * name: string
  * email: string
  * password: string
  * password_confirmation: string
  
#### SIGN IN - POST
> {HOST}/api/v1/login

* #### PARAMS. 
  * email: string
  * password: string

#### CREATE MOVIE* - POST
> {HOST}/api/v1/movies

* #### PARAMS. 
  * title: string
  * year: date
  * genre: string
  * description: text
  
#### UPDATE MOVIE* - PUT or PATCH
> {HOST}/api/v1/movies

* #### PARAMS. 
  * title: string
  * year: date
  * genre: string
  * description: text

#### LIST MOVIES* - GET
> {HOST}/api/v1/movies

#### GET MOVIE* - GET
> {HOST}/api/v1/movies/:id

#### DELETE MOVIE* - DELETE
> {HOST}/api/v1/movies/:id

  

