FactoryBot.define do
  sequence :title do |n|
    "#{n}Question title"
  end
  factory :question do
    user
    body  { "Question body" }
    title
  end

  trait :invalid do
    title {nil}
  end
end
