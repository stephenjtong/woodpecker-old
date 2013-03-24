
class FeedsController < ApplicationController
  def create
    @feed = Feed.new(params[:feed])
    begin
      @feed.save
    rescue ActiveRecord::RecordNotUnique
      hashed_url = Digest::SHA1.hexdigest @feed.url
      @feed = Feed.find_by_hashed_url(hashed_url)
    end
    subscription = Subscription.new
    subscription.feed = @feed
    subscription.feed_name = 'google'
    current_user.subscriptions << subscription
    current_user.save
  end
end
