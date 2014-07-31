ProFlo.Views.BoardShow = Backbone.CompositeView.extend({
  className: 'board-show',

  events: {
    'sortstop': 'saveOrds'
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
      tolerace: 'pointer',
      placeholder: 'list-sort-placeholder',
      containment: 'parent',
      revert: true,
      helper: 'clone',
      forceHelperSize: true,
      forcePlaceholderSize: true
    });
  },

  renderListForm: function () {
    var view = new ProFlo.Views.ListForm({
      collection: this.collection
    });
    this.addSubview('#sidebar', view, { type: 'prepend'});
  }
});

_.extend(ProFlo.Views.BoardShow.prototype, ProFlo.Utils.OrdView);