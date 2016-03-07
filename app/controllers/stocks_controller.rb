class StocksController < ApplicationController
    def search
        if params[:stock]
           # try to look the stock from the database
           @stock = Stock.find_by_ticker(params[:stock])
           # this is memoization, that our stock doesnt exists in the database
           @stock ||= Stock.new_from_lookup(params[:stock])
        end
        
        # if we have this stock variable
        if @stock
            # simply want to display what is the stock is
            #render json: @stock
            render partial: 'lookup'
        else
           render status: :not_found, nothing:true 
        end
    end
    
end