load 'db/seeds/seed_item.rb'

class SeedFeelingItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('feeling')

    csv_file_path = "db/seeds/feeling_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "pain_scale"

    self.seed_items(parent_category, items, image_folder)

  end

end