# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[レンタルスペース 会議室 セミナー会場 パーティールーム コワーキングスペース カフェ].each do |name|
  SpaceType.create!(name: name)
end

%w[プロジェクター マイク スピーカー テーブル チェア].each do |name|
  Feature.create!(name: name)
end

100.times.each do |n|
  latitude = Random.rand(35.6..35.7)
  longitude = Random.rand(139.70..139.78)
  space = Space.create!(
    name: Faker::Lorem.sentence, 
    description: Faker::Lorem.paragraph(sentence_count: 30, supplemental: false, random_sentences_to_add: 4),
    address: Faker::Address.full_address,
    nearest_station: Faker::Address.city,
    latitude: latitude,
    longitude: longitude,
    )

  3.times.each do |n|
    fixture_image_name = "#{Random.rand(1..10)}.jpg"
    space.images.attach(io: File.open(Rails.root.join("db/fixtures/spaces/#{fixture_image_name}")), filename: fixture_image_name)
  end

  space.feature_ids = Feature.all.sample(3).pluck(:id)
  space.space_type_ids = SpaceType.all.sample(3).pluck(:id)
    
end


User.create!(email:"admin@example.com", password:"password", password_confirmation: "password", admin: true)
