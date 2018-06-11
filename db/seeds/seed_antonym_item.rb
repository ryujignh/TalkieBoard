load 'db/seeds/seed_item.rb'

class SeedAntonymItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('antonym')

    csv_file_path = "db/seeds/antonym_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "antonym"

    self.seed_items(parent_category, items, image_folder)
  end


end