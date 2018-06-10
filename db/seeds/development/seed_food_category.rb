class SeedFoodCategory

  def self.create
    puts "=================Creating Food Category================="
    puts "Running #{self}..."

    FoodCategory.destroy_all

    parent_category = FoodCategory.create!(name: 'Food', name_ja: '食べ物', image: "food_category/food.svg")

    categories = [
      {parent: parent_category, cuisine: 'common', name: 'common', name_ja: '共通', image: "food_category/food.svg"},
      {parent: parent_category, cuisine: 'japanese', name: 'Japanese', name_ja: '和食', image: "food_category/japanese.svg"},
      {parent: parent_category, cuisine: 'italian', name: 'Italian', name_ja: 'イタリアン', image: "food_category/italian.svg"},
      {parent: parent_category, cuisine: 'chinese', name: 'Chinese', name_ja: '中華', image: "food_category/chinese.svg"},
      {parent: parent_category, cuisine: 'american', name: 'American', name_ja: 'アメリカン', image: "food_category/american.svg"},
    ]

    categories.each_with_index do |category, index|
      FoodCategory.create!(
        parent: category[:parent],
        cuisine: category[:cuisine],
        name: category[:name],
        name_ja: category[:name_ja],
        image: category[:image],
      )

    end
  end

end