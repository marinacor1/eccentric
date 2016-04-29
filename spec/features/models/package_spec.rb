require 'rails_helper'

RSpec.describe Package, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { should belong_to(:destination) }

  end
end
