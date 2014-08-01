ProFlo.Views.BoardShow = Backbone.CompositeView.extend({
  className: 'board-show',

  events: {
    'sortstop': 'saveOrds',
    'click .list-sidebar-control': 'listHide'
  },

  orderOptions: {
    modelElement: '.list-display',
    modelName: 'list'
  },

  template: JST['boards/show'],

  initialize: function () {
    this.collection = this.model.lists();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addList);
  },

  addList: function (list) {
    var view = new ProFlo.Views.ListShow({
      model: list
    });
    this.addSubview('#lists', view);
  },

  render: function () {
    var content = this.template({
      board: this.model
    });
    this.$el.html(content);
    this.renderLists();
    this.renderListForm();
    this.renderMemberForm();
    return this;
  },

  renderLists: function () {
    this.model.lists().each(this.addList.bind(this));
    this.$('#lists').sortable({
      axis: 'x',
      cursor: 'move',
      cancel: 'input, textarea, button, select, option, .list-cards',
      distance: 5,
      opacity: 0.8,
      tolerance: 'pointer',
      placeholder: 'list-sort-placeholder',
      containment: 'parent',
      revert: true,
      helper: 'clone',
      forceHelperSize: true,
      forcePlaceholderSize: true
    });
  },
  
  renderMemberForm: function() {
    var view = new ProFlo.Views.MemberForm({
      model: this.model
    });
    
    this.addSubview('#members', view);
  },

  renderListForm: function () {
    var view = new ProFlo.Views.ListForm({
      collection: this.collection
    });
    this.addSubview('#panels', view);
  },
  
  listHide: function(e) {
    e.preventDefault();
    var target = $(e.currentTarget).children().data('target-list');
    $(e.currentTarget).toggleClass('list-hide-active');
    $("[data-list-id='" + target +  "']").parent().toggleClass('list-hidden');
  }
  
});

_.extend(ProFlo.Views.BoardShow.prototype, ProFlo.Utils.OrdView);