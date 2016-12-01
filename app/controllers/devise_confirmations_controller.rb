class DeviseConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation/new
  def new
    binding.pry
    self.resource = resource_class.new
  end

  # POST /resource/confirmation
  def create
    binding.pry
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    binding.pry
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    yield resource if block_given?
    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      signed_in_resource()
      redirect_to after_confirmation_path_for(resource_name, resource)
    else
      flash[:alert] = 'Неверный ключ подтверждения'
      redirect_to root_path
    end
  end

  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    is_navigational_format? ? new_session_path(resource_name) : '/'
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      new_session_path(resource_name)
    end
  end

  def translation_scope
    'devise.confirmations'
  end

end