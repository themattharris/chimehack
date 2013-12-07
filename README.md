# chimehack
project for the unicef trick or treat project.

## project layout
* **server**: the rails server component
* **client**: the mobile application

## installation
### server
* requires ruby 1.9+ and rails 4
  * rvm install 1.9
  * rvm gemset create chimehack
  * rvm use 1.9@chimehack --create
  * gem install bundler
  * bundle
* install mysql 5.5+ (http://dev.mysql.com/downloads/mysql/5.5.html)
  * make sure username is **root**
  * make sure password is **blank**
* create the databases
  * rake db:create
  * rake db:mirate
* start server
  * rails server

### client
* requires XCode 5.5

## resources
* web and iphone flows (Phase 1): https://drive.google.com/#folders/0B7yysWiQbKCkUUNqc3QxYWUyN2c
* online production-ish version: http://chimehack.tokofu.net
  * _it's running in dev mode so be aware that it will show more debug information_

## API

* Authentication
  * not needed yet
* Formats supported
  * json
* Caveats
  * none yet

### Endpoints

#### Create User
* **method**: POST
* **path**: /api/user.json
* **params**
  * `name`: string : required
  * `email`: string : optional : required if phone not specified
  * `phone`: string : optional : required if email not specified
* **response**:
`{
  "id": 6,
  "name": "bob",
}`


#### Show User
* **method**: GET
* **path**: /api/user.json
* **params**:
  * `id`: integer : required
* **example**
  * `/api/user.json?id=2`
* **response**:
`{
  "id": 6,
  "name": "bob"
}`

#### Donate
* **method**: POST
* **path**: /api/donate.json
* **params**
  * `donor_id`: integer : required : the id of the person gifting money
  * `referrer_id`: integer : required :  the id of the person collecting money
  * `value`: double : required : the value to donate (>=1 or <=100000000)
* **response**:
`{
  "id": 6,
  "currency": "USD",
  "value": "10.0",
  "donor": {
    "id": 1,
    "name": "themattharris"
  },
  "referrer": {
    "id": 2,
    "name": "cindyli"
  }
}`

#### Donations by donor
* **method**: GET
* **path**: /api/donations/for_donor.json
* **params**:
  * `donor_id`: integer : required
* **example**
  * `/api/donations/for_donor.json?id=2`
* **response**:
`{
  "total_value": 15.0,
  "count": 1,
  "donations": [
    {
      "currency": "USD",
      "value": "15.0",
      "donor": {
        "id": 2,
        "name": "themattharris"
      },
      "referrer": {
        "id": 1,
        "name": "allison l"
      },
      "challenge": {
        "name": "chimehack",
        "target": "500.0",
        "current": "200.0"
      }
    }
  ]
}`


#### Donations by referrer
* **method**: GET
* **path**: /api/donations/for_referrer.json
* **params**:
  * `referrer_id`: integer : required
* **example**
  * `/api/donations/for_referrer.json?id=1`
* **response**:
`{
  "total_value": 15.0,
  "count": 2,
  "donations": [
    {
      "currency": "USD",
      "value": "50.0",
      "donor": {
        "id": 8,
        "name": "greentea"
      },
      "referrer": {
        "id": 1,
        "name": "allison l"
      },
      "challenge": {
        "name": "chimehack",
        "target": "500.0",
        "current": "200.0"
      }
    },
    {
      "currency": "USD",
      "value": "25.0",
      "donor": {
        "id": 9,
        "name": "coffeeandtv"
      },
      "referrer": {
        "id": 1,
        "name": "allison l"
      },
      "challenge": {
        "name": "chimehack",
        "target": "500.0",
        "current": "200.0"
      }
    }
  ]
}`
