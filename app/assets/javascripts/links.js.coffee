jQuery ->
  # Focus the input box on the new link page, if present
  $("#link_uri").focus()
  
  # Focus and select the longified URI on the show link page, if present
  $("#longified_uri").focus().select()
  
  # Skin all select elements
  $("select").skin_select()
  
  $('body')
    .bind 'start.pjax', ->
      # Fade the main content out
      $("[data-pjax-container]").animate({ opacity: 0 }, 100)
      
    .bind 'end.pjax', ->
      # Fade the main content back in
      $("[data-pjax-container]").animate({ opacity: 1 }, 100)
      
      # Scroll to the top of the page
      $("html, body").animate({ scrollTop: 0 }, "slow")
      
      # Focus the input box on the new link page, if present
      $("#link_uri").focus()
      
      # Re-skin the select elements
      $("select").skin_select()
