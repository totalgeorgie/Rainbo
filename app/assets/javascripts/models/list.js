ProFlo.Models.List = Backbone.Model.extend({
  cards: function () {
    if(!this._cards) {
      this._cards = new ProFlo.Collections.Cards([], { list: this });
    }
    return this._cards;
  },

  parse: function (response) {
    if(response.cards) {
      this.cards().set(response.cards, { parse: true });
      delete response.cards;
    }
    return response;
  }
});