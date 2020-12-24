class SkillsController < ApplicationController
  include CommonControl

  before_action :authenticate_user!
  before_action :set_skill, only: %i[show edit update destroy]
  before_action :update_concerned_path, only: [:new, :create, :edit, :update]

  def index
    skills_scope = Skill.all
    @skills_scope_meta = skills_scope.ransack(@scope)
    @skills_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @skills_scope_meta.sorts.empty?
    @pagy, @skills = pagy(@skills_scope_meta.result, items: 10)
  end

  def show; end

  def new
    @skill = Skill.new
  end

  def edit
  end

  def create
    @skill = skill_service.build_skill(skill_params)

    if @skill.save
      redirect_notice = t('skills.send.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @skill.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def update
    @skill = skill_service.update_skill(skill_params.merge(id: params.fetch(:id)))

    if @skill.save
      redirect_notice = t('skills.update.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @skill.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: t('skills.destroy.success_notice') }
      format.json { head :no_content }
    end
  end

  private

  def skill_service
    SkillService
  end

  def set_skill
    @skill = Skill.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def skill_params
    params.fetch(:skill, {}).permit(:name, :color, :percentage)
  end

end
