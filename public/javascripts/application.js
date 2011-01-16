document.observe("dom:loaded", function() {
  
  $('quote-container').appear();

  $('submit_image').observe("click", show_submitter);
  
  Event.observe(document, 'keypress', function(evt) {
    if (evt.keyCode == 27 && $('submitter').visible()) {
      hide_submitter();
    }
  });
  
  new Form.Element.Observer('quote_quote', 0.2, function(el, value) {
    var len = $('quote_quote').value.length + $('quote_author').value.length;
    
    if (len > 140) {
      var diff = len - 140;
      var quote = $('quote_quote').value;
      $('quote_quote').value = quote.substr(0, quote.length - diff);
    }
    
    
    len = $('quote_quote').value.length + $('quote_author').value.length;
    
    $('quote_count').update(140 - len);
  });
  
  new Form.Element.Observer('quote_author', 0.2, function(el, value) {
    var len = $('quote_quote').value.length + $('quote_author').value.length;
    
    if (len > 140) {
      var diff = len - 140;
      var author = $('quote_author').value;
      $('quote_author').value = author.substr(0, author.length - diff);
    }
    
    
    len = $('quote_quote').value.length + $('quote_author').value.length;
    
    $('quote_count').update(140 - len);
  });
  
  // Observe form submission
  Event.observe('new_quote', 'submit', function(e) {
    if ($('quote_quote').value.length == 0) {
      e.stop();
      
      $('quote-count').insert({
        'after' : '<div id="flash_error">Quote is required.</div>'
      });
    }
  });
  
});

function show_submitter() {
  $('overlay').appear({ duration: 0.7 });
  $('submitter').appear({ duration: 0.7 });
}

function hide_submitter() {
  $('overlay').fade({ duration: 0.7 });
  $('submitter').fade({ duration: 0.7 });
}