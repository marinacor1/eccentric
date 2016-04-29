require 'rails_helper'

RSpec.feature "admin information is private" do
  it "registered user does not have admin access" do
    user = User.create(username: "Sam",
                       email: "email123kk",
                       password: "password",
                       password_confirmation: "password")
    User.create(username: "adminor",
                email: "emailzo",
                password: "password",
                password_confirmation: "password",
                role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist"
  end

  it "guest does not have admin access" do

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist"
  end

end
