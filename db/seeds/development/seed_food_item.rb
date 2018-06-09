require 'csv'

class SeedFoodItem

  def self.create
    puts "Running #{self}..."

    FoodItem.destroy_all

    [
      'japanese',
      'italian',
      'chinese',
      'american',
      'common',
    ].each do |cuisine|
      self.seed_foods(cuisine)
    end
  end

  def self.seed_foods(cuisine)
    csv_file_path = "db/seeds/#{cuisine}_foods.csv"
    items = CSV.read(csv_file_path, headers: true)
    puts "Parsing #{cuisine}_foods.csv"
    category = FoodCategory.find_by_cuisine(cuisine)
    image_folder = "food/#{cuisine}"
    self.create_items(category, items, image_folder)

  end

  def self.create_items(category, items, image_folder)
    items.each_with_index do |eat_item, index|
      category.items.create!(
        name: eat_item['name'],
        name_ja: eat_item['name_ja'],
        description: eat_item['description'],
        description_ja: eat_item['description_ja'],
        hot: eat_item['hot'],
        spicy: eat_item['spicy'],
        sweet: eat_item['sweet'],
        image: "#{image_folder}/#{eat_item['image']}.svg",
        )
    end
  end

end