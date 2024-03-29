Woodpecker.Views.Pages ||= {}

class Woodpecker.Views.Pages.IndexView extends Backbone.View
  template: JST["backbone/templates/pages/index"]

  initialize: () ->
    @options.pages.bind('reset', @addAll)

  constructor: (options) ->
    super(options)
    @collection = new Woodpecker.Collections.FeedsCollection
    @model = new @collection.model() 
    console.log(@model)
    @model.bind("change:errors", () =>
            this.render()
    )
  addAll: () =>
    @options.pages.each(@addOne)

  addOne: (page) =>
    view = new Woodpecker.Views.Pages.PageView({model : page})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(pages: @options.pages.toJSON() ))
    @addAll()

    return this

  events: =>
    "click #lhn-add-subscription": "quick_subcrib"
    "click #quick-add-close": "quick_add_close"
    "submit #quick-add-form": "save"

  save: (e) ->  
    $('#quick-add-bubble-holder').attr('class', 'hidden')
    $('#loading-area-container').removeClass('hidden')
    e.preventDefault() 
    e.stopPropagation() 
    @model.unset("errors") 
    @model.set('url', $("#url").val()) 
    @collection.create(@model.toJSON(),
            success: (feed) => 
                $('#loading-area-container').addClass('hidden')
            error: (post, jqXHR) => 
                @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  quick_add_close: =>
    $('#quick-add-bubble-holder').attr('class', 'hidden')

  quick_subcrib: =>
    if $('#quick-add-bubble-holder').attr('class') == 'hidden'
        $('#quick-add-bubble-holder').attr('class', 'quick-add-bubble-holder')
    else
        $('#quick-add-bubble-holder').attr('class', 'hidden')


