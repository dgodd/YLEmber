// App.Adapter = DS.RESTAdapter.extend({
  // bulkCommit: false
// });

// App.Adapter.map('App.Product', {
  // // phoneNumbers: {embedded: 'always'}
// });

App.Store = DS.Store.extend({
  revision: 13,
  // adapter:  App.Adapter.create()
  adapter:  DS.RESTAdapter.create()
});
