class SeedCategory

  def self.create
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {name: "気分を伝えたい", name_ja: "Tell feeling", image: "feeling/feeling.svg"},
      {name: "食べたい", name_ja: "Want to eat", image: "eat/eat.svg"},
      {name: "飲みたい", name_ja: "Want to drink", image: "drink/drink.svg"},
      {name: "トイレに行きたい", name_ja: "Go to bathroom", image: "bathroom/toilet.svg"},
      {name: "お風呂に入りたい", name_ja: "Take bath", image: "bathroom/bath.svg"},
    ]

    categories.each_with_index do |category, index|
      Category.create!(
        name: category[:name],
        name_ja: category[:name_ja],
        position: index + 1,
        image: category[:image],
      )
    end
  end

end