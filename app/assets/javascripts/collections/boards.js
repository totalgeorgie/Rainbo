ProFlo.Collections.Boards = Backbone.Collection.extend({
  model: ProFlo.Models.Board,
  url: 'api/boards',

  getOrFetch: function (id) {
    var board = this.get(id);

    if(!board) {
      board = new ProFlo.Models.Board({ id: id });
      board.fetch({
        success: function () {
          this.add(board);
        }.bind(this)
      });
    } else {
      board.fetch();
    }

    return board;
  }
});

ProFlo.Collections.boards = new ProFlo.Collections.Boards()