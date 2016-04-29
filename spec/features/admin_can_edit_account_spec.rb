require 'rails_helper'

RSpec.feature "admin can edit account" do
  include FeatureHelper
  context "with valid params" do
    scenario "they see a form to edit account" do
    admin = User.create(username: "adminor", email: "emailz", password: "password", password_confirmation: "password", role: 1)

      admin_login

      expect(current_path).to eq(admin_dashboard_path)
      click_on "Edit Your Username or Email"
      fill_in "Email", with: "JonB"
      fill_in "Enter Password", with: "password"
      fill_in "Confirm Password", with: "password"

      click_on "Update Account"

      visit admin_dashboard_path
      expect(page).to have_content "Welcome to Your Dashboard, adminor"
      expect(page).to have_content "JonB"
      expect(page).not_to have_content "emailz"
    end
  end

  context "with valid params only password" do
    scenario "they see a form to edit account" do
      admin = User.create(username: "adminor", email: "emailz", password: "password",
                          password_confirmation: "password", role: 1)

      admin_login

      visit dashboard_path

      fill_in "New Password", with: "JonZ"
      fill_in "Confirm New Password", with: "JonZ"
      click_on "Update Password"
      expect(page).to have_content "Welcome to Your Dashboard, Adminor"
    end
  end
end
