Spree::Location
---------------
* adiciona longitude y latitude
* como mismo hay productos_relacionados o productos_recomendados esta gema adiciona "productos_cercanos"
* modifica la vista show para poner los productos cercanos
* modifica la vista show para poner un mapita
* define relaciones
  - i_am_close_to_this_product
* define el metodos [productos_cercanos (nearest)]
  - por defecto devuelve los productos relacionados con la relacion i_am_related_to_this_product
  - los herederos lo pueden sobreescribir
* Spree::Config
  - how_many_near_products
  - max_distance_in_map
  - show_nearest_or_related (con las relaciones)
  - en la interfaz de admin permite configurar estas cosas
* adiciona ICON a producto que es para mostrar en el MAPA
  - icono editable en la vista de administracion
