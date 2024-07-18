class PointTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :voucher
end
