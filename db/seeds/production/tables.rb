require_relative('seed_shared')
require_relative('seed_category')
require_relative('seed_item')


def create
  # Don't change order
  SeedCategory.create
  SeedItem.create
end


create