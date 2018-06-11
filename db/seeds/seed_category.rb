class SeedCategory

  def self.create
    puts "=================Creating Category================="
    puts "Running #{self}..."

    Category.all.destroy_all

    image = SeedShared.image

    categories = [
      {identifier: 'Feeling', name: "Feeling", name_ja: "気分", image: "feeling/feeling.svg"},
      {identifier: 'pain_scale', name: "Pain scale", name_ja: "痛み", image: "pain_scale/pain_scale.svg"},
      {identifier: 'trouble', name: "Trouble", name_ja: "困っています", image: "trouble/trouble.svg"},
      {identifier: 'request', name: "Request", name_ja: "困っています", image: "request/request.svg"},
      {identifier: 'Greeting', name: "Greetings", name_ja: "あいさつ", image: "greeting/greeting.svg"},
      {identifier: 'antonym', name: "antonym", name_ja: "反対語", image: "antonym/antonym.svg"},
      {identifier: 'number', name: "number", name_ja: "数字", image: "number/number.svg"},
      {identifier: 'Body', name: "Body", name_ja: "身体の状態", image: "body/body.svg"},
      {identifier: 'Drink', name: "Drink", name_ja: "飲みたい", image: "drink/drink.svg"},
      {identifier: 'Bathroom', name: "Bathroom", name_ja: "トイレに行きたい", image: "bathroom/toilet.svg"},
      {identifier: 'Bath', name: "Bath", name_ja: "お風呂に入りたい", image: "bathroom/bath.svg"},
    ]

    categories.each_with_index do |category, index|
      Category.create!(
        identifier: category[:identifier],
        name: category[:name],
        name_ja: category[:name_ja],
        position: index + 1,
        image: category[:image],
      )
    end
  end

end