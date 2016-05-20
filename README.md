[![Gem Version](https://badge.fury.io/rb/rubocop-facter.svg)](http://badge.fury.io/rb/rubocop-facter)
# rubocop-facter

The goal of `rubocop-facter` is to extend RuboCop to support Facter-specific checks.
There are various "gotchas" that apply to Facter specifically, and not general Ruby programming.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-facter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubocop-facter

## Usage

Add the following to your Puppet module's `.rubocop.yml` file:

```ruby
require:
  - rubocop-facter
```

General RuboCop installation and usage instructions can be found in the [RuboCop README](https://github.com/bbatsov/rubocop).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pizzaops/rubocop-facter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
