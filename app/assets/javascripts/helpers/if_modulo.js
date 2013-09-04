Handlebars.registerHelper('ifModulo', function(modulo, options) {
  if((options.data.view.get('contentIndex') % modulo) == (modulo - 1)) {
    return options.fn(this);
  }
  return options.inverse(this);
});
