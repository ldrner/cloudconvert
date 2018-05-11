FactoryBot.define do
  # after(:build) { |object| puts "Built #{object}" }

  factory :error_status_body, class: OpenStruct do
    error "Process not found"
    code 404
  end

  factory :success_body, class: OpenStruct do
    id "vCKuVn8jHoZgYlsE4NUP"
    url "//host123d1vz.cloudconvert.com/process/vCKuVn8jHoZgYlsE4NUP"
    expire 1525422653
    percent 0
    message "Preparing process"
    step "input"
    starttime 1525421153
    output { {url: "//host123d1vz.cloudconvert.com/download/~7eM92ymjLCQ3AIpcubh_3Vgshm0"} }
    input { {type: "download"} }
  end

  factory :succes_upload_body, class: OpenStruct do
    id "cUMQTReC8BJf0PmnNkW6"
    url "//host123d1w1.cloudconvert.com/process/cUMQTReC8BJf0PmnNkW6"
    expire 1524947740
    percent 0
    message "Converting file to pdf"
    step "convert"
    starttime 1524946600
    group "image"

    output do
      {url: "//host123d1w1.cloudconvert.com/download/~-PU7_yufcQ1HLZpd0IRh9iIJhAs"}
    end

    input do
      {
        filename: "2018-04-10_14-52-33.png",
        name: "2018-04-10_14-52-33",
        ext: "png",
      }
    end
    converter do
      {
        mode: "convert",
        format: "pdf",
        type: "imagemagick"
      }
    end
  end
end