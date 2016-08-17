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

You need to tell RuboCop to load the Facter extension. There are three
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```
require: rubocop-facter
```

Now you can run `rubocop` and it will automatically load the RuboCop Facter
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-facter
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-facter'
  task.options = ['-D', '-S', '-E']
end
```

The flags `-D -S -E` used make the output a lot more useful, providing extra detail, links to the style guide, and give the cop name that failed:

```
-D, --display-cop-names          Display cop names in offense messages.
-E, --extra-details              Display extra details in offense messages.
-S, --display-style-guide        Display style guide URLs in offense messages.
```

## The Cops

All cops are located under
[`lib/rubocop/cop/facter`](lib/rubocop/cop/facter), and contain
examples/documentation.

In your `.rubocop.yml`, you may treat the facter cops just like any other
cop. For example:

```yaml
Facter/FacterUtil:
  Exclude:
    - lib/facter/my_fact_to_ignore.rb
```

General RuboCop installation and usage instructions can be found in the [RuboCop README](https://github.com/bbatsov/rubocop).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pizzaops/rubocop-facter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
