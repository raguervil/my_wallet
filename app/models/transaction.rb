class Figure < ApplicationRecord
  validates :date, :transaction_type, :amount, :category, :description, presence: true
  
  belongs_to :user
end
