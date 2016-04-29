require 'rails_helper'

RSpec.feature "admin can login" do
  include FeatureHelper
  it "when admin logs in can see admin dashboard" do
    admin = User.create(username: "adminor",
                        email: "emailzzz",
                        password: "password",
                        password_confirmation: "password",
                        role: 1)

    admin_login

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Welcome to Your Dashboard, adminor"
  end

  it "when non admin registered user tries to access admin dashboard gets error" do
     user = create(:user)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  it "when guest tries to access admin dashboard gets error" do

    user = create(:user)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
