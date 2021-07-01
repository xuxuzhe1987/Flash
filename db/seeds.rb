puts "Cleaning database..."
Deck.destroy_all
Card.destroy_all

puts "Creating decks..."
programming_basics = Deck.create(name: "Programming Basics")
flow_and_arrays = Deck.create(name: "Flow and Arrays")

puts "Creating cards..."
a = Card.create(question: "What is IRB?",
      answer: "IRB means Interactive Ruby Interpreter, it's a playground where you can run some code in Ruby. You just have to type `irb` in the terminal to open a session, and `exit` when you're done. Be careful, once you `exit` an `irb` session, everything you computed during the session is lost!",
      hint: "NA",
      deck_id: programming_basics.id)

b = Card.create(question: "How do you run a ruby file in the terminal?",
      answer: "ruby path/to/your/file.rb",
      hint: "NA",
      deck_id: programming_basics.id)

c = Card.create(question: "How do you write code that runs only if a condition is satisfied?",
      answer: "With the `if` keyword",
      hint: "NA",
      deck_id: flow_and_arrays.id)

d = Card.create(question: "How can you test the opposite of a given condition?",
      answer: "You can add a `!` (the logical negation operator) in front of the condition",
      hint: "NA",
      deck_id: flow_and_arrays.id)

puts "Finished!"

