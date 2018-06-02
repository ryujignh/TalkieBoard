class SeedFeelingItem

  def self.seed
    image_folder = 'feeling'
    parent_category = Category.find_by_name_ja('Tell feeling')
    items = [
      {
        name: "1",
        name_ja: "1",
        position: 1,
        description: "痛みがない。",
        description_ja: "No pain",
        image: "#{image_folder}/1.svg",
      },
      {
        name: "2",
        name_ja: "2",
        position: 2,
        description: "わずかに痛む。",
        description_ja:  "Slightly sore",
        image: "#{image_folder}/2.svg",
      },
      {
        name: "3",
        name_ja: "3",
        position: 3,
        description: "少し傷んで辛い。",
        description_ja: "It hurts a little bit.",
        image: "#{image_folder}/3.svg",
      },
      {
        name: "4",
        name_ja: "4",
        position: 4,
        description: "痛くて辛い。",
        description_ja: "It hurts so hard.",
        image: "#{image_folder}/4.svg",
      },
      {
        name: "5",
        name_ja: "5",
        position: 5,
        description: "すごくて痛くてとても辛い。",
        description_ja: "It is terribly painful.",
        image: "#{image_folder}/5.svg",
      },
      {
        name: "6",
        name_ja: "6",
        position: 6,
        description: "耐えられないほど痛い。",
        description_ja: "It is unbearably painful.",
        image: "#{image_folder}/6.svg",
      },
    ]

    items.each_with_index do |item, index|
      parent_category.items.create!(
        name: item[:name],
        name_ja: item[:name_ja],
        position: item[:position],
        description: item[:description],
        description_ja: item[:description_ja],
        image: item[:image],
        )
    end

  end

end