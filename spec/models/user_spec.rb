require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe 'validates fields' do
    subject { build(:user) }

    context 'length' do
      it { is_expected.to(validate_length_of(:name).is_at_most(60)) }
      it { is_expected.to(validate_length_of(:email).is_at_most(100)) }
    end

    context 'presence' do
      it { is_expected.to(validate_presence_of(:name)) }
      it { is_expected.to(validate_presence_of(:email)) }
    end

    context 'uniquiness' do
      it { is_expected.to(validate_uniqueness_of(:email)) }
    end
  end
end
