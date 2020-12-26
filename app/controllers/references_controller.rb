class ReferencesController < ApplicationController
  include CommonControl

  before_action :authenticate_user!, only: %i[index show destroy]
  before_action :set_reference, only: %i[show destroy]
  before_action :update_concerned_path, only: [:create]

  def index
    references_scope = Reference.all
    @references_scope_meta = references_scope.ransack(@scope)
    @references_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @references_scope_meta.sorts.empty?
    @pagy, @references = pagy(@references_scope_meta.result, items: 10)
  end

  def show; end

  def create
    @reference = reference_service.build_reference(reference_params)

    if verify_recaptcha(model: @reference) && @reference.save
      redirect_notice = t('references.send.success_notice')
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
    @reference = reference.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reference_params
    params.fetch(:reference, {}).permit(:full_name, :current_job_title, :linkedin_profile, :mobile_number, :letter)
  end
end
