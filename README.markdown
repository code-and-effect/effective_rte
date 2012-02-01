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
//= require stylish_rte
````

Also add the following to `application.css` so it compiles to the asset_pipeline

````ruby
*= require stylish_rte
````

### Rails 3.x

Nope.

### Usage

To replace the default text_area provider in formtastic:

````ruby
= form.input :body_text, :as => :stylish_rte
````
