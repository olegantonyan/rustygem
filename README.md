# Rustygem

This is a boilerplate example of Ruby gem with native extension written in Rust. It will compile on target system using gem's native mechanism, but you have to have Rust and Cargo installed on the target system.

It uses Ruby [Fiddle module](http://ruby-doc.org/stdlib-2.3.1/libdoc/fiddle/rdoc/Fiddle.html) to pass data between Ruby and Rust. For simplicity it uses JSON to pass complex data structures between Ruby and Rust.

You might want to use [Ruby ffi](https://github.com/ffi/ffi) to convert real types between Ruby and Rust, however, this requires more effort and possibly leads to memory management errors. But JSON is dead simple and robust.

Also, take a look at [Helix project](https://github.com/rustbridge/helix), which creates nice boilerplate-free API to communicate with Rust in Ruby.

## Installation

You must have Rust with Cargo installed in order to build native extension. Get it on [rust-lang.org](https://www.rust-lang.org/).

Clone this repo and run `rake compile` to compile Rust source code into dynamic library. Then you can test it with `rake run`:

```sh
git clone git@github.com:olegantonyan/rustygem.git
cd rustygem
rake compile
rake run
```

To integrate it into you Ruby application, add this line to your application's Gemfile:

```ruby
gem 'rustygem', github: 'olegantonyan/rustygem'
```

And then execute:

```sh
bundle install
```

## Usage

Call `Rustygem.perform` with a Hash argument, like this `{ some_integer: 32, some_string: 'hello' }`. Refer to source code to see how it works.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/rustygem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
