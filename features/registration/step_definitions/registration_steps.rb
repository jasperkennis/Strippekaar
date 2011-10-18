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

When /^I am on the users page$/ do
  visit '/users'
end

Then /^I should see a link with the text: "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end