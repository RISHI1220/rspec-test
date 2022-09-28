FactoryBot.define do
    # factory :user do
    #     firstName { "John" }
    #     lastName { "Doe" }
    #     email { "jognDoe@asd.com" }
    #     active { true }
    # end
    factory :random_user, class: User do
        firstName { Faker::Name.first_name }
        lastName { Faker::Name.last_name }
        email { Faker::Internet.safe_email }
        active { true }
    end
end