FactoryBot.define do
    factory :user do
      first_name {"Joe"}
      last_name {"Fresh"}
      email {"joe@gmail.com"}
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

  