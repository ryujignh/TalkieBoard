# Dir["db/seeds/development/*.rb"].each {|file| require file }
require_relative 'seed_pain_scale_item'
require_relative 'seed_feeling_item'
require_relative 'seed_trouble_item'
require_relative 'seed_request_item'
require_relative 'seed_antonym_item'
require_relative 'seed_number_item'
require_relative 'seed_body_item'
require_relative 'seed_greeting_item'

class SeedItem

  def self.create
    puts "=================Creating Item================="
    puts "Running #{self}..."

    Item.all.destroy_all
    SeedPainScaleItem.create
    SeedFeelingItem.create
    SeedTroubleItem.create
    SeedRequestItem.create
    SeedAntonymItem.create
    SeedNumberItem.create
    SeedBodyItem.create
    SeedGreetingItem.create
  end

  private

  def self.seed_items(parent_category, items, image_folder)
    items.each do |item|
      parent_category.items.create!(
        name: item['name'],
        name_ja: item['name_ja'],
        position: item['position'],
        description: item['description'],
        description_ja: item['description_ja'],
        image: "#{image_folder}/#{item['image']}.svg",
        )
    end
  end

end