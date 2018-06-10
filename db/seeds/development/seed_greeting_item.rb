load 'db/seeds/development/seed_item.rb'

class SeedGreetingItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('greeting')

    csv_file_path = "db/seeds/greeting_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "greeting"

    self.seed_items(parent_category, items, image_folder)
  end


end