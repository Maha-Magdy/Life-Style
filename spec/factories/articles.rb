FactoryBot.define do
  factory :article do
    author_id { 1 }
    title { "MyText" }
    text { "MyText" }
    image { "" }
  end
end
