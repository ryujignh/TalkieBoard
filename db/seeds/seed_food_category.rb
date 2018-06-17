class SeedFoodCategory

  def self.create
    puts "=================Creating Food Category================="
    puts "Running #{self}..."

    FoodCategory.destroy_all

    parent_category = FoodCategory.create!(name: 'Food', name_ja: '食べ物', image: "food_category/food.svg")

    categories = [
      {parent: parent_category, cuisine: 'ingredient', name: 'ingredient', name_ja: '材料', image: "food/ingredient/ingredient.svg"},
      {parent: parent_category, cuisine: 'vegetable', name: 'vegetable', name_ja: '野菜', image: "food/vegetable/vegetable.svg"},
      {parent: parent_category, cuisine: 'dairy', name: 'dairy', name_ja: '乳製品', image: "food/dairy/dairy.svg"},
      {parent: parent_category, cuisine: 'meat', name: 'meat', name_ja: '肉類', image: "food/meat/meat.svg"},
      {parent: parent_category, cuisine: 'seafood', name: 'seafood', name_ja: '魚介類', image: "food/seafood/seafood.svg"},
      {parent: parent_category, cuisine: 'fruit', name: 'fruit', name_ja: '果物', image: "food/fruit/fruit.svg"},
      {parent: parent_category, cuisine: 'seasoning', name: 'seasoning', name_ja: '調味料', image: "food/seasoning/seasoning.svg"},
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