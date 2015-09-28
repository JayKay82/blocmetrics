class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_access_control_headers

  def create
    # Get the origin of the http request and use it to find the registered application
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # Check if the application is acually rendered and if not return an error and set 422 status code
    return render json: 'Unregistered Application', status: 422 unless registered_application

    # Creat the event and return the appropriate json and status code
    event = registered_application.events.build(event_params)
    if event.save
      render json: event, status: 201
    else
      render json: event.errors, status: 422
    end
  end

  private

  def event_params
    params.permit(:name)
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end
end
