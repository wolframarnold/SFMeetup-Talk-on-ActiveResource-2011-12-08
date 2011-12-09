#ActiveResource::Base.logger = Rails.logger

Rails.configuration.after_initialize do

  # Will output ISO 8601-compliant strings for DateTimes (this is the default)
  # ActiveSupport::JSON::Encoding.use_standard_json_time_format = true

  require 'active_support/json/decoding'
  # will cast ISO 8601-compliant strings back to a DateTime object
  ActiveSupport.parse_json_times = true
end
