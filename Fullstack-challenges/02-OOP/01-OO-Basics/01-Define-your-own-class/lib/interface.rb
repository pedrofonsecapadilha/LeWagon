require_relative "car"

panda = Car.new("Renault", "Panda 4x4", 30_000)
testarossa = Car.new("Ferrari", "Testarossa", 0)
t = Car.new("Ford", "T", 500)

panda.tested
testarossa.tested
t.tested
