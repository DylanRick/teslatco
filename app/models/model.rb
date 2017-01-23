class Model < ActiveRecord::Base
  belongs_to :make

  def self.get_models(make)
    models_json = Edmund.new.tco_models(make.edmund_id)["models"]
    models_json.each do |model|
      model_info = model[1]
      new_model = Model.new(
        edmund_id: model_info["id"],
        name: model_info["name"],
        submodel: model_info["submodel"],
        nice_submodel: model_info["nicesubmodel"],
        model: model_info["model"],
        nice_model: model_info["nicemodel"],
        years: model_info["years"].values.flatten.sort.join(", ")
      )
      make.models << new_model
    end

    make.models
  end
end