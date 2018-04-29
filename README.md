# cloudconvert

[![Build Status](https://travis-ci.org/ldrner/cloudconvert.svg?branch=master)](https://travis-ci.org/ldrner/cloudconvert)

CloudConvert convert API wrapper
[https://cloudconvert.com/api/conversions#convert](https://cloudconvert.com/api/conversions#convert)

# Configuration
``` ruby
  Cloudconvert.configure do |config|
    config.apikey = 'your_api_key'
  end
```
## Usage

### Convert
``` ruby
  Cloudconvert.convert('path_to_file')
  => "https://{cloudconvert_process_url}"
```
### Status
``` ruby
  Cloudconvert.status("https://{cloudconvert_process_url}")
  => ["cloudconvert_process_status", "https://{file_download_url}"]
```
## Exception Handling

If Cloudconvert will return anything different from 200 OK status code, `Cloudconvert::Error` will be raised. It contains `#error` and `#code` returned from API.

For example with invalid credentials you will receive:

``` ruby
  Cloudconvert.status("https://{invalid_cloudconvert_process_url}")
  #=> Cloudconvert::Error: Process not found [404]
```
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
