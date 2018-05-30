class SeedEatItem

  def self.seed
    image_folder = 'eat'
    parent_category = Category.find_by_name_en("Want to Eat")
    items = [
      {
        name: "ご飯",
        name_en: "Rice",
        description: "ご飯が食べたいです",
        description_en: "I want to eat rice",
        image: "#{image_folder}/rice.svg",

      },
      {
        name: "味噌汁",
        name_en: "Miso soup",
        description: "味噌汁が飲みたいです",
        description_en: "I want to drink miso soup",
        image: "#{image_folder}/miso_soup.svg",
      },
      {
        name: "オムレツ",
        name_en: "omlet",
        description: "オムレツが食べたいです",
        description_en: "I want to omlet",
        image: "#{image_folder}/omlet.svg",
      },

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