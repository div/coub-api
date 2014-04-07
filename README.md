[![Build Status](https://travis-ci.org/div/coub-api.svg?branch=master)](https://travis-ci.org/div/coub-api)
# Coub::Api

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'coub-api', github: 'div/coub-api'

And then execute:

    $ bundle

## Usage
```
r = Coub.search 'stuff', sort_by: :date
coubs = r.coubs
=> [...]
users = r.users
=> [...]
pagination = r.pagination
=> {"page"=>1, "total_pages"=>11, "per_page"=>10}
c = coubs.first
=> {...}
embed = Coub.oembed c.permalink
=> {...}
embed.html
=> "<iframe src=\"http://coub.com/embed/12438d40\" allowfullscreen=\"true\" frameborder=\"0\" width=\"640\" height=\"359\"></iframe>"