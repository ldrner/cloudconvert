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

For remote file url:
``` ruby
  client.convert('your_remote_file_url', {input: 'download', inputformat: 'remote_file_format'})
```

For local file path:
``` ruby
  client.convert('your_file_path', {input: 'upload', inputformat: 'file_format'})
```

:input & :inputformat - params required by Cloudconvert API

The 'convert' method returns full response of the cloudconvert API as Ruby Hash
``` ruby
  =>  {
        :id=>"SUVHDcKab3T6wAELYqyu",
        :url=>"//host1ibn9yl.cloudconvert.com/process/SUVHDcKab3T6wAELYqyu",
        :expire=>1525091552,
        :percent=>0,
        :message=>"Converting file to pdf",
        ...
      }
```

### Status
The 'status' method returns full response of the cloudconvert API as Ruby Hash
``` ruby
  client.status("https://{cloudconvert_process_url}")
  => {
      :id=>"SUVHDcKab3T6wAELYqyu",
      :url=>"//host1ibn9yl.cloudconvert.com/process/SUVHDcKab3T6wAELYqyu",
      :expire=>1525134033,
      :percent=>100,
      :message=>"Conversion finished!",
      ...
    }
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
