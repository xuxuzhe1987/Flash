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

file = "https://raw.githubusercontent.com/lewagon/flashcards/master/decks/00-Setup.yml?token=ASLME6ULWD6I7ACK6JQDQILA5E2PW"
sample = YAML.load(open(file).read)

puts 'Creating Cards...'

deckname = Deck.create!(name: sample["deck_name"])
sample["cards"].each do |card|
 Card.create!(deck_id: deckname.id, question: card["front"], answer: card["back"], hint: card["slug"])
end



#   deck = Deck.create!(
#     name: card["deck_name"])
#   puts deck
# end


  # puts card["slug"]
  # puts card["front"]
  # puts card["back"]


