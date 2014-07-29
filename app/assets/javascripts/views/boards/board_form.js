ProFlo.Views.BoardForm = Backbone.LinkFormView.extend({
  formTemplate: JST['boards/form'],
  linkTemplate: JST['boards/form_link'],
  
  tagName: 'span',

  create: function (event) {
    event.preventDefault();
    this.collection.create({
      board: { title: this.$('input').val() }
    }, { wait: true });

    this.$('input').val('');
    this.$('input').focus();
  },

  render: function () {
    var content;
    
    if(this.formShowing) {
      content = this.formTemplate();
    } else {
      content = this.linkTemplate();
    }

    this.$el.html(content);
    this.delegateEvents();
    this.collection.trigger('resize');
    return this;
  }
});