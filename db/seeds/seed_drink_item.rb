load 'db/seeds/seed_item.rb'

class SeedDrinkItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('drink')

    csv_file_path = "db/seeds/drink_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "drink"

    self.seed_items(parent_category, items, image_folder)

  end

end