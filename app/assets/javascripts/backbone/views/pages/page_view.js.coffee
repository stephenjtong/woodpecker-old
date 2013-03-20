Woodpecker.Views.Pages ||= {}

class Woodpecker.Views.Pages.PageView extends Backbone.View
  template: JST["backbone/templates/pages/page"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
