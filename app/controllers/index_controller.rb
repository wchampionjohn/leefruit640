class IndexController < ApplicationController
  def index
    @indexes = IndexSlider.all
  end
end
