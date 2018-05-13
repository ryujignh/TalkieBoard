class SeedCategory

  def self.create
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {name: "食べる", name_en: "Eat", image: image},
      {name: "飲む", name_en: "Drink", image: image},
      {name: "トイレ", name_en: "Toilet", image: image},
      {name: "シャワー", name_en: "Shower", image: image},
      {name: "気分", name_en: "Feeling", image: image},
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