class SeedEatItem

  def self.seed
    image_folder = 'eat'
    parent_category = Category.find_by_name_ja("Want to Eat")
    items = [
      {
        name: "chicken",
        name_ja: "chicken",
        image: "#{image_folder}/chicken.svg",
      },
      {
        name: "eat",
        name_ja: "eat",
        image: "#{image_folder}/eat.svg",
      },
      {
        name: "kushikatsu",
        name_ja: "kushikatsu",
        image: "#{image_folder}/kushikatsu.svg",
      },
      {
        name: "onigiri",
        name_ja: "onigiri",
        image: "#{image_folder}/onigiri.svg",
      },
      {
        name: "salad",
        name_ja: "salad",
        image: "#{image_folder}/salad.svg",
      },
      {
        name: "sush",
        name_ja: "sush",
        image: "#{image_folder}/sush.svg",
      },
      {
        name: "wasabi",
        name_ja: "wasabi",
        image: "#{image_folder}/wasabi.svg",
      },
      {
        name: "crab",
        name_ja: "crab",
        image: "#{image_folder}/crab.svg",
      },
      {
        name: "fried",
        name_ja: "fried",
        image: "#{image_folder}/fried-rice.svg",
      },
      {
        name: "meat",
        name_ja: "meat",
        image: "#{image_folder}/meat-ball.svg",
      },
      {
        name: "pizza",
        name_ja: "pizza",
        image: "#{image_folder}/pizza.svg",
      },
      {
        name: "sashimi",
        name_ja: "sashimi",
        image: "#{image_folder}/sashimi.svg",
      },
      {
        name: "takoyaki",
        name_ja: "takoyaki",
        image: "#{image_folder}/takoyaki.svg",
      },
      {
        name: "crepe",
        name_ja: "crepe",
        image: "#{image_folder}/crepe.svg",
      },
      {
        name: "gyoza",
        name_ja: "gyoza",
        image: "#{image_folder}/gyoza.svg",
      },
      {
        name: "soup",
        name_ja: "soup",
        image: "#{image_folder}/soup.svg",
      },
      {
        name: "ramen",
        name_ja: "ramen",
        image: "#{image_folder}/ramen.svg",
      },
      {
        name: "somen",
        name_ja: "somen",
        image: "#{image_folder}/somen.svg",
      },
      {
        name: "tea",
        name_ja: "tea",
        image: "#{image_folder}/tea.svg",
      },
      {
        name: "curry",
        name_ja: "curry",
        image: "#{image_folder}/curry.svg",
      },
      {
        name: "hamburger",
        name_ja: "hamburger",
        image: "#{image_folder}/hamburger.svg",
      },
      {
        name: "noodles",
        name_ja: "noodles",
        image: "#{image_folder}/noodles.svg",
      },
      {
        name: "rice",
        name_ja: "rice",
        image: "#{image_folder}/rice.svg",
      },
      {
        name: "steamed_fish",
        name_ja: "steamed_fish",
        image: "#{image_folder}/steamed_fish.svg",
      },
      {
        name: "tempura",
        name_ja: "tempura",
        image: "#{image_folder}/tempura.svg",
      },

      # {
      #   name: "ご飯",
      #   name_ja: "Rice",
      #   description: "ご飯が食べたいです",
      #   description_ja: "I want to eat rice",
      #   image: "#{image_folder}/rice.svg",

      # },
      # {
      #   name: "味噌汁",
      #   name_ja: "Miso soup",
      #   description: "味噌汁が飲みたいです",
      #   description_ja: "I want to drink miso soup",
      #   image: "#{image_folder}/miso_soup.svg",
      # },
      # {
      #   name: "オムレツ",
      #   name_ja: "omlet",
      #   description: "オムレツが食べたいです",
      #   description_ja: "I want to omlet",
      #   image: "#{image_folder}/omlet.svg",
      # },

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