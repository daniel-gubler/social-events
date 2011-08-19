class Address
  include Mongoid::Document
  field :city
  field :state
  field :zip
  field :country
  field :street1
  field :street2
  embedded_in :event, :inverse_of => :address

  validates_presence_of :street1, :city, :state, :zip, :country

  def to_s
    "#{street1} #{street2}, #{city}, #{state} #{zip}"
  end

end
