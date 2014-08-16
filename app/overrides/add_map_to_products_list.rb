Deface::Override.new(
  :virtual_path => "spree/products/index",
  :name => "add_map_to_products_list",
  :insert_after => '[data-hook="homepage_sidebar_navigation"]',
  :partial => "spree/products/products_map",
  :disabled => false
)
