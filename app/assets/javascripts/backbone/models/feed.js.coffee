class Woodpecker.Models.Feed extends Backbone.Model
  paramRoot: 'feed'

  defaults:
    url: null
    name: "google"

class Woodpecker.Collections.FeedsCollection extends Backbone.Collection
  model: Woodpecker.Models.Feed
  url: '/feeds'
