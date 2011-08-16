class Address
  include Mongoid::Document
  field :name
  field :company_name
  field :county
  field :city
  field :state
  field :zip
  field :country
  field :street
  field :suite
  embedded_in :event, :inverse_of => :address

  validates_presence_of :street, :city, :state, :zip

  def to_s
    street.to_s + ', ' + city.to_s + ', ' + state.to_s + ' ' + zip.to_s
  end

end
