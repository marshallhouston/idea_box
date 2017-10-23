FactoryBot.define do
  factory :user do
    name "Julio Hightower"
  end

  # This will use the User class (Admin would have been guessed)
 # factory :admin, class: User do
 #   first_name "Admin"
 #   last_name  "User"
 #   admin      true
 # end


end
