class Event
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name, :type => String
  field :description, :type => String
  field :coordinates, :type => Array
  field :start_date, :type => DateTime
  field :end_date, :type => DateTime
  referenced_in :user, :inverse_of => :events
  embeds_one :address

  geocoded_by :address_string
  after_validation :geocode

  validates_presence_of :name, :start_date, :user, :address

  def address_string
    address.to_s
  end
end
