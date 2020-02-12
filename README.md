# OmniAuth WIP

[![Gem Version](https://badge.fury.io/rb/omniauth-wip.svg)](http://badge.fury.io/rb/omniauth-wip)

This gem contains the WIP ([https://wip.chat](https://wip.chat)) strategy for OmniAuth.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/omniauth/omniauth) to get started.

Now sign in into the [WIP OAuth Applications page](http://wip.chat/oauth/applications) and create an application. Take note of your Application UID and Secret because that is what your web application will use to authenticate against the WIP API. Make sure to set a correct callback URL or else you may get authentication errors. Usually this is something like `https://example.com/auth/wip/callback`. NOTE: Callback URLs need to use HTTPS, except for localhost.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-wip'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-wip', github: 'marckohlbrugge/omniauth-wip'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wip, "APPLICATION_UID", "SECRET"
end
```

Replace `"APPLICATION_UID"` and `"SECRET"` with the appropriate values you obtained [earlier](https://wip.chat/oauth/applications).


## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => "wip",
  :uid => "1",
  :info => {
    :name => "Marc Köhlbrugge",
    :username => "marc",
    :url => "https://wip.chat/@marc"
  },
  :credentials => {
    :token => "a1b2c3d4...", # The OAuth 2.0 access token
    :secret => "abcdef1234"
  },
  :extra => {
    :access_token => "", # An OAuth::AccessToken object
    :raw_info => {
      :name => "Marc Köhlbrugge",
      :username => "marc",
      :url => "https://wip.chat/@marc"
    }
  }
}
```
