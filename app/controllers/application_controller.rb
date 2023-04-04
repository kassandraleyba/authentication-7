class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    # ||= is memoization. Ruby will look to see if the 
    # variable on the left exists, if it does it uses that value. 
    # If it doesn’t exist it preforms the operation on the right. 
    # This makes it so that if we need to check the current user 
    # multiple times over the course of one request, we don’t have 
    # to go to the database to find the user multiple times.
  end
end
