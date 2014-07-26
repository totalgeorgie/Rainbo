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
  
  index: function() {
    this.$rootEl.html('backbone.js is working as intended.');
  },
  
  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});