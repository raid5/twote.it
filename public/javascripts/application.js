document.observe("dom:loaded", function() {

  $('submit_image').observe("click", show_submitter);
  
  
  new Form.Element.Observer('quote_quote', 0.2, function(el, value) {
    var len = $('quote_quote').value.length + $('quote_author').value.length;
    
    if (len > 140) {
      var diff = len - 140;
      var quote = $('quote_quote').value;
      $('quote_quote').value = quote.substr(0, quote.length - diff);
    }
    
    
    len = $('quote_quote').value.length + $('quote_author').value.length;
    
    $('quote-count').update(140 - len);
  });
  
  new Form.Element.Observer('quote_author', 0.2, function(el, value) {
    var len = $('quote_quote').value.length + $('quote_author').value.length;
    
    if (len > 140) {
      var diff = len - 140;
      var author = $('quote_author').value;
      $('quote_author').value = author.substr(0, author.length - diff);
    }
    
    
    len = $('quote_quote').value.length + $('quote_author').value.length;
    
    $('quote-count').update(140 - len);
  });
  
});

function show_submitter() {
  $('submitter').show();
}

function hide_submitter() {
  $('submitter').hide();
}