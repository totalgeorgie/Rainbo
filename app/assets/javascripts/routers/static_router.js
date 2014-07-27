ProFlo.Routers.StaticRouter = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('#main');
  },
  
  routes: {
    'why' : 'why',
    'community' : 'community',
    'help' : 'help'
  },
  
  why: function() {
    this.$rootEl.html('The why route was triggered by backbone.js!');
  },
  
  community: function() {
    this.$rootEl.html('The community route was triggered by backbone.js!');
  },
  
  help: function() {
    this.$rootEl.html('The help route was triggered by backbone.js!');
  },
  
  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});