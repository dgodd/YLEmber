App.ProductInListView = Em.View.extend({
  templateName: 'product_in_list',
  tagName: 'li',
  classNameBindings: 'isActive:active',

  isActive: function() {
    return this.get('content.id') === this.get('controller.activeProductId');
  }.property('controller.activeProductId')
});
