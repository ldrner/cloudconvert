FactoryBot.define do
  factory :success_body, class: OpenStruct do
    id "vCKuVn8jHoZgYlsE4NUP"
    url "//host123d1vz.cloudconvert.com/process/vCKuVn8jHoZgYlsE4NUP"
    expire 1525422653
    percent 0
    message "Preparing process"
    step "input"
    starttime 1525421153

    factory :output do
      url "//host123d1vz.cloudconvert.com/download/~7eM92ymjLCQ3AIpcubh_3Vgshm0"
    end

    factory :input do
      type "download"
    end
  end
end