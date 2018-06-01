class SeedEatItem

  def self.seed
    image_folder = 'eat'
    parent_category = Category.find_by_name_en("Want to Eat")
    items = [
      {
        name: "chicken",
        name_en: "chicken",
        image: "#{image_folder}/chicken.svg",
      },
      {
        name: "eat",
        name_en: "eat",
        image: "#{image_folder}/eat.svg",
      },
      {
        name: "kushikatsu",
        name_en: "kushikatsu",
        image: "#{image_folder}/kushikatsu.svg",
      },
      {
        name: "onigiri",
        name_en: "onigiri",
        image: "#{image_folder}/onigiri.svg",
      },
      {
        name: "salad",
        name_en: "salad",
        image: "#{image_folder}/salad.svg",
      },
      {
        name: "sush",
        name_en: "sush",
        image: "#{image_folder}/sush.svg",
      },
      {
        name: "wasabi",
        name_en: "wasabi",
        image: "#{image_folder}/wasabi.svg",
      },
      {
        name: "crab",
        name_en: "crab",
        image: "#{image_folder}/crab.svg",
      },
      {
        name: "fried",
        name_en: "fried",
        image: "#{image_folder}/fried-rice.svg",
      },
      {
        name: "meat",
        name_en: "meat",
        image: "#{image_folder}/meat-ball.svg",
      },
      {
        name: "pizza",
        name_en: "pizza",
        image: "#{image_folder}/pizza.svg",
      },
      {
        name: "sashimi",
        name_en: "sashimi",
        image: "#{image_folder}/sashimi.svg",
      },
      {
        name: "takoyaki",
        name_en: "takoyaki",
        image: "#{image_folder}/takoyaki.svg",
      },
      {
        name: "crepe",
        name_en: "crepe",
        image: "#{image_folder}/crepe.svg",
      },
      {
        name: "gyoza",
        name_en: "gyoza",
        image: "#{image_folder}/gyoza.svg",
      },
      {
        name: "soup",
        name_en: "soup",
        image: "#{image_folder}/soup.svg",
      },
      {
        name: "ramen",
        name_en: "ramen",
        image: "#{image_folder}/ramen.svg",
      },
      {
        name: "somen",
        name_en: "somen",
        image: "#{image_folder}/somen.svg",
      },
      {
        name: "tea",
        name_en: "tea",
        image: "#{image_folder}/tea.svg",
      },
      {
        name: "curry",
        name_en: "curry",
        image: "#{image_folder}/curry.svg",
      },
      {
        name: "hamburger",
        name_en: "hamburger",
        image: "#{image_folder}/hamburger.svg",
      },
      {
        name: "noodles",
        name_en: "noodles",
        image: "#{image_folder}/noodles.svg",
      },
      {
        name: "rice",
        name_en: "rice",
        image: "#{image_folder}/rice.svg",
      },
      {
        name: "steamed_fish",
        name_en: "steamed_fish",
        image: "#{image_folder}/steamed_fish.svg",
      },
      {
        name: "tempura",
        name_en: "tempura",
        image: "#{image_folder}/tempura.svg",
      },

      # {
      #   name: "ご飯",
      #   name_en: "Rice",
      #   description: "ご飯が食べたいです",
      #   description_en: "I want to eat rice",
      #   image: "#{image_folder}/rice.svg",

      # },
      # {
      #   name: "味噌汁",
      #   name_en: "Miso soup",
      #   description: "味噌汁が飲みたいです",
      #   description_en: "I want to drink miso soup",
      #   image: "#{image_folder}/miso_soup.svg",
      # },
      # {
      #   name: "オムレツ",
      #   name_en: "omlet",
      #   description: "オムレツが食べたいです",
      #   description_en: "I want to omlet",
      #   image: "#{image_folder}/omlet.svg",
      # },

    ]
    items.each_with_index do |eat_item, index|
      parent_category.items.create!(
        name: eat_item[:name],
        name_en: eat_item[:name_en],
        position: index + 1,
        description: eat_item[:description],
        description_en: eat_item[:description_en],
        image: eat_item[:image],
        )
    end
  end

end