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
      # This is where I had a very annoying bug. Whenever I was trying to create an invalid
      # registered application, it wasn't displaying the validation errors within the view.
      # This was because I was redirecting to new_registered_application_path and this was
      # completely reinitialising a new registered_application object without errors associated
      # to it. Using render :new solved this problem as it keeps the new object and only
      # rerenders the view.
      render :new, error: 'Unable to register the application. Please try again.'
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

  # Strong parameters for creating (and one day potentially updating) registered applications
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

  # Assign an instant variable to one particular or all of the user's registered applications
  def registered_applications
    @registered_applications ||= current_user.registered_applications.all
  end

  def registered_application
    @registered_application ||= current_user.registered_applications.find(params[:id])
  end

  # Assign an instance variable to all of a particular registered application's events
  def events
    @events = registered_application.events.group_by(&:name)
  end

  # Create helper methods as to avoid using instance variables in the views.
  # One reason for this is to prevent annoying bugs in future. You can make a typo
  # assigning an instance variable and rails will just declare a new one. However a
  # typo with a helper method would throw an error.
  helper_method :registered_applications, :registered_application, :events
end
