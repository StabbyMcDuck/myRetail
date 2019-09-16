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

```ruby
gem install rails -v 5.2.3
```

Next you will need to install all of the libraries - get a drink, this will take awhile ☕️

```ruby
bundle install
```

**Cassandra**

Cassandra will need to be installed so you can run the database locally.  

```ruby
brew install cassandra
```

## Run Project

Now that you have your system properly set up, you can `cd myRetail` and get to the project root directory.

From there you can run the following command to start the project server locally:

```ruby
rails s
```

It defaults to running it in `localhost:3000`, so point your browser there!

## Run Tests

This project uses [RSpec](https://rspec.info/) for testing. To run all tests in this project's test suite run:

```ruby
bundle exec rspec
```

## Workflow

All new code must go through a standard [pull request](https://help.github.com/en/articles/about-pull-requests) process.  Before being able to merge PRs the Cirrus CI build must pass.  

