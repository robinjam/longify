# select.js.coffee
# Allows skinning of <select> elements
jQuery.fn.skin_select = ->
  skinnedSelect = $("<div class=\"skinned-select\"></div>")
  $(this).wrap(skinnedSelect)
  $(this).parent().prepend("<img src=\"/drop-down.png\" class=\"drop-down-icon\">")
  $(this).parent().prepend("<div class=\"selected-item\">#{$(this).find("option:selected").text()}</div>")
  $(this).change(-> $(this).parent().find(".selected-item").text($(this).find("option:selected").text()))
