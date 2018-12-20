# ShacoClient

[![Build Status](https://travis-ci.org/TruRooms/shaco_client.svg?branch=master)](https://travis-ci.org/TruRooms/shaco_client)
[![Maintainability](https://api.codeclimate.com/v1/badges/ab9407e605abc307b88f/maintainability)](https://codeclimate.com/github/TruRooms/shaco_client/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ab9407e605abc307b88f/test_coverage)](https://codeclimate.com/github/TruRooms/shaco_client/test_coverage)

An easy to use API wrapper for the Shaco application

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shaco_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shaco_client

## Usage

Creating a client

    client = ShacoClient::Client.new('API_KEY_GOES_HERE')

    # Lists all available work.
    client.work.list

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/shaco_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ShacoClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/shaco_client/blob/master/CODE_OF_CONDUCT.md).
