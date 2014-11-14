class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    @ingredients = Ingredient.all
    @dose.save

    if @dose.persisted?
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    if @dose.destroyed?
      flash[:notice] = "dose destroyed"
    else
      flash[:alert] = "dose NOT destroyed"
    end

    redirect_to cocktail_path(@cocktail)

  end

private
  def dose_params
    params.require(:dose).permit(:amount, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
