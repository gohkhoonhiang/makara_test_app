require "rails_helper"

RSpec.describe Voucher, type: :model do
  subject(:voucher) { Voucher.create(title: "Food voucher", cost: 10) }

  it do
    expect(voucher.title).to eq "Food voucher"
    expect(voucher.cost).to eq 10
    expect(voucher.point_transaction).to eq nil
  end
end
