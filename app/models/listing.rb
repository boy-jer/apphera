class Listing < ActiveRecord::Base
  attr_accessible :city, :content_provider, :name, :organization_id, :phone, :street, :zip
  belongs_to :organization
end
