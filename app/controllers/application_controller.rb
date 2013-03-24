class ApplicationController < ActionController::Base
  protect_from_forgery

  def success_json
    respond_to do |format|
      format.json{
        render :json => {:errno => 0, :errmsg => ''}
      }
    end
  end

end
