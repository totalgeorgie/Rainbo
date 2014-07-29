ProFlo.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('#main');
  },
  
  routes: {
    '' : 'index',
    'boards/:id' : 'boardShow'
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
  
  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});