class Togo < ActiveRecord::Base
  validates :place, :address, presence: true
  geocoded_by :address
  after_validation :geocode
end
