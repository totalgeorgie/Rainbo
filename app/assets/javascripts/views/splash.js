ProFlo.Views.Splash = Backbone.View.extend({
  template: JST['static/splash'],
  render: function() {
    var content = this.template({});
    this.$el.html(content);
    return this;
  }
});