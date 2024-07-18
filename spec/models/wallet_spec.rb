require "rails_helper"

RSpec.describe Wallet, type: :model do
  subject(:wallet) { Wallet.create(name: "My wallet", balance: 100) }

  it do
    expect(wallet.name).to eq "My wallet"
    expect(wallet.balance).to eq 100
    expect(wallet.vouchers).to eq []
    expect(wallet.point_transactions).to eq []
  end
end
