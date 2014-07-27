ProFlo.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('#main');
  },
  
  routes: {
    '' : 'index',
    'users/:id' : 'userShow'
  },
  
  index: function() {
    this.$rootEl.html('The index route was triggered by backbone.js!');
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