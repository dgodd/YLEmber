App.ProductsRoute = Ember.Route.extend({
  model: function() {
    // request all products from adapter
    return App.Product.find();

    // filter products to exclude new ones
    return App.Product.filter(function(product) {
      return !product.get('isNew');
    });
  }
});
