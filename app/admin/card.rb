ActiveAdmin.register Card do
  permit_params :advancement_cost, :agenda_point, :cost, :data_pack_id, :deck_id, :deck_minimum_cards, :description, :faction_id, :id, :identity_id, :image_id, :influence, :link, :max_influence, :memory_units, :name, :slug, :strength, :trash_cost

  controller do
    defaults finder: :find_by_slug
  end

  index do
    column "id" do |card|
      link_to card.id, admin_card_path(card)
    end

    column "Name" do |card|
      link_to card.name, admin_card_path(card)
    end

    column :description

    column "Image" do |card|
      image_tag card.card_image, style: "width: 60px"
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :slug
      f.input :description
      f.input :image_id
    end

    f.inputs "Features" do
      f.input :advancement_cost
      f.input :agenda_point
      f.input :cost
      f.input :deck_minimum_cards
      f.input :influence
      f.input :link
      f.input :max_influence
      f.input :memory_units
      f.input :strength
      f.input :trash_cost
    end

    f.inputs "Associations" do
      f.input :data_pack_id
      f.input :deck_id
      f.input :faction_id
      f.input :identity_id
    end

    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

