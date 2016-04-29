require 'rails_helper'

RSpec.feature "user cannot make themselves an admin" do
  it "user will have no access to params" do
    user = User.create(username: "Sam", email: "email123kk",
                      password: "password", password_confirmation: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end
