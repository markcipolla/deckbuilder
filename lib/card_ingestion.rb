require 'wombat'

# A little class for scraping a list of cards from acoo.net
# http://www.acoo.net/card-detail
# Run it in the console like this:
#
#     CardIngestion.new.run(card_number)
#
class CardIngestion
  def run(card_number)
    (1..card_number).each do |number|
      ingest(number)
    end
  end

  private

  def ingest(number)
    results = Wombat.crawl do
      base_url "http://www.acoo.net"
      path "/card-detail/#{number}"

      name css: ".card-content h1"
      types css: ".card-content .subtitle"
      pack css: ".card-content .card-datapack"
      description css: ".card-content .card-text"
      features({css: ".card-datapack + div + ul li"}, :list)
      image_id({css: ".card-img"}, :html)
    end

    @name = results["name"]
    @types = results["types"].split(" - ")
    @pack = results["pack"]
    @description = results["description"]
    @features = results["features"].collect{ |f| f.split(": ") }
    @image_id = /-(\d{5})/.match(results["image_id"])[1]

    check_types_existence_and_create_if_need_be
    check_packs_existence_and_create_if_need_be

    return if Card.where(name: @name).present?

    @card = Card.new(
      name: @name,
      description: @description,
      data_pack_id: DataPack.where(name: @pack).first.id,
      image_id: @image_id
    )

    @card.card_types << CardType.where(name: @types)

    assign_features

    @card.save!
  end

  def check_packs_existence_and_create_if_need_be
    DataPack.create!(name: @pack) if DataPack.where(name: @pack).empty?
  end

  def check_types_existence_and_create_if_need_be
    @types.each do |type|
      CardType.create!(name: type) if CardType.where(name: type).empty?
    end
  end

  def assign_features
    @features.each do |feature|
      case feature[0]
      when "Cost"
        @card.cost = feature[1]
      when "Memory Unit(s)"
        @card.memory_units = feature[1]
      when "Max Influence"
        @card.max_influence = feature[1]
      when "Deck Minimum Cards"
        @card.deck_minimum_cards = feature[1]
      when "Influence"
        @card.influence = feature[1]
      when "Strength"
        @card.strength = feature[1]
      when "Advancement Cost"
        @card.advancement_cost = feature[1]
      when "Agenda Point"
        @card.agenda_point = feature[1]
      when "Trash Cost"
        @card.trash_cost = feature[1]
      when "Link"
        @card.link = feature[1]
      end
    end
  end
end
