require 'factory_girl'

Factory.define :user do |u|
  u.name 'Wolfgang Mozart'
  u.sequence(:email) { |n| "wolfgang#{n}@mozart.555" }
  u.password 'symphony40'
  u.password_confirmation 'symphony40'
end

Factory.define :address do |a|
  a.street1 '1696 Rainbow Road'
  a.city 'Santa Clara'
  a.state 'UT'
  a.country 'USA'
  a.zip '84765'
end

Factory.define :event do |e|
  e.association :user
  e.address FactoryGirl.build(:address)
  e.name 'Chess Tourn'
  e.start_date Time.now + 5.months
end
