# AdminLTE for Rails

This is an attempt to create a reusable gem for [AdminLTE theme](http://almsaeedstudio.com).

Don't use this gem since it's changing a lot at the moment.

You might be better off using [adminlte2-rails](https://github.com/nicolas-besnard/adminlte2-rails) gem - at least for now ;)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'admin_lte_rails'
```

And then execute:

    $ bundle

## Usage

The easiest way to get started is to generate views

```ruby
rails generate admin_lte_rails:views
```

Then in your controller define `layout 'admin_lte'` to use the new theme.

For possible widgets and options check out [theme's homepage](https://almsaeedstudio.com/preview).

## Template regions

You can use `content_for` with the following regions:

- `content_for(:admin_title)`
- `content_for(:admin_topbar)`
- `content_for(:admin_sidebar)`

For adding extra stylesheets/javascripts use

- `content_for(:stylesheets)` - added to the head after theme stylesheets
- `content_for(:javascripts)` - added to the end of page's body after themes javascripts

![Regions](https://cloud.githubusercontent.com/assets/9228/7230288/8de77238-e76c-11e4-9772-48bf1aabbc41.png)

## Plugins

If you want to use plugins you have to manually load them.

Setup example for iCheck plugin:

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w(
  jquery-icheck.js jquery-icheck/skins/all.css
)
```

Add plugin to your Gemfile

```ruby
  source 'https://rails-assets.org'
  gem 'rails-assets-jquery-icheck'
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
