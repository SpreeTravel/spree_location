Deface::Override.new(
    :virtual_path => 'spree/products/show',
    :name => 'add_map_to_product',
    :insert_after => "[data-hook='product_properties']",
    #:text          => "<p>Product map is the future!</p>"
    :partial => "spree/products/product_map",
    #:disabled => false
)
