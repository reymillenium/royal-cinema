class PagesController < ApplicationController

  def index
    @skills = Skill.all.order(percentage: :desc)
    @references = Reference.all.order(pertinent_date: :desc)
  end

end
