chimehack project for the unicef trick or treat project.

structure
- server: the rails server component
  - requires ruby 1.9+ and rails 4
    - rvm install 1.9
    - rvm gemset create chimehack
    - rvm use 1.9@chimehack --create
    - gem install bundler
    - bundle
  - install mysql 5.5+ (http://dev.mysql.com/downloads/mysql/5.5.html)
    - make sure username is root
    - make sure password is blank
  - rake db:create
  - rake db:mirate
  - start server
  	- rails server
- client: the mobile application

web and iphone flows (Phase 1): https://drive.google.com/#folders/0B7yysWiQbKCkUUNqc3QxYWUyN2c

accessible interwebs version: http://chimehack.tokofu.net
- it's running in dev mode so be aware that it will show more debug information



h1. API

Authentication: not yet (be good to me)
Formats supported: json
Caveats: model validations are being added - so it will just let anything happen now

h2. Endpoints

h3. Create User
method: POST
path: /api/user.json
params:
- name: string
- email: string
- phone: string

response:
{
  "id": 6,
  "name": "bob",
}


h3. Show User
method: GET
path: /api/user/:id.json
params:
- id: integer

response:
{
  "id": 6,
  "name": "bob",
}