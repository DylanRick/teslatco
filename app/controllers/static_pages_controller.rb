class StaticPagesController < ApplicationController

  def index
    # makes = JSON.parse(Edmund.new.tco_makes.body)["makes"]
    makes = JSON.parse(File.read("db/makes.json"))["makes"]
    # options for select needs to be array of arrays in format [name, value]
    options = []
    makes.each do |make|
      options << [make[1]["name"], make[1]["id"]]
    end
    @make_options = options
  end
end
