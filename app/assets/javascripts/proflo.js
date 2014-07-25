window.ProFlo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ProFlo.Routers.Router
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ProFlo.initialize();
});