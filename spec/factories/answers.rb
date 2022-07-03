FactoryBot.define do
  sequence :body do |n|
    "#{n}answer"
  end  
  factory :answer do
    association :question
    body

    trait :invalid do
      body { nil}
    end  
  end
end
