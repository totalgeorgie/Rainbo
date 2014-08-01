ProFlo.Models.Board = Backbone.Model.extend({
  urlRoot: 'api/boards',

  lists: function () {
    if(!this._lists) {
      this._lists = new ProFlo.Collections.Lists([], { board: this });
    }

    return this._lists;
  },
  
  parse: function (response) {
    if(response.lists) {
      this.lists().set(response.lists, { parse: true });
      delete response.lists;
    }
    
    //TODO: convert this to an backbone User model/collection
    
    if(response.members) {
      this.members = response.members;
      delete response.members;
    }

    return response;
  }
});