class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    # cf http://oauth.rubyforge.org/rdoc/classes/OAuth/AccessToken.html
    @consumer_tokens=TestToken.all :conditions=>{:user_id=>current_user.id}
    if @consumer_tokens.length > 0
      @token = @consumer_tokens.first.client
      logger.info "private data: "+@token.get("/data/index").body
    end
  end
end
