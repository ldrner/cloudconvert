# cloudconvert

[![Build Status](https://travis-ci.org/ldrner/cloudconvert.svg?branch=master)](https://travis-ci.org/ldrner/cloudconvert)

Simple wrapper for CloudConvert The convert API
[https://cloudconvert.com/api/conversions#convert](https://cloudconvert.com/api/conversions#convert)

## Configuration
``` ruby
  client = Cloudconvert.client(apikey: 'your_api_key')
```
## Usage

### Convert

For remote file:
``` ruby
  client.convert('your_remote_file_url', {input: 'download', inputformat: 'remote_file_format'})
```

For local file:
``` ruby
  client.convert('your_file_path', {input: 'upload', inputformat: 'file_format'})
```

`:input` & `:inputformat` - parameters required by the convert API

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
