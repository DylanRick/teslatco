class Tesla < ActiveRecord::Base

  before_save :calculate_financing, :update_total

  validates_presence_of :model, :trim, :price

  def calculate_financing
    loan_amount = self.price * BigDecimal.new("0.9")
    self.financing = LoanCalculator.new(principal: loan_amount).total_interest
  end

  def update_total
    self.total = self.insurance + self.maintenance + self.taxes_and_fees + self.financing + self.depreciation + self.fuel - self.tax_credit
  end
end
