# AdminLTE for Rails

This is an attempt to create a reusable gem for [AdminLTE theme](http://almsaeedstudio.com)

Don't use this gem since it's changing a lot at the moment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'admin_lte_rails'
```

And then execute:

    $ bundle

## Usage

If you want to use plugins you have to manually load them.

Setup example for iCheck plugin:

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w(
  jquery-icheck.js jquery-icheck/skins/all.css
)
```

If you're using gems default layout you'll have to add assets
by using `content_for :stylesheets` and `content_for :javascripts`.

```haml
# views/sessions/_form.html.haml
- content_for :stylesheets do
  = stylesheet_link_tag 'jquery-icheck/skins/all'

- content_for :javascripts do
  = javascript_include_tag 'jquery-icheck'
  :javascript
    $(function () {
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
      });
    });
```


## Contributing

1. Fork it ( https://github.com/lenart/admin_lte_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
