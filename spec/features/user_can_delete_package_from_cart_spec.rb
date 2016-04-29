RSpec.feature "User can delete a package from their cart" do
  scenario "they no longer see the package in their cart" do

    package = create(:package)

    visit package_path(package)

    click_on "Add Package to Trip"

    visit "/trip"

    within ".package" do
      find(".fi-x").click
    end

    expect(current_path).to eq "/trip"

    expect(page).to have_content "Successfully removed #{package.title} from your trip"

    within '.cart' do
      expect(page).to_not have_content package.title
      expect(page).to_not have_content package.price
      expect(page).to_not have_content package.image
      expect(page).to have_content "Your Cart is Empty"
    end
  end
end
