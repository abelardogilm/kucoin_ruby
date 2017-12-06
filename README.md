# KuCoin API Client

A Ruby client for the [Kucoin](https://www.kucoin.com/#/?r=E57fFl/) API.

## Overview

This Ruby Gem attempts to add a layer to communicate with [KuCoin API documentation](http://docs.kucoinapidocs.apiary.io/) making easy connect with it. 31 endpoits are implemented but some of them
are not working correctly yet

## Getting started

### Installation

Add gem to your Gemfile
`gem 'kucoin_ruby'`

Some of API endpoints are open, like exchange or market information.
No credentials are required to use them, but if you want to use private endpoints
you will need to define your KuCoin **API credentials** as ENV vars of your project:

```
KUCOIN_KEY=YOUR_KEY
KUCOIN_SECRET=YOUR_SECRET
```

## Usage

All Kucoin methods are class methods, just call it with expected parameters

### Currency

```ruby
  KucoinRuby::Currency.exanges
```

### Language

```ruby
  KucoinRuby::Language.lang_list
  KucoinRuby::Language.change_lang 'en_US' # Not working as expected
```

### User

```ruby
  KucoinRuby::User.user_info
```

### Inviting

```ruby
  KucoinRuby::Invinting.invitation_count
  KucoinRuby::Invinting.promotion_reward
  KucoinRuby::Invinting.promotion_summary
```

### Operations

COIN: "BTC", "ETH", "NEO"...

```ruby
  KucoinRuby::Operations.get_coin_address(<COIN>)
  KucoinRuby::Operations.create_withdrawal(<COIN>, <AMOUNT>, <ADDRESS>) # Not working as expected
  KucoinRuby::Operations.cancel_withdrawal(<COIN>, <OP_ID>) # Not working as expected
  KucoinRuby::Operations.wallet_records(<COIN>, <TYPE>, <STATUS>, <LIMIT>, <PAGE>) # Not working as expected
  KucoinRuby::Operations.coin_balance(<COIN>)
  KucoinRuby::Operations.balance
```

### Trading

Symbol: "ETH-BTC", "BTC-ETH", "GVT-BTC"...

```ruby
  KucoinRuby::Trading.create_order(<SYMBOL>, <TYPE>, <PRICE>, <AMOUNT>) # Not tested yet
  KucoinRuby::Trading.active_orders(<SYMBOL>)
  KucoinRuby::Trading.cancel_order(<SYMBOL>, <ORDER_ID>, <TYPE>) # Not tested yet
  KucoinRuby::Trading.dealt_orders(<SYMBOL>, <TYPE>, <LIMIT>, <PAGE>, <SINCE>, <BEFORE>)
  KucoinRuby::Trading.symbol_dealt_order(<SYMBOL>, <TYPE>, <LIMIT>, <PAGE>)
```

### Market

```ruby
  KucoinRuby::Market.tick(<SYMBOL>)
  KucoinRuby::Market.orders(<SYMBOL>)
  KucoinRuby::Market.buy_orders(<SYMBOL>, <GROUP>, <LIMIT>)
  KucoinRuby::Market.sell_orders(<SYMBOL>, <GROUP>, <LIMIT>)
  KucoinRuby::Market.recent_deal_orders(<SYMBOL>, <LIMIT>, <SINCE>)
  KucoinRuby::Market.trading_symbols
  KucoinRuby::Market.trending_symbols
  KucoinRuby::Market.kline_data(<SYMBOL>, <TYPE>, <FROM>, <TO>, <LIMIT>)
  KucoinRuby::Market.kline_config
  KucoinRuby::Market.chart_symbol(<SYMBOL>)
  KucoinRuby::Market.history_kline_data(<SYMBOL>, <RESOLUTION>, <FROM>, <TO>)
  KucoinRuby::Market.coin_info(<COIN>)
  KucoinRuby::Market.coins

```

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
