# TryMe

TryMe provides a succinct method of calling and returning the first method, from a given list, which is available on an object.

You can use `try_me` in place of code flows like nested conditions combined with respons_to?.


```ruby
respond_to?(:some_method) ? some_method : other_method
```

For example, the preceding code could be replaced by the following code using `try_me`:

```ruby
try_me { some_method | other_method }
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'try_me'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install try_me

## Usage

```
object.try_me { some_method | other_method | ... }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WizardOfOgz/try_me. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
