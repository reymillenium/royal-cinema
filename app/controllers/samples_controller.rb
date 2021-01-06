class SamplesController < ApplicationController

  include CommonControl

  before_action :authenticate_user!
  before_action :set_sample, only: %i[show edit update destroy]
  before_action :update_concerned_path, only: [:new, :create, :edit, :update]

  def index
    samples_scope = Sample.all
    @samples_scope_meta = samples_scope.ransack(@scope)
    @samples_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @samples_scope_meta.sorts.empty?
    @pagy, @samples = pagy(@samples_scope_meta.result, items: 10)
  end

  def show; end

  def new
    @sample = Sample.new
  end

  def edit
  end

  def create
    @sample = sample_service.build_sample(sample_params)

    if @sample.save
      redirect_notice = t('samples.create.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @sample.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def update
    @sample = sample_service.update_sample(sample_params.merge(id: params.fetch(:id)))

    if @sample.save
      redirect_notice = t('samples.update.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @sample.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def destroy
    @sample.destroy
    respond_to do |format|
      format.html { redirect_to samples_url, notice: t('samples.destroy.success_notice') }
      format.json { head :no_content }
    end
  end

  private

  def sample_service
    SampleService
  end

  def set_sample
    @sample = Sample.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sample_params
    params.fetch(:sample, {}).permit(:title, :sub_title, :url, :image)
  end

end
