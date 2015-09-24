class RegisteredApplicationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @registered_application = current_user.registered_applications.build
  end

  def create
    @registered_application = current_user.registered_applications.build(registered_application_params)

    if @registered_application.save
      redirect_to root_path, notice: 'Successfully registered a new application.'
    else
      redirect_to :back, error: 'Unable to register the application. Please try again.'
    end
  end

  def destroy
    if registered_application.destroy
      redirect_to :back, notice: 'Successfully unregistered the application.'
    else
      redirect_to :back, error: 'Unable to unregister the application. Please try again.'
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

  def registered_applications
    @registered_applications ||= current_user.registered_applications.all
  end

  def registered_application
    @registered_application ||= current_user.registered_applications.find(params[:id])
  end

  helper_method :registered_applications, :registered_application
end
