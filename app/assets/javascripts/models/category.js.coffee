App.Category = DS.Model.extend
  # products: DS.hasMany('App.Product')

  name: DS.attr('string')
  description: DS.attr('string')
  image_url: DS.attr('string')

  # t.integer  "parent_id"
