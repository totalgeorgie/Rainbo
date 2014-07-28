ProFlo.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('#main');
  },
  
  routes: {
    '' : 'index',
    'boards/:id' : 'boardShow',
    'users/:id' : 'userShow'
  },
  
  index: function() {
    ProFlo.Collections.boards.fetch();
    
    var view = new ProFlo.Views.BoardsIndex({
      collection: ProFlo.Collections.boards
    });
    
    this._swapView(view);
  },
  
  boardShow: function(id) {
    var board = ProFlo.Collections.boards.getOrFetch(id);
    
    var view = new ProFlo.Views.BoardShow({
      model: board
    });
    
    this._swapView(view);
  },
  
  userShow: function(id) {
    this.$rootEl.html('The user show route was triggered by backbone.js! The id of this user is: ' + id + '.');
  },
  
  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});