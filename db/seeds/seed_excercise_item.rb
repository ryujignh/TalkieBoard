load 'db/seeds/seed_item.rb'

class SeedExcerciseItem < SeedItem

  def self.create
    puts "Running #{self}..."
    parent_category = Category.find_by_identifier('excercise')

    csv_file_path = "db/seeds/excercise_items.csv"
    items = CSV.read(csv_file_path, headers: true)
    image_folder = "excercise"

    self.seed_items(parent_category, items, image_folder)

  end

end