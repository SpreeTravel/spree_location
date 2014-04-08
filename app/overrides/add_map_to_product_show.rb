Deface::Override.new(
    :virtual_path => 'spree/products/show',
    :name => 'add_map_to_product_show',
    :insert_after => '[data-hook="product_left_part_wrap"]',
    :partial => "spree/products/product_map"
)
