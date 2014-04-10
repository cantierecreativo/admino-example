FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email("#{first_name}.#{last_name}".downcase) }
    group { Contact.groups.to_a.sample.first }
  end
end
