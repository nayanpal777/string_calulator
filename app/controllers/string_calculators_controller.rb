class StringCalculatorsController < ApplicationController
  def index
    @string_calculators = StringCalculator.order(created_at: :desc)
  end

  def new
    @string_calculator = StringCalculator.new
  end

  def create
    @string_calculator = StringCalculator.new(string_calculator_params)

    if @string_calculator.save
      redirect_to @string_calculator, notice: "Calculation successful!"
    else
      render :new, status: :unprocessable_entity
    end
  rescue ArgumentError => e
    @string_calculator.errors.add(:input, e.message)
    render :new, status: :unprocessable_entity
  end

  def show
    @string_calculator = StringCalculator.find(params[:id])
  end

  private

  def string_calculator_params
    params.require(:string_calculator).permit(:input_string)
  end
end
