App.Router.reopen({
    location: 'history'
});

App.Router.map(function() {
  this.resource('products');
  this.resource('product', {path: 'products/:product_id'});
});
