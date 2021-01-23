class AuditoriumsController < ApplicationController

  include CommonControl

  before_action :authenticate_user!
  before_action :set_auditorium, only: %i[show edit update destroy]
  before_action :update_concerned_path, only: [:new, :create, :edit, :update]

  def index
    auditoriums_scope = Auditorium.all
    @auditoriums_scope_meta = auditoriums_scope.ransack(@scope)
    @auditoriums_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @auditoriums_scope_meta.sorts.empty?
    @pagy, @auditoriums = pagy(@auditoriums_scope_meta.result, items: 10)
  end

  def show; end

  def new
    @auditorium = Auditorium.new
  end

  def edit
  end

  def create
    @auditorium = auditorium_service.build_auditorium(auditorium_params)

    if @auditorium.save
      redirect_notice = t('auditoriums.create.success_notice')
      # redirect_to @return_to, notice: redirect_notice
      redirect_to edit_auditorium_path(@auditorium, return_to: @return_to), notice: redirect_notice
    else
      flash[:alert] = @auditorium.errors.full_messages.first
      render :new
    end
  end

  def update
    @auditorium = auditorium_service.update_auditorium(auditorium_params.merge(id: params.fetch(:id)))

    if @auditorium.save
      redirect_notice = t('auditoriums.update.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @auditorium.errors.full_messages.first
      render action: :edit
    end
  end

  def destroy
    @auditorium.destroy
    respond_to do |format|
      format.html { redirect_to auditoriums_url, notice: t('auditoriums.destroy.success_notice') }
      format.json { head :no_content }
    end
  end

  private

  def auditorium_service
    AuditoriumService
  end

  def set_auditorium
    @auditorium = Auditorium.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def auditorium_params
    params.fetch(:auditorium, {}).permit(:name)
  end

end
