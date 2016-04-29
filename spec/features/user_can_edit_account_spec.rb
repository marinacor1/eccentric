require 'rails_helper'

RSpec.feature "registered user can edit account" do
  context "with valid params" do
    scenario "they see a form to edit account" do
      user = create(:user)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      email = user.email

      visit dashboard_path

      fill_in "Email", with: "JonB"
      fill_in "Enter Password", with: "password1"
      fill_in "Confirm Password", with: "password1"
      click_on "Update Account"

      expect(page).to have_content "Welcome to Your Dashboard, #{user.username}"
      expect(page).to have_content "JonB"
      expect(page).not_to have_content email
    end
  end

  context "with valid params only password" do
    include FeatureHelper
    scenario "they see a form to edit account" do
      @user = User.create(username: "hotdog", email: "wassup", password: "password", password_confirmation: "password")

      user_login

      visit dashboard_path
      click_on "Update Account"

      fill_in "Confirm Password", with: "JonZ"
      click_on "Update Account"
      expect(page).to have_content "Welcome to Your Dashboard, #{@user.username.capitalize}"
    end
  end

  context "with invalid params as an admin" do
    scenario "they are redirected to index" do

      user = create(:user)
      admin = User.create(username: "admin", email: "emailzzz",
                          password: "password",
                          password_confirmation: "password", role: 1)

      visit login_path
      click_on "Login"

      expect(current_path).to eq(login_path)

      ApplicationController.any_instance.stubs(:current_user).returns(admin)

      visit dashboard_path(user)

      click_on "Update Account"
      expect(page).to have_content "admin"
      expect(page).to_not have_content "Andrew"
    end
  end

  context "as a guest" do
    scenario "they see an error message" do

      visit dashboard_path

      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end

end
