class QuotesController < ApplicationController
  respond_to :html, :js
  
  before_filter :authenticate, :only => [:pending, :approve, :edit, :update, :destroy]
  
  def index
    @quotes = Quote.all
  end
  
  def pending
    @quotes = Quote.pending
    
    render :layout => 'clean'
  end
  
  def approve
    @quote = Quote.find(params[:id])
    @quote.update_attribute(:approved, true)
    
    redirect_to :action => 'pending'
  end
  
  def show
    @quote = Quote.find(params[:id])
  end
  
  def random
    @quote_random = Quote.approved.random
    @quote = Quote.new
  end

  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.new(params[:quote])
    
    if @quote.save
      flash[:notice] = "Successfully added quote!"
      respond_with(@quote)
      #redirect_to @quote
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
  
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to :action => 'pending'
  end
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      (username == "adam" && password == "wttkomm") || (username == "david" && password == "seavulture")
    end
  end
  
end
