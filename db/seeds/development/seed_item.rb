require_relative 'seed_eat_item'
require_relative 'seed_feeling_item'

class SeedItem

  def self.create
    puts "Running #{self}..."

    Item.all.destroy_all
    # TODO: give category id for identifier
    SeedEatItem.seed
    SeedFeelingItem.seed

  end

end