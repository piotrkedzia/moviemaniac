FactoryGirl.define do
  factory :movie do
    title Faker::Book.title
    rating { %w(G PG PG-13 R NC-17)[(rand(5))] }
    description Faker::Lorem.sentence(5)
    total_gross Faker::Number.number(10)
    released_on { DateTime.now - rand(20).years }

    cast do
      names = []
      rand(6).times { names << Faker::Name.name }
      names.join(", ")
    end

    director Faker::Name.name
    duration { "#{Faker::Number.between(85, 250)} min" }
  end
end
