# Kyubi
Supports settings of page specified assets load and precompile at Ruby on Rails.

## Usage
In `config/application.rb`
```ruby
require "kyubi/railtie"
```

In `app/views/layout/application.html.erb`
```ruby
<%= kyubi_stylesheet_link_tag media: 'all' %>
<%= kyubi_javascript_include_tag 'data-turbolinks-track' => 'reload' %>
```

### Assets
Kyubi expects `app/assets/views` folder has same structures with `app/views` folder.
```
app  
+-- assets  
    +-- stylesheets   
    +-- javascripts  
    +-- views  
        +-- top
            +-- shared.css
            +-- index.css  
            +-- index.js  
+-- views
    +-- top
        +-- index.html.erb
```

when top/index view rendering, index.css and index.js are loaded by kyubi tag helper.  
※ `shared` is also loaded with same controllers.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'kyubi'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install kyubi
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
