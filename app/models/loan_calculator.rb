# Standard period and rates 4.3%, 60 months (5 years)
class LoanCalculator
  attr_accessor :principal, :rate, :periods

  def initialize(principal:, rate: "4.3", periods: "60")
    @principal = principal
    @rate = BigDecimal.new(rate)
    @periods = BigDecimal.new(periods)
  end

  def monthly_payment
    short = (1 + monthly_rate) ** periods
    principal * monthly_rate * short / (short - 1)
  end

  def total_interest
    total_payment - principal
  end

  def total_payment
    monthly_payment * periods
  end

  def monthly_rate
    rate / 12 / 100
  end
end
