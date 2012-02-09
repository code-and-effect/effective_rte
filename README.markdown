# stylish_rte

stylish_rte is a Rails 3.1 gem that provides a rich text editor for use inside web pages.

## Prerequisites

This gem uses jQuery and formtastic

## Installation

Inside your `Gemfile` add the following:

````ruby
gem "stylish_rte"
````

### Rails 3.1

Add the following to `application.js` so it compiles to the asset_pipeline

````ruby
//= require stylish_rte/stylish_rte
````

Then run the installer

````ruby
rails generate stylish_rte:install
````

And migrate your database
````ruby
rake db:migrate
````

The stylish_rte gem should now be setup and ready to use

### Rails 3.x

Nope.

### Usage

To replace the default text_area provider in formtastic:

````ruby
= form.input :body_text, :as => :stylish_rte
````

### Testing

To run the StylishRte rspec tests, simply:

````ruby
/stylish_rte/ > rake test
````

But you also might have to set up the environment first:

````ruby
bundle exec rake -f spec/dummy/Rakefile db:drop db:create db:migrate db:test:prepare
rake db:migrate RAILS_ENV=test
````
