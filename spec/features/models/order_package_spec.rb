require 'rails_helper'

RSpec.describe OrderPackage, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:order) }
  it { should belong_to(:package) }

end
