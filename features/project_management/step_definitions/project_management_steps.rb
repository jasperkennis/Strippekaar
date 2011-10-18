Given /^I am logged in as "([^"]*)" with "([^"]*)" rights$/ do |login, role|
  @current_user = User.create!(
    :login => login,
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "#{login}@example.com",
    :role => role
  )

  # :create syntax for restful_authentication w/ aasm. Tweak as needed.
  # @current_user.activate! 

  visit '/users/login' 
  fill_in 'user_email', :with => login 
  fill_in 'user_password', :with => 'generic' 
  click_button 'Sign in'
end

Given /^I am on the clients overview$/ do
  @first_client = Client.create!(
    :name => 'First client'
  )
  
  @second_client = Client.create!(
    :name => 'Second client'
  )
  visit '/clients'
end

Then /^I should see all clients$/ do
  page.should have_content 'First client'
  page.should have_content 'Second client'
end

Then /^I should have the option to add a new client$/ do
  page.should have_content 'Add new client'
end

Given /^I am on the new client page$/ do
  visit '/clients/new'
end

When /^I complete the new client form$/ do
  fill_in 'client_name', :with => "First client"
  click_button 'Create Client' 
end

Then /^I should see a confirmation message$/ do
  page.should have_content '"First client" has been created'
end

Then /^I should redirect to the client page$/ do
  page.should have_content 'First client'
end

Given /^I am on a client page$/ do
  @first_client = Client.create!(
    :name => 'First client'
  )
  visit path_to @first_client
end

When /^I remove the client$/ do
  click_link "Delete client"
end

When /^I am on a client page$/ do
  @first_client = Client.create!(
    :name => 'First client'
  )
  visit path_to @first_client 
end

Then /^I should have the option to add users$/ do
  page.should have_content 'Add new user'
end

Then /^I should see users$/ do
  @first_client = Client.create!(
    :name => 'First client'
  )
  @first_porject_user = User.create!(
    :login => 'FirstUser',
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "FirstUser@example.com",
    :role => 'user'
  )
  @first_client_user.client = @first_client
  
  page.should have_content @first_client_user.name
end

Then /^I should have the option to remove the client$/ do
  page.should have_content 'Delete client'
end

Given /^I am on the new user page$/ do
  visit '/users/new'
end

When /^I complete the new user form$/ do
  fill_in 'user_name', :with => "First user"
  click_button 'Create user' 
end