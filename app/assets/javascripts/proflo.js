window.ProFlo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},
  initialize: function() {
    new ProFlo.Routers.Router();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ProFlo.initialize();
});