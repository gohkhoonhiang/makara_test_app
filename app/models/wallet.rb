class Wallet < ApplicationRecord
  has_many :point_transactions
  has_many :vouchers, through: :point_transactions
end
