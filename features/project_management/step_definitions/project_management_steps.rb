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

Given /^I am on the projects overview$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see all projects$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should have the option to add a new project$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am on the new project page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I complete the new project form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a confirmation message$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should redirect to the project page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am on a project page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I remove the project$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I am on a project page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should have the option to add users$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see users$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should have the option to remove the project$/ do
  pending # express the regexp above with the code you wish you had
end