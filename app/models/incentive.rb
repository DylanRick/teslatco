class Incentive < ActiveRecord::Base
  validates_uniqueness_of :state_code
end
