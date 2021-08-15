FactoryBot.define do
  factory :recipe do
    title { "Gumbo" }
    servings  { 20 }
    summary  { "Best Recipe Ever" }
		instructions  { "Have Fun!" }
  end
end