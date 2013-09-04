App.ProductRoute = Ember.Route.extend({
  model: function(params) {
    // request all products from adapter
    return App.Product.find(params.product_id);
  }

  // setupController: function(controller, model) {
    // this._super.apply(this, arguments);

    // // highlight this product as active
    // this.controllerFor('products').set('activeProductId', model.get('id'));
  // },

  // deactivate: function() {
    // var controller = this.controllerFor('product');

    // // un-highlight the active product (perhaps temporarily)
    // this.controllerFor('products').set('activeProductId', null);
  // }
});
