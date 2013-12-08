# TOT4UNICEF
Students can now accept digital payments as they Trick or Treat for UNICEF! We've included a seamless credit card option for instant transactions, but haven't forgotten about our donors who love their checkbook. Children are encouraged through various achievements and badges, which range from easy to hard, and fun to educational.

# License
Licensed under The MIT License (MIT).

## Project Layout
* **server**: the rails server component
* **client**: the mobile application

## Installation
### Server
* requires ruby 1.9+ and rails 4
  * rvm install 1.9
  * rvm gemset create chimehack
  * rvm use 1.9@chimehack --create
  * gem install bundler
  * bundle
* Install mysql 5.5+ (http://dev.mysql.com/downloads/mysql/5.5.html)
  * make sure username is **root**
  * make sure password is **blank**
* Create the databases
  * rake db:create
  * rake db:mirate
* Start server
  * rails server

### Client
* requires XCode 5.5

## Resources
* online production-ish version: http://chimehack.tokofu.net
  * _this was only available for the hackevent. it's been disabled for now. but you can run the site locally to see how it worked_
* if you need to refresh the local database use `rake db:reseed`

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

```json
{
  "id": 6,
  "name": "bob",
}
```


#### Show User
* **method**: GET
* **path**: /api/user.json
* **params**:
  * `id`: integer : required
* **example**
  * `/api/user.json?id=2`
* **response**:

```json
{
  "id": 6,
  "name": "bob"
}
```

#### Donate
* **method**: POST
* **path**: /api/donate.json
* **params**
  * `donor_id`: integer : required : the id of the person gifting money
  * `referrer_id`: integer : required :  the id of the person collecting money
  * `value`: double : required : the value to donate (>=1 or <=100000000)
* **response**:

```json
{
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
}
```

#### Donations by donor
* **method**: GET
* **path**: /api/donations/for_donor.json
* **params**:
  * `id`: integer : required
* **example**
  * `/api/donations/for_donor.json?id=2`
* **response**:

```json
{
  "total_value": 15.0,
  "unique_donors": 1,
  "count": 1,
  "donations": [
    {
      "currency": "USD",
      "value": 15.0,
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
        "target": 500.0,
        "current": 200.0
      }
    }
  ]
}
```


#### Donations by referrer
* **method**: GET
* **path**: /api/donations/for_referrer.json
* **params**:
  * `id`: integer : required
* **example**
  * `/api/donations/for_referrer.json?id=1`
* **response**:

```json
{
  "total_value": 15.0,
  "count": 2,
  "unique_donors": 2,
  "donations": [
    {
      "currency": "USD",
      "value": 50.0,
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
        "target": 500.0,
        "current": 200.0
      }
    },
    {
      "currency": "USD",
      "value": 25.0,
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
        "target": 500.0,
        "current": 200.0
      }
    }
  ]
}
```


#### Incentives
* **method**: GET
* **path**: /api/incentives.json
* **params**:
  * _none_
* **example**
  * `/api/incentives.json`
* **response**:

```json
[
  {
    "value": 6,
    "description": "A soccer ball for children in refugee camps."
  },
  {
    "value": 20,
    "description": "Bed nets to protect families from deadly malaria-carrying mosquitoes."
  },
  {
    "value": 35,
    "description": "Vaccines to protect 50 kids from killer diseases."
  },
  {
    "value": 70,
    "description": "High-protein peanut paste to protect kids from malnutrition."
  },
  {
    "value": 100,
    "description": "A bicycle to deliver medicines."
  },
  {
    "value": 240,
    "description": "A School-in-a-Box kit that lets kids learn anywhere."
  },
  {
    "value": 500,
    "description": "A pump that provides clean water to a village or school."
  },
  {
    "value": 2800,
    "description": "A motorbike ambulance that travels easily."
  }
]
```


#### An Incentive
* **method**: GET
* **path**: /api/incentive.json
* **params**:
  * `value`: integer : required
* **example**
  * `/api/incentive.json?value=500`
* **response**:

```json
{
  "value": 500,
  "description": "A pump that provides clean water to a village or school."
}
```

