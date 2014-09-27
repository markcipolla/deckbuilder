ActiveAdmin.register Card do
  permit_params :advancement_cost, :agenda_point, :cost, :data_pack_id, :deck_id, :deck_minimum_cards, :description, :faction_id, :id, :identity_id, :image_id, :influence, :link, :max_influence, :memory_units, :name, :slug, :strength, :trash_cost

  controller do
    defaults finder: :find_by_slug
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

