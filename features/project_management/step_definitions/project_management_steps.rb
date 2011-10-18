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
  @first_project = Project.create!(
    :name => 'First project'
  )
  
  @second_project = Project.create!(
    :name => 'Second project'
  )
  visit '/projects'
end

Then /^I should see all projects$/ do
  page.should have_content 'First project'
  page.should have_content 'Second project'
end

Then /^I should have the option to add a new project$/ do
  page.should have_content 'Add new project'
end

Given /^I am on the new project page$/ do
  visit '/projects/new'
end

When /^I complete the new project form$/ do
  fill_in 'project_name', :with => "First project"
  click_button 'Create project' 
end

Then /^I should see a confirmation message$/ do
  page.should have_content '"First project" has been created'
end

Then /^I should redirect to the project page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am on a project page$/ do
  @first_project = Project.create!(
    :name => 'First project'
  )
  visit path_to @first_project
end

When /^I remove the project$/ do
  click_link "Delete project"
end

When /^I am on a project page$/ do
  @first_project = Project.create!(
    :name => 'First project'
  )
  visit path_to @first_project 
end

Then /^I should have the option to add users$/ do
  page.should have_content 'Add new user'
end

Then /^I should see users$/ do
  @first_project = Project.create!(
    :name => 'First project'
  )
  @first_porject_user = User.create!(
    :login => 'FirstUser',
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "FirstUser@example.com",
    :role => 'user'
  )
  @first_project_user.project = @first_project
  
  page.should have_content @first_project_user.name
end

Then /^I should have the option to remove the project$/ do
  page.should have_content 'Delete project'
end