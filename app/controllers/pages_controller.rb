class PagesController < ApplicationController

  def index
    @skills = Skill.all.order(percentage: :desc)
    @references = Reference.all.order(pertinent_date: :desc)
    @samples = Sample.with_attached_image.all.order(title: :desc)
  end

end
