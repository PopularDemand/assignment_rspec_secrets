
FactoryGirl.define do

  factory :user, aliases: [:author] do
    name "Foo"
    sequence(:email) { |n| "#{n}foo@bar.com" }
    password 'foobar'
  end

  factory :secret do
    title "title"
    body "body"
    author
  end
end
