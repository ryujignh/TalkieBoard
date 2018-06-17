load 'db/seeds/seed_item.rb'

class SeedActivityItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('activity')

    csv_file_path = "db/seeds/activity_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "activity"

    self.seed_items(parent_category, items, image_folder)

  end

end