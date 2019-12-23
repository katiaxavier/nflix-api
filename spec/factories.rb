require_relative 'models/user_model'

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { 'Katia Kurenai' }
    email { 'katia@xavier.com' }
    password { '123katia' }

    # Depois que criar o usuario, deleta.
    after(:build) do |user|
      Database.new.delete_user(user.email)
    end
  end
end
