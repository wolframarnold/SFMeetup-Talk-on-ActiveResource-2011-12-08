class Comment < ActiveResource::Base

  self.site = "http://localhost:3000"

  schema do
    string :body
  end

  validates :body, :presence => true

end
