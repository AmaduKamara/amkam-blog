require "rails_helper"

RSpec.describe "Users", :type => :request do

  it "Create Users page" do
    get "/users"
    expect(response).to render_template(:index)

    get "/users/:id"
    expect(response).to render_template(:show)

    expect(response.body).to include("Users Index and show to render successfully")
  end

  it "does not render a different template" do
    get "/users"
    expect(response).to_not render_template(:show)
  end
end