class SeedCategory

  def self.create
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {name: "Tell feeling", name_ja: "気分を伝えたい", image: "feeling/feeling.svg"},
      {name: "Want to drink", name_ja: "飲みたい", image: "drink/drink.svg"},
      {name: "Go to bathroom", name_ja: "トイレに行きたい", image: "bathroom/toilet.svg"},
      {name: "Take bath", name_ja: "お風呂に入りたい", image: "bathroom/bath.svg"},
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