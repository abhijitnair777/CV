class EducationsController < ApplicationController
  def new
    @education = Education.new
  end
end
