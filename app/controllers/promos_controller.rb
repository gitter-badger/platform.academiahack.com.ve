class PromosController < ApplicationController
  def manage
    @promo = Promo.find params[:id]
  end
end
