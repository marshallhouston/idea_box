# https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md

FactoryBot.define do
  factory :user do
    name "Julio Hightower"
  end

  factory :idea do
    name "sleep more"
    description "rest early and often"
    user #this creates a belongs_to association with user in this factory
  end

  # This will use the User class (Admin would have been guessed)
 # factory :admin, class: User do
 #   first_name "Admin"
 #   last_name  "User"
 #   admin      true
 # end


end
