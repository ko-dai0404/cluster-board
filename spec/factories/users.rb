FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    gender_id             { '2' }
    introduction          { '自己紹介をします'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/neko.png'), filename: 'neko.png')
    end
  
  end
end
