class Tesla < ActiveRecord::Base

  before_save :update_total
  before_create :calculate_financing

  validates_presence_of :model, :trim, :price

  def calculate_financing
    if self.financing < BigDecimal.new("0.50")
      loan_amount = self.price * BigDecimal.new("0.9")
      self.financing = LoanCalculator.new(principal: loan_amount).total_interest
    end
  end

  def update_total
    self.total = self.insurance + self.maintenance + self.taxes_and_fees + self.financing + self.depreciation + self.fuel - self.tax_credit
  end
end
