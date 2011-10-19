Factory.define :user do |user|
  user.email                  "user@example.com"
  user.password               "password"
  user.password_confirmation  "password"
end

Factory.define :client do |client|
  client.name "Test client"
end