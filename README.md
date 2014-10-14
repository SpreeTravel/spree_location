Spree Location
=========
Spree Location, is an extension of spree e-commerce platform. It provides spree's products with a latitude and a longitude, and also adds a map with the product location on it's details view, and on the products listing with the locations of all the products listed.

###Important Note
The Spree Location project is a work in progress, and will suffer major changes. Please use it and keep a live feedback with the team by opening a [GitHub issue](https://github.com/openjaf/spree_location/issues/new).

Requirements
------------
### Rails and Spree
Spree Location now requires Rails version **>= 4.0** and a Spree version **>=2.1**.
### Other components
The extension uses the google maps public API to generate the maps view. It hold no api key, and for a major use of it features you need to provide a key on **app/helpers/spree/products_helper_decorator.rb**

Installation
------------

Spree Location is not yet distributed as a gem, so it should be used in your app with a git reference or you can download the source and build the gem on your own.

1. Add the following to your Gemfile

  ```ruby
    gem 'spree_location’, :git => 'https://github.com/openjaf/spree_location.git', :branch => 'master'
  ```

2. Run `bundle install`

3. To copy and apply migrations run:

  ```
  rails g spree_location:install
  ```

Features
------------

- Adds location property to products.
- Adds a map view on the product details view and products listing.
- Adds locatable polymorfic model to provide spree's object with a location.


How to use it
------------

After installing the extensions go to **admin/products** and from the products list, edit their latitude and longitude on the products edit view.

![Edit location attributes](/readme_images/edit_view.jpg?raw=true "Products Edit View")

On the product details view now a map with the product location is shown.

![map view](/readme_images/details_view.jpg?raw=true "Products Details View")

### Extending Funtionalities
The **Spree::Location** model added by the extension, is polymorfic, allows other objects on spree's logic to be decorated in the way products are, just follow the same guidelines to extend models by spree.


Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/openjaf/spree_location/compare/).
2. Or open a [GitHub issue](https://github.com/openjaf/spree_location/issues/new).

License
-------

Spree Location is Copyright © 2014 openjaf. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.