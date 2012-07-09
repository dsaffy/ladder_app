class LaddersController < ApplicationController
  def index

  end
  def show
    @ladder = Ladder.find_by_id(params[:id])
    @entries = @ladder.entries
    @entries.sort! { |a, b| b.elo <=> a.elo }
  end

  def new
    @ladder = Ladder.new
  end

  def create
    @ladder = Ladder.new(params[:ladder])
    if @ladder.save
      redirect_to @ladder
    else
      render 'new'
    end
  end
end
