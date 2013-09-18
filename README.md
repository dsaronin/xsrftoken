xsrftoken
==========

XSRF token generation and validation gem with accompanying faraday-middleware

I wrote this as part of a project, but I ended up not needing it. No tests have been written yet;
please contribute by writing tests. I have manually tested the xsrftoken methods.

There are two parts to this gem.

* xsrftoken (stand-alone gem that can generate and validate a time-stamped style of xsrf token).
* xsrf faraday middleware (which on second thought doesn't make sense as the client doesn't gen the xrsf
token! But I include it here in case someone want to reframe it as rack middleware).

## xsrftoken usage:

*Place in Gemfile:*

```
  gem 'xsrftoken'
```

  then run bundle install

*in ruby code:*


```
  require 'xsrftoken'
```

*to generate a token (note the constants are for data type reference only):*


```
    ACTIONID = '/index'  # better would be the actual path of the request
                 # actually any key unique to your server application
    SECRET_KEY = '22b0d106033113df5b06d6c042f1a7457b0f93ee85fd7eb53dec1c4f009dc27a'
    USER_ID = 'lou_mcgoo_123'  # any user id identifier for requester


    @xsrf = ::Xsrftoken.generate( SECRET_KEY, USER_ID, ACTIONID )
```

now @xsrf can be used to populate the correct html field to send to a requester.


*to validate a token received from an html response:*


```
  ::Xsrftoken.valid?( @response_token, SECRET_KEY, USER_ID, ACTIONID )
```

will return true if a valid token, false if not valid token, nil if mal-formed token

## faraday-middleware

Note, I've concluded that it doesn't make sense the way I wrote it (clients dont create
and validate xsrf tokens!), but the middleware is included. So here's how to use it.

*Place in Gemfile*

```
  gem 'faraday'
  gem 'faraday_middleware'
```

run bundle install.

*in setup_connection for faraday*

```
  faraday.request  :xsrf        # xsrf token generation and validation
```

## references

I patterned the xsrftoken class after a golang package: 

https://code.google.com/p/xsrftoken/source/browse/xsrf.go
