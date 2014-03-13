Deface::Override.new(
  :virtual_path => "spree/admin/products/index",
  :name => "add_map_to_products_list",
  :insert_after => '[data-hook="admin_products_sidebar"]',
  :partial => "spree/products/products_map",
  :disabled => false
)
