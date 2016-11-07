[![Code Climate](https://codeclimate.com/github/andela-mogala/shot_api_gem/badges/gpa.svg)](https://codeclimate.com/github/andela-mogala/shot_api_gem)  [![Build Status](https://travis-ci.org/andela-mogala/shot_api_gem.svg?branch=master)](https://travis-ci.org/andela-mogala/shot_api_gem)

# ShotApiGem

Shot api gem was built out of a desire to make interactions with the [turbo-url](http://turbo-url.herokuapp.com) api a hassle free process. It does the job of communicating with the api and returns ruby objects that you can use directly in your code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shot_api_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shot_api_gem

## Usage
This gem is intended for use directly with your ruby code. The entry point to all interactions with the turbo-url api is from the ShotApiGem::Consumer class.
This class accepts an api key when creating an instance.

### Getting an API key.
* Create an account on [turbo-url](http://turbo-url.herokuapp.com) if you don't already have one
* Visit your dashboard and find the `Generate API Key` button.
* Clicking on this button generates an api key.
* You can now copy this key and use it with the gem

### Making requests
Start by creating an instance of Consumer class

```ruby
resource = ShotApiGem::Consumer.new(api_key)
```

You can now call methods like

```ruby
resource.fetch_all
```
This returns an array of links that you have created with your account.

```ruby
resource.fetch(1)
```
Returns the link with `{ id: 1 }`

```ruby
resource.create({ url: 'somelink.com', slug: 'slk' })
```
creates a new link and returns the created link as an object

```ruby
resource.update(1, { url: 'anotherlink.com', slug: 'anlk' })
```
updates the link with `{ id: 1 }` and returns the updated link as an object

```ruby
resource.delete(1)
```
deletes the link with `{ id: 1 }` but doesn't return any content

A typical Link object has the following properties:
* id
* url
* slug
* active
* clicks
* title
* date_created
* date_updated

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-mogala/shot_api_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

