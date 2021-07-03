
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

# puts "Cleaning database..."
# Deck.destroy_all
# Card.destroy_all

# puts "Creating more decks..."
# programming_basics = Deck.create(name: "Programming Basics")
# flow_and_arrays = Deck.create(name: "Flow and Arrays")

# puts "Creating more cards..."
# a = Card.create(question: "What is IRB?",
#       answer: "IRB means Interactive Ruby Interpreter, it's a playground where you can run some code in Ruby. You just have to type `irb` in the terminal to open a session, and `exit` when you're done. Be careful, once you `exit` an `irb` session, everything you computed during the session is lost!",
#       hint: "NA",
#       deck_id: programming_basics.id)

# b = Card.create(question: "How do you run a ruby file in the terminal?",
#       answer: "ruby path/to/your/file.rb",
#       hint: "NA",
#       deck_id: programming_basics.id)

# c = Card.create(question: "How do you write code that runs only if a condition is satisfied?",
#       answer: "With the `if` keyword",
#       hint: "NA",
#       deck_id: flow_and_arrays.id)

# d = Card.create(question: "How can you test the opposite of a given condition?",
#       answer: "You can add a `!` (the logical negation operator) in front of the condition",
#       hint: "NA",
#       deck_id: flow_and_arrays.id)

# puts "Finished!"

