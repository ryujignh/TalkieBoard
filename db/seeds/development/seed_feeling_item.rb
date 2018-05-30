class SeedFeelingItem

  def self.seed
    image_folder = 'feeling'
    parent_category = Category.find_by_name_en('Tell feeling')
    items = [
      {
        name: "1",
        name_en: "1",
        position: 1,
        description: "痛みがない。",
        description_en: "No pain",
        image: "#{image_folder}/1.svg",
      },
      {
        name: "2",
        name_en: "2",
        position: 2,
        description: "わずかに痛む。",
        description_en:  "Slightly sore",
        image: "#{image_folder}/2.svg",
      },
      {
        name: "3",
        name_en: "3",
        position: 3,
        description: "少し傷んで辛い。",
        description_en: "It hurts a little bit.",
        image: "#{image_folder}/3.svg",
      },
      {
        name: "4",
        name_en: "4",
        position: 4,
        description: "痛くて辛い。",
        description_en: "It hurts so hard.",
        image: "#{image_folder}/4.svg",
      },
      {
        name: "5",
        name_en: "5",
        position: 5,
        description: "すごくて痛くてとても辛い。",
        description_en: "It is terribly painful.",
        image: "#{image_folder}/5.svg",
      },
      {
        name: "6",
        name_en: "6",
        position: 6,
        description: "耐えられないほど痛い。",
        description_en: "It is unbearably painful.",
        image: "#{image_folder}/6.svg",
      },
    ]

    items.each_with_index do |item, index|
      parent_category.items.create!(
        name: item[:name],
        name_en: item[:name_en],
        position: item[:position],
        description: item[:description],
        description_en: item[:description_en],
        image: item[:image],
        )
    end

  end

end