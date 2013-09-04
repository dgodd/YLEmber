App.searchController = Em.ObjectController.create({
  searchText: ''
});

App.SearchView = Ember.TextField.extend({
  valueBinding: 'App.searchController.searchText'
})


App.ProductsController = Em.ArrayController.extend({
  sortProperties: ['lastName', 'firstName'],
  activeProductId: null,

  filteredProducts: function() {
    var regexp = new RegExp(App.searchController.get('searchText'), 'i');
    return App.Product.filter(function(hash) {
      return (hash.get('title').match(regexp) || hash.get('code').match(regexp));
    });
  }.property('App.searchController.searchText')
});

