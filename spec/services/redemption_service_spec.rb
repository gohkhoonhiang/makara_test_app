require "rails_helper"

RSpec.describe RedemptionService do
  let!(:wallet) { Wallet.create(name: "My wallet", balance: 100) }
  subject(:service) { RedemptionService }

  before do
    10.times.map do |i|
      Voucher.create(id: i + 1, title: "Voucher #{i + 1}", cost: 20 + i)
    end
  end

  context "when wallet trying to redeem multiple vouchers concurrently" do
    it do
      threads = 10.times.map do |i|
        Thread.new do
          service.new(wallet).call(i + 1)
        end
      end

      threads.each(&:join)

      wallet.reload

      expect(wallet.vouchers.count).to be < 10
    end
  end
end
