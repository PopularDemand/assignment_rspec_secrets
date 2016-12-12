FactoryGirl.define do

  factory :user do
    name "Foo"
    sequence(:email) { |n| "#{n}foo@bar.com" }
    password 'foobar'
  end

end
