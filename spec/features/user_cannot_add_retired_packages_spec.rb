RSpec.feature "user cannot add sold out packages" do
  context "they go to the show page for a sold out package" do
    scenario "they do not see the button to add" do
      destination = Destination.create(planet: "Moon")

      package = Package.new(status: 1)
      package.save(validate: false)

      visit package_path(package)

      expect(page).to have_button("Sold Out")
      expect(page).to_not have_button("Add Package to Trip")
    end
  end
end
