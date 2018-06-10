load 'db/seeds/development/seed_item.rb'

class SeedPainScaleItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('pain_scale')

    csv_file_path = "db/seeds/pain_scale_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "pain_scale"

    self.seed_items(parent_category, items, image_folder)

  end

end