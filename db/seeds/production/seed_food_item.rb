class SeedFoodItem

  def self.seed
    image_folder = 'eat'
    parent_category = Category.find_by_identifier("Want to Eat")
    items = [
      {
        name: "chicken",
        name_ja: "チキン",
        image: "#{image_folder}/chicken.svg",
      },
      {
        name: "kushikatsu",
        name_ja: "串カツ",
        image: "#{image_folder}/kushikatsu.svg",
      },
      {
        name: "onigiri",
        name_ja: "おにぎり",
        image: "#{image_folder}/onigiri.svg",
      },
      {
        name: "salad",
        name_ja: "サラダ",
        image: "#{image_folder}/salad.svg",
      },
      {
        name: "sushi",
        name_ja: "寿司",
        image: "#{image_folder}/sush.svg",
      },
      {
        name: "wasabi",
        name_ja: "わさび",
        image: "#{image_folder}/wasabi.svg",
      },
      {
        name: "crab",
        name_ja: "カニ",
        image: "#{image_folder}/crab.svg",
      },
      {
        name: "fried rice",
        name_ja: "炒飯",
        image: "#{image_folder}/fried-rice.svg",
      },
      {
        name: "meat ball",
        name_ja: "ミートボール",
        image: "#{image_folder}/meat-ball.svg",
      },
      {
        name: "pizza",
        name_ja: "ピザ",
        image: "#{image_folder}/pizza.svg",
      },
      {
        name: "sashimi",
        name_ja: "刺身",
        image: "#{image_folder}/sashimi.svg",
      },
      {
        name: "takoyaki",
        name_ja: "たこ焼き",
        image: "#{image_folder}/takoyaki.svg",
      },
      {
        name: "crepe",
        name_ja: "クレープ",
        image: "#{image_folder}/crepe.svg",
      },
      {
        name: "gyoza",
        name_ja: "餃子",
        image: "#{image_folder}/gyoza.svg",
      },
      {
        name: "soup",
        name_ja: "スープ",
        image: "#{image_folder}/soup.svg",
      },
      {
        name: "ramen",
        name_ja: "ラーメン",
        image: "#{image_folder}/ramen.svg",
      },
      {
        name: "somen",
        name_ja: "素麺",
        image: "#{image_folder}/somen.svg",
      },
      {
        name: "tea",
        name_ja: "お茶",
        image: "#{image_folder}/tea.svg",
      },
      {
        name: "curry",
        name_ja: "カレー",
        image: "#{image_folder}/curry.svg",
      },
      {
        name: "hamburger",
        name_ja: "ハンバーガー",
        image: "#{image_folder}/hamburger.svg",
      },
      {
        name: "noodles",
        name_ja: "麺類",
        image: "#{image_folder}/noodles.svg",
      },
      {
        name: "rice",
        name_ja: "ご飯",
        image: "#{image_folder}/rice.svg",
      },
      {
        name: "steamed_fish",
        name_ja: "お魚",
        image: "#{image_folder}/steamed_fish.svg",
      },
      {
        name: "tempura",
        name_ja: "天ぷら",
        image: "#{image_folder}/tempura.svg",
      },
    ]
    items.each_with_index do |eat_item, index|
      parent_category.items.create!(
        name: eat_item[:name],
        name_ja: eat_item[:name_ja],
        position: index + 1,
        description: eat_item[:description],
        description_ja: eat_item[:description_ja],
        image: eat_item[:image],
        )
    end
  end

end