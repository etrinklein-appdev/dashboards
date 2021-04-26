class CurrenciesController < ApplicationController
  def first_currency
    
    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    @symbols_hash = @parsed_data.fetch("symbols")
    
    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb"})
  end 

  def second_currency

    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    @symbols_hash = @parsed_data.fetch("symbols")
    
    @array_of_symbols = @symbols_hash.keys
    
    @from_symbol = params.fetch("currency")

    render({ :template => "currency_templates/step_two.html.erb"})
  end

  def conversion
    @from_symbol = params.fetch("from")
    @to_symbol = params.fetch("to")
    
    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    @symbols_hash = @parsed_data.fetch("symbols")

    render({ :template => "currency_templates/step_three.html.erb"})
  end 
end