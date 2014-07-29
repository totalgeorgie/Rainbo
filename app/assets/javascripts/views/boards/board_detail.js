ProFlo.Views.BoardDetail = Backbone.View.extend({
  template: JST['boards/detail'],
  
  className: 'board-detail-div',
  
  events: {
    'mouseenter': 'showControls',
    'mouseleave': 'showControls'
  },
  
  render: function() {
    var content = this.template({
      board: this.model
    });
    
    this.$el.attr('data-board-id', this.model.get('id'));
    this.$el.html(content);
    return this;
  },
  
  showControls: function(e) {
    e.preventDefault();
    
    this.$('.board-controls').toggleClass('controls-visible');
  }
});