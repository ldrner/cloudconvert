# cloudconvert

[![Build Status](https://travis-ci.org/ldrner/cloudconvert.svg?branch=master)](https://travis-ci.org/ldrner/cloudconvert)

Simple wrapper for CloudConvert The convert API
[https://cloudconvert.com/api/conversions#convert](https://cloudconvert.com/api/conversions#convert)

# Configuration
``` ruby
  client = Cloudconvert.client(apikey: 'your_api_key')
```
## Usage

### Convert
``` ruby
  client.convert('path_to_file')
  => "https://{cloudconvert_process_url}"
```
### Status
``` ruby
  client.status("https://{cloudconvert_process_url}")
  => ["cloudconvert_process_status", "https://{file_download_url}"]
```
## Exception Handling

If Cloudconvert will return anything different from 200 OK status code, `Cloudconvert::APIError` will be raised. It contains `#message` and `#code` returned from API.

For example with invalid credentials you will receive:

``` ruby
  client.status("https://{invalid_cloudconvert_process_url}")
  #=> Cloudconvert::APIError: Process not found [404]
```
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
