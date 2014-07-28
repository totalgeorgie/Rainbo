ProFlo.Collections.Lists = Backbone.Collection.extend({
  comparator: 'ord',
  model: ProFlo.Models.List,
  url: 'api/lists',

  initialize: function (models, options) {
    this.board = options.board;
  }
});