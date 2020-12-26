class ReferencesController < ApplicationController
  include CommonControl

  before_action :authenticate_user!
  before_action :set_reference, only: %i[show edit update destroy]
  before_action :update_concerned_path, only: [:new, :create, :edit, :update]

  def index
    references_scope = Reference.all
    @references_scope_meta = references_scope.ransack(@scope)
    @references_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @references_scope_meta.sorts.empty?
    @pagy, @references = pagy(@references_scope_meta.result, items: 10)
  end

  def show; end

  def new
    @reference = Reference.new
  end

  def edit
  end

  def create
    @reference = reference_service.build_reference(reference_params)

    if @reference.save
      redirect_notice = t('references.send.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @reference.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def update
    @reference = reference_service.update_reference(reference_params.merge(id: params.fetch(:id)))

    if @reference.save
      redirect_notice = t('references.update.success_notice')
      redirect_to @return_to, notice: redirect_notice
    else
      flash[:alert] = @reference.errors.full_messages.first
      redirect_to @return_to
    end
  end

  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url, notice: t('references.destroy.success_notice') }
      format.json { head :no_content }
    end
  end

  private

  def reference_service
    ReferenceService
  end

  def set_reference
    @reference = Reference.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reference_params
    params.fetch(:reference, {}).permit(:full_name, :current_job_title, :linkedin_profile, :mobile_number, :pertinent_date, :email, :letter)
  end
end
