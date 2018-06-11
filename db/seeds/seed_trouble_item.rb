load 'db/seeds/seed_item.rb'

class SeedTroubleItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('trouble')

    csv_file_path = "db/seeds/trouble_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "trouble"

    self.seed_items(parent_category, items, image_folder)
  end


end