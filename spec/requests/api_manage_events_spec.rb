require 'rails_helper'

RSpec.describe "Manage Events through API", type: :request do
  describe "POST /api/events" do
    before do
      @app = create(:registered_application, user: create(:user))
    end

    it "creates a new event" do
      post '/api/events',
      { name: 'create wiki' }.to_json,
      { 'Accept' => Mime::JSON, 'Origin' => @app.url, 'Content-Type' => Mime::JSON.to_s }

      expect(response.status).to eq(201)
      expect(response.content_type).to eq(Mime::JSON)
    end

    it "returns 422 code and unregistered application error if app is unregistered" do
      post '/api/events',
      { name: 'create wiki' }.to_json,
      { 'Accept' => Mime::JSON, 'Origin' => 'http://unregistered.com', 'Content-Type' => Mime::JSON.to_s }

      expect(response.status).to eq(422)
      expect(response.body).to eq('Unregistered Application')
    end

    it "returns 422 code and error message with missing attribute" do
      post '/api/events',
      { name: nil }.to_json,
      { 'Accept' => Mime::JSON, 'Origin' => @app.url, 'Content-Type' => Mime::JSON.to_s }

      expect(response.status).to eq(422)
      expect(response.body).to include("can't be blank")
      # expect(response.body).to eq("{\"name\":[\"can't be blank\"]}")
    end
  end
end
