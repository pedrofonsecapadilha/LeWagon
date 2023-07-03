# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

List.create(name: "Action", image: "https://media.istockphoto.com/id/1352294593/photo/tactical-exercise-training-an-armed-bodyguard-security-team-protects-celebrity.jpg?b=1&s=170667a&w=0&k=20&c=bCS18QdaNthr8lu4WKLiP2eUvL7i2EOfM07MS92MUWM=")
List.create(name: "Drama", image: "https://media.istockphoto.com/id/1141192830/photo/close-up-photo-beautiful-amazing-she-her-lady-two-buns-watch-tv-show-hold-popcorn-bucket-eyes.jpg?b=1&s=170667a&w=0&k=20&c=o51QOr-tHB9eLMcPUNzB5KQtjgZ0D8td__goOYnJwsQ=")
List.create(name: "Comedy", image: "https://media.istockphoto.com/id/680810342/photo/dog-watching-tv-on-the-couch.jpg?b=1&s=170667a&w=0&k=20&c=I-AzETuiLL9m8uk5CRPvamVFZBSWYZnbyoCBvUpCECU=")
List.create(name: "Documentary", image: "https://media.istockphoto.com/id/1281466533/photo/female-mural-artist-at-work.jpg?b=1&s=170667a&w=0&k=20&c=OzDzUFNEVwJyQ1s6AN9jG9TLmTxXnyGesWJ0gmzWcD0=")
