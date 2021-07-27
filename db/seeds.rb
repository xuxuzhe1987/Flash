
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "yaml"

Deck.destroy_all
Card.destroy_all
user = User.new(name: "lewagon", email: "admin@lewagon.com", encrypted_password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2021-07-01 00:00:00", last_sign_in_at: "2021-07-01 00:00:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user.save!(validate: false)

# setup------------------------------------------------------

file1 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/00-Setup.yml?token=ASLME6TQP4MQ7V3XE3PVXXDBBB5P6"

sample1 = YAML.load(open(file1).read)

puts 'Creating Cards for 00-Setup...'

deckname1 = Deck.create!(user_id: user.id, name: sample1["deck_name"] + " (English)")
sample1["cards"].each do |card|
 Card.create!(deck_id: deckname1.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts 'Creating Cards for 00-Setup... in Chinese'

deckname1cn = Deck.create!(user_id: user.id, name: sample1["deck_name"] + " (中文)")
sample1["cards"].each do |card|
 Card.create!(deck_id: deckname1cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# programming basics-----------------------------------------

file2 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_01-Programming-basics.yml?token=ASLME6VKAZHP67ADKV7SEXTBBB5V4"

sample2 = YAML.load(open(file2).read)

puts 'Creating Cards for 01-Ruby_01-Programming-basics...'

deckname2 = Deck.create!(user_id: user.id, name: sample2["deck_name"] + " (English)")
sample2["cards"].each do |card|
 Card.create!(deck_id: deckname2.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts 'Creating Cards for 01-Ruby_01-Programming-basics... in Chinese'

deckname2cn = Deck.create!(user_id: user.id, name: sample2["deck_name"] + " (中文)")
sample2["cards"].each do |card|
 Card.create!(deck_id: deckname2cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # OOP Basics--------------------------------------------------

file3 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_01-OO-Basics.yml?token=ASLME6V2KTIIV5DHPGFHGE3BBB5XU"

sample3 = YAML.load(open(file3).read)

puts 'Creating Cards for 02-OOP_01-OO-Basics...'

deckname3 = Deck.create!(user_id: user.id, name: sample3["deck_name"] + " (English)")
sample3["cards"].each do |card|
 Card.create!(deck_id: deckname3.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts 'Creating Cards for 02-OOP_01-OO-Basics... in Chinese'

deckname3cn = Deck.create!(user_id: user.id, name: sample3["deck_name"] + " (中文)")
sample3["cards"].each do |card|
 Card.create!(deck_id: deckname3cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # # db_design_and_sql---------------------------------------------

# file4 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/03-AR-Database_01-DB-Design-and-SQL.yml?token=ASLME6SWEFRSUABMSJBATDLBBB6CQ"

# sample4 = YAML.load(open(file4).read)

# puts '03-AR-Database_01-DB-Design-and-SQL...'

# deckname4 = Deck.create!(user_id: user.id, name: sample4["deck_name"] + " (English)")
# sample4["cards"].each do |card|
#  Card.create!(deck_id: deckname4.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '03-AR-Database_01-DB-Design-and-SQL... in Chinese'

# deckname4cn = Deck.create!(user_id: user.id, name: sample4["deck_name"] + " (中文)")
# sample4["cards"].each do |card|
#  Card.create!(deck_id: deckname4cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end

# # # Front-End_01-HTML-and-CSS ------------------------------------------------

# file5 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/04-Front-End_01-HTML-and-CSS.yml?token=ASLME6WH5XZWDSPEZEIAF3LBBB77M"

# sample5 = YAML.load(open(file5).read)

# puts '04-Front-End_01-HTML-and-CSS...'

# deckname5 = Deck.create!(user_id: user.id, name: sample5["deck_name"] + " (English)")
# sample5["cards"].each do |card|
#  Card.create!(deck_id: deckname5.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '04-Front-End_01-HTML-and-CSS... in Chinese'

# deckname5cn = Deck.create!(user_id: user.id, name: sample5["deck_name"] + " (中文)")
# sample5["cards"].each do |card|
#  Card.create!(deck_id: deckname5cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end

# # # rails_intro ------------------------------------------------

# file6 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/05-Rails_01-Rails-intro.yml?token=ASLME6UXU2OQMKCENPPDGDLBBCAF6"

# sample6 = YAML.load(open(file6).read)

# puts '05-Rails_01-Rails-intro...'

# deckname6 = Deck.create!(user_id: user.id, name: sample6["deck_name"] + " (English)")
# sample6["cards"].each do |card|
#  Card.create!(deck_id: deckname6.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '05-Rails_01-Rails-intro... in Chinese'

# deckname6cn = Deck.create!(user_id: user.id, name: sample5["deck_name"] + " (中文)")
# sample6["cards"].each do |card|
#  Card.create!(deck_id: deckname6cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end
