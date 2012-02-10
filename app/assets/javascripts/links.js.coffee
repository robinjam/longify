jQuery ->
  $("#longified-uri").focus().select()
  $("#link_uri").focus()
  $('body')
    .bind 'start.pjax', ->
      $("[data-pjax-container]").animate({ opacity: 0 }, 100)
    .bind 'end.pjax', ->
      $("[data-pjax-container]").animate({ opacity: 1 }, 100)
      $("#link_uri").focus()
      $("html, body").animate({ scrollTop: 0 }, "slow")
