
FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :project_name do |n|
    "project_name#{n}"
  end
  
  factory :code_reference do
    number { "MyString" }
    body { "MyText" }
  end

  factory :review_answer do
    complete { false }
    body { "MyString" }
    sheet_number { "MyString" }
    code_reference { "MyString" }
    review_question
    project
  end

  factory :review_question do
    body { "MyString" }
    code_reference { "MyString" }
    order { 1 }
    review_category
  end

  factory :review_category do
    name { "MyString" }
    order { 1 }
  end

  factory :project do
    name { generate(:project_name) }
    address { "MyString" }
    filenumber { "MyString" }
    paid { true }
    user
  end
  
  factory :user do
    first_name {"Joe"}
    last_name {"Fresh"}
    email
    password {"blahblah"}
    admin { false }
  end

  factory :purchase do
    user
    stripe_charge_id { "MyString" }
    amount_in_cents { 1 }
    card_last4 { "4323" }
    card_exp_month { 1 }
    card_exp_year { 22 }
    card_type { "Visa" }
  end
  
  factory :tag do
    name { "MyString" }
  end

  factory :tagging do
    tag
    # association :taggable, factory: :lesson
  end

end

  