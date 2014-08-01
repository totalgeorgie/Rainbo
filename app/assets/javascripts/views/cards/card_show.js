ProFlo.Views.CardShow = Backbone.View.extend({
  template: JST['cards/show'],

  className: 'card well well-sm card-display',
  
  events: {
    'dblclick' : 'expand',
    'submit form' : 'updateCard'
  },

  attributes: function() {
    return {
      'data-card-id': this.model.id
    };
  },

  render: function () {
    var content = this.template({
      card: this.model
    });
    this.$el.html(content);
    this.$el.addClass('card-' + this.model.attributes.status);
    return this;
  },
  
  expand: function(e) {
    e.preventDefault();
    
    this.$el.toggleClass('card-toggled');
  },
  
  updateCard: function(e) {
    e.preventDefault();
    
    alert('Updating cards is temporarily disabled for the beta! Sorry.');
  }
});