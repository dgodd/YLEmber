App.Product = DS.Model.extend
  category: DS.belongsTo('App.Category')
  sub_category: DS.belongsTo('App.Category')

  title: DS.attr('string')
  code: DS.attr('string')
  description: DS.attr('string')
  how_to_use: DS.attr('string')
  ingredients: DS.attr('string')
  tags: DS.attr('array')

  # t.decimal  "price_us",        precision: 6, scale: 2
