class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end
  
  def show
    @quote = Quote.find(params[:id])
  end
  
  def random
    @quote = Quote.random
  end

  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.new(params[:quote])
    
    if @quote.save
      flash[:notice] = "Successfully added quote!"
      redirect_to @quote
    else
      render :action => :new
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    
    if @quote.update_attributes(params[:quote])
      flash[:notice] = "Quote updated!"
      redirect_to @quote
    else
      render :action => :edit
    end
  end
end
