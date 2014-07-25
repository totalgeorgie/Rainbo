ProFlo.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('#main');
  },
  
  routes: {
    '' : 'index',
    '/why' : 'why',
    '/community' : 'community',
    '/help' : 'help'
  },
  
  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});