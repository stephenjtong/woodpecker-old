class ApplicationController < ActionController::Base
  protect_from_forgery

  def success_json(data = '', errno = 0, errmsg ='')
    respond_to do |format|
      format.json{
        render :json => {:errno => errno, :errmsg => errmsg, :data => data}
      }
    end
  end

  def valid_url?(url)
      uri = URI.parse(url)
        uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
      false
  end

end
