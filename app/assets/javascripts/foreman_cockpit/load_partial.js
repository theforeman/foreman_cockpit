$(document).ready(function() {
  $('a.cockpit_button').bind('click', function () {
    load_partial(this);
  });
});

function load_partial(item) {
  // The Puppet graphs well doesn't have an id, so we have to write
  // our own selector
  var graphs_well = $('#host-show > div:nth-child(2)');
  $.ajax({
    type:'get',
    url: $(item).attr('data-url'),
    success:function (result) {
      graphs_well.html(result);
    },
    complete:function (result) {
    }
  });
}
