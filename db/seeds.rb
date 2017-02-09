# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nice_name = "acura"
acura = Make.find_by(nice_name: nice_name)
[1,2,3,4,5].each do |n|
  model = Model.new(
    edmund_id: "#{nice_name}_edmund_id_#{n}",
    name: "#{nice_name}_name_#{n}",
    submodel: "#{nice_name}_submodel_#{n}",
    nice_submodel: "#{nice_name}_nice_submodel_#{n}",
    model: "#{nice_name}_model_#{n}",
    nice_model: "#{nice_name}_nice_model_#{n}",
    years: "2011, 2012, 2013"
  )
  acura.models << model
end

first_model = Model.find_by(name: "#{nice_name}_name_1")
[1,2,3,4,5].each do |n|
  style = Style.new(
    name: "#{first_model.nice_submodel}_name_#{n}",
    year: "2011",
    edmund_id: "#{first_model.nice_submodel}_edmund_id_#{n}",
    price: "30000",
    trim: "#{first_model.nice_submodel}_trim_#{n}",
    style_long_name: "#{first_model.nice_submodel}_style_long_name_#{n}"
  )
  first_model.styles << style
end

# Tesla Data

default_amount = BigDecimal.new("10000")
[1,2,3,4,5].each do |n|
  Tesla.create(
    model: "60",
    trim: "60_trim_#{n}",
    price: BigDecimal.new("70000"),
    insurance: default_amount,
    maintenance: default_amount,
    taxes_and_fees: default_amount,
    depreciation: default_amount,
    fuel: default_amount,
    tax_credit: default_amount
  )
end

Incentive.create(state: "Utah", state_code: "UT", amount: default_amount)
Incentive.create(state: "Arizona", state_code: "AZ", amount: default_amount)
