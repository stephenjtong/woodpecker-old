class Woodpecker.Models.Feed extends Backbone.Model
  paramRoot: 'feed'

  defaults:
    url: null
    name: null

class Woodpecker.Collections.FeedsCollection extends Backbone.Collection
  model: Woodpecker.Models.Feed
  url: '/feeds'
