# https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md

FactoryBot.define do
  factory :user do
    name "Julio Hightower"
    email "jh@bama.com"
    password "test"
  end

  factory :idea do
    name "sleep more"
    description "rest early and often"
    user #this creates a belongs_to association with user in this factory
    category
  end

  factory :category do
    name "habits"
    description "ideas about good habits"
  end

  factory :image do
    name "image_1"
    url "https://unsplash.com/photos/b_8eErngWm4"
  end

  
  # This will use the User class (Admin would have been guessed)
 # factory :admin, class: User do
 #   first_name "Admin"
 #   last_name  "User"
 #   admin      true
 # end


end
