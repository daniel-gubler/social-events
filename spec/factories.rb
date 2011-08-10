require 'factory_girl'

Factory.define :user do |u|
  u.name 'Wolfgang Mozart'
  u.email 'wolfgang@mozart.555'
  u.password 'symphony40'
  u.password_confirmation 'symphony40'
end
