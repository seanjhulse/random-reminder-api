FactoryGirl.define do
  
  begin_date = Faker::Date.between(1.week.from_now, 1.year.from_now)
  end_date = Faker::Date.between(begin_date+1.day, 1.year.from_now)

  factory :event do
    name Faker::RickAndMorty.quote
    count Faker::Number.between(1, 10)
    begin_date begin_date
    end_date end_date
    user User.first
  end
end
