FactoryBot.define do
  factory :group do
    hashname {Faker::Hashtag.name}
  end
end