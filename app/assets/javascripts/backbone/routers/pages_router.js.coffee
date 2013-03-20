class Woodpecker.Routers.PagesRouter extends Backbone.Router
  initialize: (options) ->
    @pages = new Woodpecker.Collections.PagesCollection()
    @pages.reset options.pages

  routes:
    "new"      : "newPage"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPage: ->
    @view = new Woodpecker.Views.Pages.NewView(collection: @pages)
    $("#pages").html(@view.render().el)

  index: ->
    @view = new Woodpecker.Views.Pages.IndexView(pages: @pages)
    $("#pages").html(@view.render().el)

  show: (id) ->
    page = @pages.get(id)

    @view = new Woodpecker.Views.Pages.ShowView(model: page)
    $("#pages").html(@view.render().el)

  edit: (id) ->
    page = @pages.get(id)

    @view = new Woodpecker.Views.Pages.EditView(model: page)
    $("#pages").html(@view.render().el)
