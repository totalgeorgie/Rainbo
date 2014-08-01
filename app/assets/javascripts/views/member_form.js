ProFlo.Views.MemberForm = Backbone.LinkFormView.extend({
  formTemplate: JST['member_form'],
  linkTemplate: JST['member_form_link'],
  
  create: function(e) {
    e.preventDefault();
    $.ajax({
      url: '/api/boards/subscribe',
      type: 'GET',
      data: {
        board_id: this.model.get('id'),
        user_email: $('#user-email').val()
      },
      success: function() {
        alert('nice');
      },
      error: function() {
        alert('oops');
      }
    });
  }
});