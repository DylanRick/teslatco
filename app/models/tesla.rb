class Tesla < ActiveRecord::Base

  before_save :calculate_financing, :update_total

  validates_presence_of :model, :trim, :price

  def calculate_financing
    self.financing = LoanCalculator.new(principal: self.price).total_interest
  end

  def update_total
    self.total = self.insurance + self.maintenance + self.taxes_and_fees + self.financing + self.depreciation + self.fuel - self.tax_credit
  end
end
