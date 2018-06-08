class SeedFoodCategory

  def self.create
    puts "Running #{self}..."

    FoodCategory.destroy_all

    parent_category = FoodCategory.create!(name: 'Food', name_ja: '食べ物', image: "eat/eat.svg")

    categories = [
      {parent: parent_category, cuisine: 'ja', name: 'Japanese', name_ja: '和食', image: "food/japanese.svg"},
      {parent: parent_category, cuisine: 'it', name: 'Italian', name_ja: 'イタリアン', image: "food/italian.svg"},
      {parent: parent_category, cuisine: 'french', name: 'French', name_ja: 'フレンチ', image: "food/french.svg"},
      {parent: parent_category, cuisine: 'ch', name: 'Chinese', name_ja: '中華', image: "food/chinese.svg"},
      {parent: parent_category, cuisine: 'us', name: 'American', name_ja: 'アメリカン', image: "food/american.svg"},
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