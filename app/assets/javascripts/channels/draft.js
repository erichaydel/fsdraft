//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

function replaceSpot(td, li) {
    td.html(li.html());
    td.addClass(li.attr('class'));
    td.prop('disabled', true);
    li.remove();
}

App.messages = App.cable.subscriptions.create('DraftChannel', {
  received: function(data) {
    td = $("#pick-" + data.pick);
    li = $("#" + data.id);
    replaceSpot(td, li);
  }
});
