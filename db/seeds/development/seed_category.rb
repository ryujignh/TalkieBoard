class SeedCategory

  def self.create
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {name: "食べたい", name_en: "Want to eat", image: "eat/eat.svg"},
      {name: "飲みたい", name_en: "Want to drink", image: "drink/drink.svg"},
      {name: "トイレに行きたい", name_en: "Go to bathroom", image: "bathroom/toilet.svg"},
      {name: "お風呂に入りたい", name_en: "Take bath", image: "bathroom/bath.svg"},
      {name: "気分を伝えたい", name_en: "Tell feeling", image: "feeling/feeling.svg"},
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