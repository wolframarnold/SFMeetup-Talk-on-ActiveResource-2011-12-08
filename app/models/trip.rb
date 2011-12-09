class Trip < ActiveResource::Base

  self.site = "http://localhost:3000"

  schema do
    string  :name
    integer :id
    string  :created_at  # the only supported data types are string, integer and float, not datetime
    string  :updated_at  # JSON decoding will convert incoming datetimes automatically, so long ActiveSupport.parse_json_times is set to true
  end

  validates :name, :presence => true

end
