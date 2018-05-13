class SeedItem

  def self.create
    puts "Running #{self}..."

    Item.all.destroy_all

    image = SeedShared.image

    eat_category = Category.find_by_name_en("Eat")
    eat_items = [
      {
        name: "ご飯",
        name_en: "Rice",
        description: "ご飯が食べたいです",
        description_en: "I want to eat rice",
        image: image,

      },
      {
        name: "味噌汁",
        name_en: "Miso soup",
        description: "味噌汁が飲みたいです",
        description_en: "I want to drink miso soup",
        image: image,
      },
      {
        name: "オムレツ",
        name_en: "omlet",
        description: "オムレツが食べたいです",
        description_en: "I want to omlet",
        image: image,
      },

    ]
    eat_items.each do |eat_item|
      eat_category.items.create!(
        name: eat_item[:name],
        name_en: eat_item[:name_en],
        description: eat_item[:description],
        description_en: eat_item[:description_en],
        image: eat_item[:image],
        )
    end
  end

end