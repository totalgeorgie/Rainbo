ProFlo.Views.BoardDetail = Backbone.View.extend({
  template: JST['boards/detail'],
  
  render: function() {
    var content = this.template({
      board: this.model
    });
    
    this.$el.html(content);
    return this;
  }
});