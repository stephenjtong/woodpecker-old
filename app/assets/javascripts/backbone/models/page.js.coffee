class Woodpecker.Models.Page extends Backbone.Model
  paramRoot: 'page'

  defaults: null

class Woodpecker.Collections.PagesCollection extends Backbone.Collection
  model: Woodpecker.Models.Page
  url: '/pages'
