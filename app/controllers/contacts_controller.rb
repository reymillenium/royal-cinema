class ContactsController < ApplicationController
  include CommonControl

  before_action :authenticate_user!
  before_action :set_contact, only: %i[show destroy]
  before_action :update_concerned_path, only: [:create]

  def index
    # contacts_scope = Contact.visible_by(current_user)
    contacts_scope = Contact.all
    @contacts_scope_meta = contacts_scope.ransack(@scope)
    @contacts_scope_meta.sorts = "#{@sort_column} #{@sort_direction}" if @contacts_scope_meta.sorts.empty?
    @pagy, @contacts = pagy(@contacts_scope_meta.result, items: 10)

    # binding.pry
  end

  def show; end

  def create
    @contact = contact_service.build_contact(contact_params)
    # response = contact_service.send_email(@contact)
    # status_notice = if response.status_code.to_i == 202
    #                   ' & was sent successfully'
    #                 else
    #                   ' & was not sent successfully'
    #                 end

    if @contact.save
      redirect_notice = 'Your message was sent successfully.'
      redirect_to @return_to, notice: redirect_notice
    else
      redirect_notice = 'Your message was not sent.'
      redirect_to @return_to, alert: redirect_notice
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      # format.html { redirect_to contacts_url, notice: t('notes.destroy.success_notice') }
      format.html { redirect_to contacts_url, notice: 'The message was destroyed successfully' }
      format.json { head :no_content }
    end
  end

  private

  def contact_service
    ContactService
  end

  def set_contact
    # @contact = Contact.visible_by(current_user).find(params[:id])
    @contact = Contact.all.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.fetch(:contact, {}).permit(:name, :email, :subject, :message)
  end

  # Updates the return to path
  # def update_concerned_path
  #   @return_to = params[:return_to]
  # end

end
