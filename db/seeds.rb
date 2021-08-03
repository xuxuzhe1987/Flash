
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

file1 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/00-Setup.yml?token=ASN2OE2WFYNQ7GVAMZPWF7TBCI4E2"

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

file2 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_01-Programming-basics.yml?token=ASN2OE56UT6AFEZYUIY65W3BCI4BM"

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

# # Iterators-Block--------------------------------------------------

file3 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_03-Iterators-Blocks.yml?token=ASN2OE64D4XV2NZFTLG6JT3BCI4MI"

sample3 = YAML.load(open(file3).read)

puts 'Creating Cards for 01-Ruby_03-Iterators-Blocks...'

deckname3 = Deck.create!(user_id: user.id, name: sample3["deck_name"] + " (English)")
sample3["cards"].each do |card|
 Card.create!(deck_id: deckname3.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts 'Creating Cards for 01-Ruby_03-Iterators-Blocks... in Chinese'

deckname3cn = Deck.create!(user_id: user.id, name: sample3["deck_name"] + " (中文)")
sample3["cards"].each do |card|
 Card.create!(deck_id: deckname3cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # Hash Symbols---------------------------------------------

file4 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_04-Hash-Symbols.yml?token=ASN2OE3AWE6LZDGI7CIMD3LBCI4QK"

sample4 = YAML.load(open(file4).read)

puts '01-Ruby_04-Hash-Symbols...'

deckname4 = Deck.create!(user_id: user.id, name: sample4["deck_name"] + " (English)")
sample4["cards"].each do |card|
 Card.create!(deck_id: deckname4.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts '01-Ruby_04-Hash-Symbols... in Chinese'

deckname4cn = Deck.create!(user_id: user.id, name: sample4["deck_name"] + " (中文)")
sample4["cards"].each do |card|
 Card.create!(deck_id: deckname4cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # # Regular Expression ------------------------------------------------

file5 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_05-Regular-Expressions.yml?token=ASN2OE5BSTDSRIWFPAVTGCTBCI4UI"

sample5 = YAML.load(open(file5).read)

puts '01-Ruby_05-Regular-Expressions...'

deckname5 = Deck.create!(user_id: user.id, name: sample5["deck_name"] + " (English)")
sample5["cards"].each do |card|
 Card.create!(deck_id: deckname5.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts '01-Ruby_05-Regular-Expressions... in Chinese'

deckname5cn = Deck.create!(user_id: user.id, name: sample5["deck_name"] + " (中文)")
sample5["cards"].each do |card|
 Card.create!(deck_id: deckname5cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # # Parsing ------------------------------------------------

file6 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_06-Parsing.yml?token=ASN2OEYDJFOXUMCLHNWLHGDBCI4XE"

sample6 = YAML.load(open(file6).read)

puts '01-Ruby_06-Parsing...'

deckname6 = Deck.create!(user_id: user.id, name: sample6["deck_name"] + " (English)")
sample6["cards"].each do |card|
 Card.create!(deck_id: deckname6.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts '01-Ruby_06-Parsing... in Chinese'

deckname6cn = Deck.create!(user_id: user.id, name: sample6["deck_name"] + " (中文)")
sample6["cards"].each do |card|
 Card.create!(deck_id: deckname6cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # flow and arrays -------------------------------------------------------

file7 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_02-Flow-Array.yml?token=ASN2OE2K55L5NRJ5VE2RLOLBCI24M"

sample7 = YAML.load(open(file7).read)

puts '06-Flow-Array...'

deckname7 = Deck.create!(user_id: user.id, name:sample7["deck_name"] + " (English)")
sample7["cards"].each do |card|
  Card.create!(deck_id: deckname7.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts '06-Flow-Array... in Chinese'

deckname7cn = Deck.create!(user_id: user.id, name: sample7["deck_name"] + " (中文)")
sample6["cards"].each do |card|
 Card.create!(deck_id: deckname7cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end

# # # OOP Basics -----------------------------

file8 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_01-OO-Basics.yml?token=ASN2OE5B6ZULFLLFYNUCVJ3BCI424"

sample8 = YAML.load(open(file8).read)

puts '02-OOP_01-OO-Basics...'

deckname8 = Deck.create!(user_id: user.id, name:sample8["deck_name"] + " (English)")
sample8["cards"].each do |card|
  Card.create!(deck_id: deckname8.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts '02-OOP_01-OO-Basics... in Chinese'

deckname8cn = Deck.create!(user_id: user.id, name: sample8["deck_name"] + " (中文)")
sample8["cards"].each do |card|
 Card.create!(deck_id: deckname8cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end


# # # # OOP Advanced -----------------

# file9 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_02-OO-Advanced.yml?token=ASN2OE53ODU3IWGCSXFGR5TBCI5GE"

# sample9 = YAML.load(open(file9).read)

# puts '02-OOP_02-OO-Advanced...'

# deckname9 = Deck.create!(user_id: user.id, name:sample9["deck_name"] + " (English)")
# sample9["cards"].each do |card|
#   Card.create!(deck_id: deckname9.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '02-OOP_02-OO-Advanced... in Chinese'

# deckname9cn = Deck.create!(user_id: user.id, name: sample9["deck_name"] + " (中文)")
# sample9["cards"].each do |card|
#  Card.create!(deck_id: deckname9cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end

# # # # Cookbook Day 1 -------------------

# file10 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_03-Cookbook-Day-One.yml?token=ASN2OE2NQFH4K2W2ZSTL45DBCI5I2"

# sample10 = YAML.load(open(file10).read)

# puts '02-OOP_03-Cookbook-Day-One...'

# deckname10 = Deck.create!(user_id: user.id, name:sample10["deck_name"] + " (English)")
# sample10["cards"].each do |card|
#   Card.create!(deck_id: deckname10.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '02-OOP_03-Cookbook-Day-One... in Chinese'

# deckname10cn = Deck.create!(user_id: user.id, name: sample10["deck_name"] + " (中文)")
# sample10["cards"].each do |card|
#  Card.create!(deck_id: deckname10cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end

# # # # Delivery Day 1 -------------

# file11 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_05-Food-Delivery-Day-One.yml?token=ASN2OE3A6VDEHB4BMHTFSZTBCI5QY"

# sample11 = YAML.load(open(file11).read)

# puts '02-OOP_05-Food-Delivery-Day-One...'

# deckname11 = Deck.create!(user_id: user.id, name:sample11["deck_name"] + " (English)")
# sample11["cards"].each do |card|
#   Card.create!(deck_id: deckname11.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# puts '02-OOP_05-Food-Delivery-Day-One... in Chinese'

# deckname11cn = Deck.create!(user_id: user.id, name: sample11["deck_name"] + " (中文)")
# sample11["cards"].each do |card|
#  Card.create!(deck_id: deckname11cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
# end

