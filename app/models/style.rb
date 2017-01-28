class Style < ActiveRecord::Base
  belongs_to :model

  validates :edmund_id, uniqueness: true

  def self.get_styles(submodel, year)
    model = submodel.nice_model
    make = submodel.make.nice_name
    styles_json = Edmund.new.tco_styles(make, model, year, submodel.nice_submodel)["styles"]
    return nil if styles_json.nil?
    return {} if styles_json.empty?

    styles_json.each do |style|
      style_info = style[1]
      # TODO need to do find or create by since a style could belong to more than one year?
      #  or add more years to the existing style??? if thats the case -> change year to years:string
      new_style = Style.new(
        name: style[0],
        year: year,
        edmund_id: style_info["id"],
        price: style_info["price"],
        trim: style_info["trim"],
        style_long_name: style_info["styleLongName"]
      )
      submodel.styles << new_style
    end

    submodel.styles
  end
end
