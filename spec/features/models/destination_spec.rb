require 'rails_helper'

RSpec.describe Destination, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:planet)}
    it { is_expected.to validate_uniqueness_of(:planet)}
    it { should have_many(:packages) }
  end
end
