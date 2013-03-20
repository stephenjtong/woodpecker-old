Woodpecker.Views.Pages ||= {}

class Woodpecker.Views.Pages.ShowView extends Backbone.View
  template: JST["backbone/templates/pages/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
