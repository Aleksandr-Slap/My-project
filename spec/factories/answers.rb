FactoryBot.define do
  sequence :body do |n|
    "#{n}answer"
  end  
  factory :answer do
    user
    question
    body

    trait :invalid do
      body { nil}
    end
  end
end
