FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@i.com'}
    password              {'ppp000'}
    password_confirmation {password}
    last_name             {'黒'}
    first_name            {'白'}
    last_name_furigana    {'クロ'}
    first_name_furigana   {'シロ'}
    birthday              {'1111-11-11'}
  end
end