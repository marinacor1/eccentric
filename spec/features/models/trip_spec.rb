require "rails_helper"

RSpec.describe Trip, type: :model do
  it "user can add package to trip(cart)" do
    trip = Trip.new({ "1" => 1 })

    trip.add_package(1)
    trip.add_package(3)

    expect(trip.itinerary).to eq({ "1" => 2, "3" => 1 })
  end

  it "can sum the prices in the trip(cart)" do
    package1 = Package.create(id: 1, price: 1000, title: "Basic1", description: "Basic package1.")
    package2 = Package.create(id: 2, price: 2000, title: "Basic2", description: "Basic package2.")
    trip = Trip.new({ "1" => 1, "2" => 2 })

   expect(trip.total_price).to eq(5000)
  end

  it "can get total quantity of packages" do
    trip = Trip.new({ "1" => 1, "2" => 2 })

    expect(trip.quantity).to eq 3
  end

  it "can get sub_quantity of an individual package" do
    package1 = Package.create(id: 1)
    package1.save(validates: false)
    package2 = Package.create(id: 2)
    package2.save(validates: false)
    trip = Trip.new({ "1" => 1, "2" => 2 })

    expect(trip.sub_quantity(2)).to eq 2
  end

  it "can adjust quantity to an individual package" do
    trip = Trip.new({ "1" => 1, "2" => 2 })

    trip.adjust_quantity("+", "1")

    expect(trip.itinerary["1"]).to eq 2
  end

  it "can get sub_total of an individual package" do
    package1 = Package.create(id: 1, price: 2000)
    package1.save(validates: false)
    package2 = Package.create(id: 2, price: 3000)
    package2.save(validates: false)
    trip = Trip.new({ "1" => 1, "2" => 2 })


    expect(trip.subtotal(package1)).to eq 2000.0
    expect(trip.subtotal(package2)).to eq 6000.0
  end

  it "can format total_price for stripe" do
    Package.create(id: 1, price: 1000, title: "Basic1",
                   description: "Basic package1.")
    Package.create(id: 2, price: 2000, title: "Basic2",
                   description: "Basic package2.")
    trip = Trip.new({ "1" => 1, "2" => 2 })

    expect(trip.stripe_price).to eq(500_000)
  end

end
