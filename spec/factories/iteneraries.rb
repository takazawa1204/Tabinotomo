FactoryBot.define do
  factory :itenerary do
    title { Faker::Lorem.characters(number:5) }
    edit_password { 'password' }
  end
end
