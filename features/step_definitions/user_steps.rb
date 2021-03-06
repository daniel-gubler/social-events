Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^\"]*)" with an email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  User.new(:name => name,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Then /^I should already be signed in$/ do
  And %{I should see "Logout"}
end

Given /^I am logged in$/ do
  Given %{I am a user named "foo" with an email "user@test.com" and password "please"}
  When %{I sign in as "user@test.com/please"}
  Then %{I should be signed in}
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the register page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
  And %{I press "Sign Up"}
  Then %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  Then %{I am not logged in}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

Given /^I am not logged in$/ do
  Given %{I sign out}
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the login page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Login"}
end

Then /^I should be signed in$/ do
  Then %{I should see "Logout"}
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  And %{I should see "Register"}
  And %{I should see "Login"}
  And %{I should not see "Logout"}
end
