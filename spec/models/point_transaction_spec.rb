require "rails_helper"

RSpec.describe PointTransaction, type: :model do
  let!(:wallet) { Wallet.create(name: "My wallet", balance: 100) }
  let!(:voucher) { Voucher.create(title: "Food voucher", cost: 10) }

  context "when transaction has voucher" do
    subject(:point_transaction) { PointTransaction.create(amount: -10, wallet_id: wallet.id, voucher_id: voucher.id) }

    it do
      expect(point_transaction.amount).to eq -10
      expect(point_transaction.wallet.id).to eq wallet.id
      expect(point_transaction.voucher.id).to eq voucher.id
    end
  end

  context "when transaction has no voucher" do
    subject(:point_transaction) { PointTransaction.create(amount: 10, wallet_id: wallet.id) }

    it do
      expect(point_transaction.amount).to eq 10
      expect(point_transaction.wallet.id).to eq wallet.id
      expect(point_transaction.voucher).to eq nil
    end
  end
end
