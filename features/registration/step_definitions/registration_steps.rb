Given /^I am logged in as Admin$/ do
  @current_user = User.create!(
    :login => login,
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "#{login}@example.com"
  )

  # :create syntax for restful_authentication w/ aasm. Tweak as needed.
  # @current_user.activate! 

  visit "/login" 
  fill_in("login", :with => login) 
  fill_in("password", :with => 'generic') 
  click_button("Log in")
  response.body.should =~ /Logged/m  
end

When /^I am on the users page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a link with the text: "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end