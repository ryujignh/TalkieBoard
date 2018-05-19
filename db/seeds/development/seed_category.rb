class SeedCategory

  def self.create
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {name: "食べる", name_en: "Eat", image: "eat/eat.png"},
      {name: "飲む", name_en: "Drink", image: "drink/drink.png"},
      {name: "トイレ", name_en: "Toilet", image: "bathroom/toilet.png"},
      {name: "シャワー", name_en: "Shower", image: "bathroom/shower.png"},
      {name: "気分", name_en: "Feeling", image: "feeling/feeling.png"},
    ]

    categories.each do |category|
      Category.create!(
        name: category[:name],
        name_en: category[:name_en],
        image: category[:image],
      )
    end
  end

end