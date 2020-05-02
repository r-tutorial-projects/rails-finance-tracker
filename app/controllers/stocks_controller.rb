class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock].upcase)
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash.now[:alert] = "Stock was not found for symbol: '#{params[:stock].upcase}'."
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      end
    else
      flash.now[:alert] = 'Please enter a symbol to search'
      respond_to do |format|
        format.js { render partial: 'users/result' }
      end
    end
  end
end
