class Admin::EventsController < ApplicationController
  layout 'admin'
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :event_params, only: [:update, :create]
  
  def index
    @events = Event.all
  end

  def show
    # @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    # @event = Event.find(params[:id])
  end
  
  def create
    # event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
  end
  
  def update
    # event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
  end
  
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end
  
  private
  
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    end
end