ProFlo.Views.BoardsIndex = Backbone.CompositeView.extend({
  template: JST['boards/index'],

  className: 'boards-index',
  
  events: {
    'click .board-members': 'showMembers',
    'click .board-settings': 'showSettings',
    'click .board-delete': 'boardDelete'
  },
  
  showMembers: function(e) {
    e.preventDefault();
    
  },
  
  showSettings: function(e) {
    e.preventDefault();
    
    
  },
  
  boardDelete: function(e) {
    e.preventDefault();
    var view = this;
    
    var boardId = $(e.currentTarget).parents('.board-detail-div')
                                    .data('board-id');
    
    var deleteConfirm = confirm("PERMANENTLY delete this project and all of its contents?")
    
    if (deleteConfirm === true) {
      this.collection.getOrFetch(boardId).destroy();                                
      _($("[data-board-id=" + boardId + "]")).each(function(subv){
        view.removeSubview('#boards', subv);
      });
    }
  },

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
    
    this.addSubview('#boards', view, { type: 'prepend' });
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