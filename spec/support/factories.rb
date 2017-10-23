FactoryBot.define do
  factory :idea do
    name "Jobs"
    description "find a new job"
    admin false
  end

  
  # This will use the User class (Admin would have been guessed)
 # factory :admin, class: User do
 #   first_name "Admin"
 #   last_name  "User"
 #   admin      true
 # end


end
