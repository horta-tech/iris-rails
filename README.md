# Iris

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/iris`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iris_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iris_rails

## Usage

After installing, run the genereator provided by the gem:

```
rails generate iris:install 
```

The generator creates an initializer file and default controllers and views:

```
|-- app
    |-- controllers
        |-- iris_rails
            |-- base_controller.rb
            |-- posts_controller.rb
    |-- views
        |-- iris_rails
            |-- posts
                |-- index.html.erb
                |-- show.html.erb
    |-- helpers
        |-- meta_tags_helper.rb

|-- config
    |-- initializers
        |-- iris_rails.rb
|-- lib
    |-- iris_rails.rb
```

It also adds routes to your `routes.rb`  file:

```ruby
    scope :module => 'iris_rails' do
      get '/blog' => 'posts#index', :as => :iris_blog
      get '/blog/:slug' => 'posts#show', :as => :iris_post
    end
```

After running the generator, set your API token in `config/initializers/iris_rails.rb`

## Customization

Extending and customizing your blog is easy.

Define in `app/controllers/iris_rails/base_controller.rb` the layout you will use. If you have some verifications the page, make sure to copy them to IrisRails::BaseController.

Iris_Rails uses a helper method to define title, meta tags (meta title, meta description and meta keywords) and use CSS with the template defined in iris website (iriseo.com). Make sure you select the template in iris.com/settings so your blog has a nice look! Add the lines below to the layout you will use and and set title and meta tags of your website.

<%= iris_meta_tags ( head_title: `INSERT_WEBSITE_TITLE`, meta_description: `INSERT_WEBSITE_META_DESCRIPTION`, meta_keywords: `INSERT_WEBSITE_META_KEYWORDS` ) %>

Insert your website title in `INSERT_WEBSITE_TITLE`, meta_description in `INSERT_WEBSITE_META_DESCRIPTION` and meta_keywords in `INSERT_WEBSITE_META_KEYWORDS`. Don't create a tag with these attributes if you are using the method iris_meta_tags because duplicated attributes lower the SEO score. If you don't have these attributes, just leave it in blank ("").

Now start your server to view your blog.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/horta-tech/iris-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Iris project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/horta-tech/iris-rails/blob/master/CODE_OF_CONDUCT.md).
