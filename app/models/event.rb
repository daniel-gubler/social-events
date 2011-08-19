class Event
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name
  field :description
  field :coordinates, :type => Array
  field :start_date, :type => Date
  field :end_date, :type => Date
  field :start_time, :type => Time
  field :end_time, :type => Time

  referenced_in :user, :inverse_of => :events
  embeds_one :address
  accepts_nested_attributes_for :address

  geocoded_by :address_string
  after_validation :geocode

  validates_presence_of :name, :start_date, :user, :address

  def address_string
    address.to_s
  end
end
