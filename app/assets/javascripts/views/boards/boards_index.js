ProFlo.Views.BoardsIndex = Backbone.CompositeView.extend({
  template: JST['boards/index'],

  className: 'boards-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addBoard);
  },

  render: function () {
    var content = this.template({
      boards: this.collection
    });

    this.$el.html(content);
    this.renderBoards();
    this.renderBoardForm();
    return this;
  },
  
  addBoard: function (board) {
    var view = new ProFlo.Views.BoardDetail({
      model: board
    });
    
    this.addSubview('#boards', view);
  },
  
  renderBoards: function() {
    this.collection.each(this.addBoard.bind(this));
  },
  
  renderBoardForm: function () {
    var view = new ProFlo.Views.BoardForm({
      collection: this.collection
    });
    
    this.addSubview('.boards-header', view);
  }
});