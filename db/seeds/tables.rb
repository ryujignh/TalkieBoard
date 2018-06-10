require_relative('seed_shared')
require_relative('seed_category')
require_relative('seed_food_category')
require_relative('seed_food_item')
require_relative('seed_item')


def create
  # Don't change order
  SeedCategory.create
  SeedItem.create

  SeedFoodCategory.create
  SeedFoodItem.create
end

create