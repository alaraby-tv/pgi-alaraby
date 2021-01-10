crumb :root do
  link "Home", root_path
end

crumb :invitation do
  link "Invitation", new_user_invitation_path
  parent :root
end

crumb :change_password do
  link "Change password", new_user_password_path
  parent :root
end

crumb :products do
  link "Products", products_path
  parent :root
end

crumb :product do |product|
  link product.english_title, product_path(product)
  parent :products, product
end

crumb :edit_product do |product|
  if product.english_title?
    link 'Edit Product', product_path(product)
    parent :product, product
  elsif product.product_type
    link "New #{product.product_type.sort.titleize}", product_path(product)
    parent :products, product
  else
    link "New Product"
    parent :products, product
  end
end

crumb :product_permissions do |product, permition|
  link "Permissions", product_permissions_path
  parent :product, product
end

crumb :product_marketing_materials do |product|
  link "Marketing Materials", product_marketing_materials_path(product)
  parent :product, product
end

crumb :product_marketing_material do |product, marketing_material|
  link marketing_material.name, product_marketing_material_path(product, marketing_material)
  parent :product_marketing_materials, product, marketing_material
end

crumb :edit_product_marketing_material do |product, marketing_material|
  link 'Edit Material', edit_product_marketing_material_path(product, marketing_material)
  parent :product_marketing_material, product, marketing_material
end

crumb :new_product_marketing_material do |product, marketing_material|
  link 'New Folder', new_product_marketing_material_path(product, marketing_material)
  parent :product_marketing_materials, product, marketing_material
end

crumb :product_episodes do |product|
  link 'Episodes', product_episodes_path(product)
  parent :product, product
end

crumb :product_episode do |product, episode|
  link episode.english_title, product_episode_path(product, episode)
  parent :product_episodes, product
end
crumb :new_product_episode do |product|
  link 'New Episode', new_product_episode_path(product)
  parent :product_episodes, product
end

crumb :edit_product_episode do |product, episode|
  link 'Edit Episode', edit_product_episode_path(product, episode)
  parent :product_episode, product, episode
end

crumb :product_episode_marketing_materials do |product, episode, marketing_material|
  link 'Marketing Materials', product_episode_marketing_materials_path(product, episode, marketing_material)
  parent :product_episode, product, episode
end

crumb :product_episode_marketing_material do |product, episode, marketing_material|
  link marketing_material.name, product_episode_marketing_material_path(product, episode, marketing_material)
  parent :product_episode_marketing_materials, product, episode
end

crumb :new_product_episode_marketing_material do |product, episode, marketing_material|
  link 'New Folder', new_product_episode_marketing_material_path(product, episode, marketing_material)
  parent :product_episode_marketing_materials, product, episode
end

crumb :edit_product_episode_marketing_material do |product, episode, marketing_material|
  link 'Edit Material', edit_product_episode_marketing_material_path(product, episode, marketing_material)
  parent :product_episode_marketing_material, product, episode, marketing_material
end



# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).