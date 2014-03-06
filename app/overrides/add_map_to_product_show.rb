Deface::Override.new(
    :virtual_path => 'spree/products/show',
    :name => 'add_map_to_product_show',
    :insert_after => '[class="row"]',
    :partial => "spree/products/product_map",
)
