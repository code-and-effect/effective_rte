# Effective RTE

Provides a formtastic textarea replacement input based on the WYMEditor (http://www.wymeditor.org) 1.0.0b5

Rails >= 3.2.x, Ruby >= 1.9.x.  Has not been tested/developed for Rails4.

DONT USE THIS GEM.  The WymEditor isn't compatible with later versions of jQuery

## Getting Started

Add to Gemfile:

```ruby
gem 'effective_rte'
```

Run the bundle command to install it:

```console
bundle install
```

Require the javascript in your application.js

```ruby
//= require effective_rte
```

And the stylesheet in your application.css

````ruby
*= require effective_rte
````

(optional) For integration with ActiveAdmin, add the following to 'config/initializers/active_admin.rb'

````ruby
config.register_stylesheet 'effective_rte.css'
config.register_javascript 'effective_rte.js'
````

## Usage

To use in place of a text_area, in formtastic:

````ruby
= form.input :body_text, :as => :effective_rte
````

## License

MIT License.  Copyright Code and Effect Inc. http://www.codeandeffect.com

You are not granted rights or licenses to the trademarks of Code and Effect

## Credits

The authors of this gem have nothing to do with the following awesome project:

WYMEditor (http://www.wymeditor.org)


