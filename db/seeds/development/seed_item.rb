require_relative 'seed_feeling_item'

class SeedItem

  def self.create
    puts "Running #{self}..."

    Item.all.destroy_all
    # TODO: give category id for identifier
    SeedFeelingItem.create
  end

end