load 'db/seeds/seed_item.rb'

class SeedRequestItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('request')

    csv_file_path = "db/seeds/request_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "request"

    self.seed_items(parent_category, items, image_folder)
  end


end