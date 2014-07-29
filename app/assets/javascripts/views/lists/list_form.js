ProFlo.Views.ListForm = Backbone.LinkFormView.extend({
  formTemplate: JST['lists/form'],
  linkTemplate: JST['lists/form_link'],

  create: function (event) {
    event.preventDefault();
    this.collection.create({
      title: this.$('input').val(),
      board_id: this.collection.board.id
    }, { wait: true });
    this.$('input').val('');
    this.$('input').focus();
  }
});