# effective_rte

effective_rte is a Rails 3.1 gem that provides a rich text editor for use inside web pages.

## Prerequisites

This gem uses jQuery and formtastic

## Installation

Inside your `Gemfile` add the following:

````ruby
gem "effective_rte"
````

### Rails 3.1

Add the following to `application.js` so it compiles to the asset_pipeline

````ruby
//= require effective_rte
````

Add the following to `application.css` so it compiles to the asset_pipeline

````ruby
*= require effective_rte
````

For integration with ActiveAdmin, add the following to 'config/initializers/active_admin.rb'
````ruby
config.register_stylesheet 'effective_rte.css'
config.register_javascript 'effective_rte.js'
````

The stylish_rte gem should now be setup and ready to use

### Rails 3.x

Nope.

### Usage

To replace the default text_area provider in formtastic:

````ruby
= form.input :body_text, :as => :effective_rte
````
