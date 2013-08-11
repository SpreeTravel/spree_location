SpreeLocation
=============

Add latitude and longitude to Spree::Product model.

Installation
------------

Add spree_location to your Gemfile:

```ruby
gem 'spree_location'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_location:install
```

Copy migrations from spree_location to application:

bundle exec rake spree_location:install:migrations

