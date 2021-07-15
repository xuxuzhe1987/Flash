
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

# setup------------------------------------------------------

file1 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/00-Setup.yml?token=ASLME6Q3V5F2NYLJIUACT73A6KGRC"

sample1 = YAML.load(open(file1).read)

puts 'Creating Cards for 00-Setup...'

deckname1 = Deck.create!(name: sample1["deck_name"] + " (English)")
sample1["cards"].each do |card|
 Card.create!(user_id: "lewagon", deck_id: deckname1.id, question: card["front"], answer: card["back"], hint: card["slug"])
end

puts 'Creating Cards for 00-Setup... in Chinese'

deckname1cn = Deck.create!(name: sample1["deck_name"] + " (中文)")
sample1["cards"].each do |card|
 Card.create!(user_id: "lewagon", deck_id: deckname1cn.id, question: card["i18n"]["cn"]["front"], answer: card["i18n"]["cn"]["back"], hint: card["slug"])
end



# programming basics-----------------------------------------

# file2 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_01-Programming-basics.yml?token=ASLME6QSAZEY3FVJMM35M63A6KGVM"
# sample2 = YAML.load(open(file2).read)

# puts 'Creating Cards for 01-Ruby_01-Programming-basics...'

# deckname2 = Deck.create!(name: sample2["deck_name"])
# sample2["cards"].each do |card|
#  Card.create!(deck_id: deckname2.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # flow array--------------------------------------------------

# file3 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_02-Flow-Array.yml?token=ASLME6VNOEWCAZ4PO2NFUPTA6KG2Q"
# sample3 = YAML.load(open(file3).read)

# puts 'Creating Cards for 01-Ruby_02-Flow-Array...'

# deckname3 = Deck.create!(name: sample3["deck_name"])
# sample3["cards"].each do |card|
#  Card.create!(deck_id: deckname3.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # iterators blocks---------------------------------------------

# file4 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_03-Iterators-Blocks.yml?token=ASLME6TLPJ6YDFN4GRRLNTDA6KG4W"
# sample4 = YAML.load(open(file4).read)

# puts 'Creating Cards for 01-Ruby_03-Iterators-Blocks...'

# deckname4 = Deck.create!(name: sample4["deck_name"])
# sample4["cards"].each do |card|
#  Card.create!(deck_id: deckname4.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # hash symbols ------------------------------------------------

# file5 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_04-Hash-Symbols.yml?token=ASLME6TDFUA6OTK6KO3W5T3A6KG6W"
# sample5 = YAML.load(open(file5).read)

# puts 'Creating Cards for 01-Ruby_04-Hash-Symbols...'

# deckname5 = Deck.create!(name: sample5["deck_name"])
# sample5["cards"].each do |card|
#  Card.create!(deck_id: deckname5.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# regex-------------------------------------------------------

# file6 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_05-Regular-Expressions.yml?token=ASLME6TAFXBMGSU7VJMQLPLA5PVKU"
# sample6 = YAML.load(open(file6).read)

# puts 'Creating Cards for 01-Ruby_05-Regular-Expressions'

# deckname6 = Deck.create!(name: sample6["deck_name"])
# sample6["cards"].each do |card|
#  Card.create!(deck_id: deckname6.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # parsing-------------------------------------------------------

# file7 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/01-Ruby_06-Parsing.yml?token=ASLME6UYX3WZRTEXUALY3ELA5PXGI"
# sample7 = YAML.load(open(file7).read)

# puts 'Creating Cards for 01-Ruby_06-Parsing'

# deckname7 = Deck.create!(name: sample7["deck_name"])
# sample7["cards"].each do |card|
#  Card.create!(deck_id: deckname7.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # oop basics-----------------------------------------------------

# file8 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_01-OO-Basics.yml?token=ASLME6XTM37ZJYGKY2E3LI3A5PVTS"
# sample8 = YAML.load(open(file8).read)

# puts 'Creating Cards for 02-OOP_01-OO-Basics'

# deckname8 = Deck.create!(name: sample8["deck_name"])
# sample8["cards"].each do |card|
#  Card.create!(deck_id: deckname8.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # oop advanced----------------------------------------------------

# file9 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_02-OO-Advanced.yml?token=ASLME6VEMVQQGFQBTV5SWHDA5PVYC"
# sample9 = YAML.load(open(file9).read)

# puts 'Creating Cards for 02-OOP_02-OO-Advanced'

# deckname9 = Deck.create!(name: sample9["deck_name"])
# sample9["cards"].each do |card|
#  Card.create!(deck_id: deckname9.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # oop cookbook day 1 ----------------------------------------------

# file10 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_03-Cookbook-Day-One.yml?token=ASLME6S52DH4SK6GSK3PBSLA5PV4M"
# sample10 = YAML.load(open(file10).read)

# puts 'Creating Cards for 02-OOP_03-Cookbook-Day-One'

# deckname10 = Deck.create!(name: sample10["deck_name"])
# sample10["cards"].each do |card|
#  Card.create!(deck_id: deckname10.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # oop food delivery day 1---------------------------------------

# file11 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/02-OOP_05-Food-Delivery-Day-One.yml?token=ASLME6QTIPJZRMZZQT4MVRLA5PXIG"
# sample11 = YAML.load(open(file11).read)

# puts 'Creating Cards for 02-OOP_05-Food-Delivery-Day-One'

# deckname11 = Deck.create!(name: sample11["deck_name"])
# sample11["cards"].each do |card|
#  Card.create!(deck_id: deckname11.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

# # db design sql -------------------------------------------------

# file12 = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/03-AR-Database_01-DB-Design-and-SQL.yml?token=ASLME6XJDMVKQAT4MCMLT53A5PWH4"
# sample12 = YAML.load(open(file12).read)

# puts 'Creating Cards for 03-AR-Database_01-DB-Design-and-SQL'

# deckname12 = Deck.create!(name: sample12["deck_name"])
# sample12["cards"].each do |card|
#  Card.create!(deck_id: deckname12.id, question: card["front"], answer: card["back"], hint: card["slug"])
# end

