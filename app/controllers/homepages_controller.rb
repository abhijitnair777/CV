class HomepagesController < ApplicationController
  skip_before_action :authenticate, only: %i[welcome]
  
  def welcome
  end		
end
