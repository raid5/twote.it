document.observe("dom:loaded", function() {

  $('submit_image').observe("click", show_submitter);
  
});

function show_submitter() {
  $('submitter').show();
}

function hide_submitter() {
  $('submitter').hide();
}