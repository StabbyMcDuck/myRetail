# myRetail
myRetail is an API with a Cassandra NoSQL database

## Status
[![Build Status](https://api.cirrus-ci.com/github/StabbyMcDuck/myRetail.svg)](https://cirrus-ci.com/github/StabbyMcDuck/myRetail)
[![Maintainability](https://api.codeclimate.com/v1/badges/2e8fc2fe4f3a071bc0e4/maintainability)](https://codeclimate.com/github/StabbyMcDuck/myRetail/maintainability)

## Stack
* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](https://rubyonrails.org/)
* [Cassandra](http://cassandra.apache.org/)
* [RSpec](https://rspec.info/) for testing

## Versions
* Ruby 2.6.4
* Rails 5.2.3

## CI
* [Cirrus CI](https://cirrus-ci.org/)

## Pre-reqs
You will need to have a few things already downloaded to run this Rails project.

### MacOS Installation Guide

**Homebrew** https://brew.sh/ 

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**RVM** https://rvm.io/

Install RVM, or the Ruby Version Manager. All Macs come with Ruby automatically, but it is an older version of Ruby
and messing with your operating system's version of Ruby is a terrible idea.  Luckily, we can use RVM to easily switch 
between different versions of Ruby. 

First install GPG keys:
```
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

Then install RVM: 
```
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

Now that you have RVM installed, you can install our specific version of Ruby.

```
rvm install 2.6.4
```

Then you want to specify that you want to use this specific version. To do so run:

```
rvm use 2.6.4
```
**Rails**

Now that you have the right version of Ruby, you can install Rails, the Ruby web framework. 

```sh
gem install rails -v 5.2.3
```

Next you will need to install all of the libraries - get a drink, this will take awhile ☕️

```sh
bundle install
```

**Cassandra**

Cassandra will need to be installed so you can run the database locally.  

```sh
brew install cassandra
```


## Run Project

Now that you have your system properly set up, you can `cd myRetail` and get to the project root directory.

### Seed database

Seed the database by running

```sh
rake cequel:keyspace:create
rake cequel:migrate
rails c
```

```irb
ProductPrice.create!(product_id: 13860428, value: BigDecimal("13.99"), currency_code: "USD")
```

### Run Server

From there you can run the following command to start the project server locally:

```ruby
rails s
```

It defaults to running it in `localhost:3000`, so point your browser there!

### API

This project has a RESTful API that accepts product ids from 
Red Sky: http://redsky.target.com/v2/pdp/tcin/13860428?excludes=taxonomy,price,promotion,bulk_ship,rating_and_review_reviews,rating_and_review_statistics,question_answer_statistics

* `GET /products/ID`
   Returns the product id, name, and current price (value and currency code) of product with ID
   ```json 
   {
     "id": 13860428,
     "name": "The Big Lebowski (Blu-ray)",
     "current_price": {
       "value": "13.99",
       "currency_code": "USD"
     }
   }
   ```
   
   Curl: `curl -X GET -H "Content-Type: application/json" http://localhost:3000/products/13860428`
* `PUT /products/ID`
  Updates the price of product with ID
  
  Request
  
  ```json
  {
    "id": 13860428,
    "current_price": {
      "value": "14.99",
      "currency_code": "USD"
    }
  }
  ```
  
  Response
  
  ```json
  {
    "id": 13860428,
    "name": "The Big Lebowski (Blu-ray)",
    "current_price": {
      "value": "14.99",
      "currency_code": "USD"
    }
  }
  ```
  
  Curl: `curl -X PUT -H "Content-Type: application/json" -d '{"current_price":{"value":"14.99","currency_code":"USD"}}' http://localhost:3000/products/13860428`

## Run Tests

### Create and migrate test database

```sh
RAILS_ENV=test rake cequel:keyspace:create
RAILS_ENV=test rake cequel:migrate
```

### Run rspec

This project uses [RSpec](https://rspec.info/) for testing. To run all tests in this project's test suite run:

```ruby
bundle exec rspec
```

## Workflow

All new code must go through a standard [pull request](https://help.github.com/en/articles/about-pull-requests) process.  Before being able to merge PRs the Cirrus CI build must pass.  

## Future Considerations

As this is a straight-forward proof of concept, it isn't a perfect solution. Some considerations for putting this to production use are:

* It always hits the RedSky API, there is no caching.  Caching will elliminate the round trip to RedSky and reduce the load from API calls on RedSky. However, if there is a cache then you need to have a way to invalidate the cache, or else your database has out of date information.  

* RedSky returns a great deal of information, far more than what this API uses.  A more precise query would lessen the load from RedSky and make decoding the information faster. 
