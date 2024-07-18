class RedemptionService
  def initialize(wallet)
    @wallet = wallet
  end

  def call(voucher_id)
    @wallet.with_lock do
      voucher = Voucher.find(voucher_id)
      voucher.with_lock do
        voucher_cost = voucher.cost
        if @wallet.balance >= voucher_cost
          Rails.logger.info "wallet_balance=#{@wallet.balance}, voucher_id=#{voucher_id}"
          PointTransaction.create!(
            wallet_id: @wallet.id,
            voucher_id: voucher.id,
            amount: -voucher_cost,
          )
          @wallet.balance -= voucher_cost
          @wallet.save!
        end
      end
    end
  end
end
