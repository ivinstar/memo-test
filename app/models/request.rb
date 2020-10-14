class Request < ActiveRecord::Base

  validates :content, presence: true
end
