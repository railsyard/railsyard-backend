FactoryGirl.define do

  factory :book do
    sequence(:title) {|n| "Book ##{n}"}
  end

end
