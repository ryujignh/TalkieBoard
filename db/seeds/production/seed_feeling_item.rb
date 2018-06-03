class SeedFeelingItem

  def self.seed
    image_folder = 'feeling'
    parent_category = Category.find_by_name('Tell feeling')
    items = [
      {
        name: "1",
        name_ja: "1",
        position: 1,
        description: "No pain",
        description_ja: "痛みがない。",
        image: "#{image_folder}/1.svg",
      },
      {
        name: "2",
        name_ja: "2",
        position: 2,
        description:  "Slightly sore",
        description_ja: "わずかに痛む。",
        image: "#{image_folder}/2.svg",
      },
      {
        name: "3",
        name_ja: "3",
        position: 3,
        description: "It hurts a little bit.",
        description_ja: "少し傷んで辛い。",
        image: "#{image_folder}/3.svg",
      },
      {
        name: "4",
        name_ja: "4",
        position: 4,
        description: "It hurts so hard.",
        description_ja: "痛くて辛い。",
        image: "#{image_folder}/4.svg",
      },
      {
        name: "5",
        name_ja: "5",
        position: 5,
        description: "It is terribly painful.",
        description_ja: "すごくて痛くてとても辛い。",
        image: "#{image_folder}/5.svg",
      },
      {
        name: "6",
        name_ja: "6",
        position: 6,
        description: "It is unbearably painful.",
        description_ja: "耐えられないほど痛い。",
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