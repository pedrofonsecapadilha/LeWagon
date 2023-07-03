# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'router'

csv_file = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(csv_file)
# controller = Controller.new(cookbook)

router = Router.new

# Start the app
router.run
