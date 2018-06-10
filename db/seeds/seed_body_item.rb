load 'db/seeds/seed_item.rb'

class SeedBodyItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('body')

    csv_file_path = "db/seeds/body_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "body"

    self.seed_items(parent_category, items, image_folder)
  end


end