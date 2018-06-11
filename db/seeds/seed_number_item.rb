load 'db/seeds/seed_item.rb'

class SeedNumberItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('number')

    csv_file_path = "db/seeds/number_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "number"

    self.seed_items(parent_category, items, image_folder)
  end


end