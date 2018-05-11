# cloudconvert
[![Build Status](https://travis-ci.org/ldrner/cloudconvert.svg?branch=master)](https://travis-ci.org/ldrner/cloudconvert)
[![Maintainability](https://api.codeclimate.com/v1/badges/d402008317c8f6cc6715/maintainability)](https://codeclimate.com/github/ldrner/cloudconvert/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d402008317c8f6cc6715/test_coverage)](https://codeclimate.com/github/ldrner/cloudconvert/test_coverage)

Simple wrapper for CloudConvert The convert API
[https://cloudconvert.com/api/conversions#convert](https://cloudconvert.com/api/conversions#convert)

## Configuration
``` ruby
  client = Cloudconvert.client(apikey: 'your_api_key')
```
## Usage

### Convert

For remote or local file:
``` ruby
  client.convert(file_location, file_format, options = {})
```
pass in `:options` additional parameters of the convert API

The `#convert` method returns `Cloudconvert::Api::Response` object
``` ruby
  => #<Cloudconvert::Api::Response:0x007fd45be450c0
    @output_url="https://host123d1w1.cloudconvert.com/download/~otIQ4ymiJAZIDKoOuYBK2V8hsXg",
    @process_url="https://host123d1w1.cloudconvert.com/process/9rfMVo0H7cz5YTFA3CbE",
    @step="input">
```

### Status
To get process status use:

``` ruby
  client.status("https://{cloudconvert_process_url}")
```
Like `#convert`, the `#status` method returns `Cloudconvert::Api::Response` object.

## Exception Handling

If Cloudconvert will return anything different from 200 OK status code, `Cloudconvert::APIError` will be raised. It contains `#message` and `#code` returned from API.

For example with invalid credentials you will receive:

``` ruby
  client.status("https://{invalid_cloudconvert_process_url}")
  => Cloudconvert::APIError: Process not found [404]
```
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
