class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
