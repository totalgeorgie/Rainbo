ProFlo.Collections.Cards = Backbone.Collection.extend({
  comparator: 'ord',
  model: ProFlo.Models.Card,
  url: 'api/cards',

  initialize: function (models, options) {
    this.list = options.list;
  }
});