<h1 align="center">KuCoin API Client</h1>

<p align="center">
  A Ruby client for the [KuCoin](https://www.kucoin.com/) API.
</p>

## Overview

This Ruby Gem attempts to add a layer to communicate with [KuCoin API documentation](http://docs.kucoinapidocs.apiary.io/) making easy connect with it. 31 endpoits are implemented but some of them
are not working correctly yet

## Getting started

### Installation

Add gem to your Gemfile
`gem 'kucoin_ruby'`

Define your KuCoin API credentials as ENV vars of your project:

```
KUCOIN_KEY=YOUR_KEY
KUCOIN_SECRET=YOUR_SECRET
```

### Usage

All Kucoin methods are class methods, just call it with expected parameters

```ruby
  Kucoin::Currency.exanges
```

WIP

## Donations

ETH **0x033c3f91a009f55236cf1b74811d118870bc6ebe**

BTC **1AiVzBv3B1813wmfAJzFhHHLur2FzJaDyM**

LTC **LPz1pegDmdaSDWBaxBMEqV9Qn4vw2hLSN6**

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abelardogilm/kucoin_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KucoinRuby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/abelardogilm/kucoin_ruby/blob/master/CODE_OF_CONDUCT.md).
