class HomeController < ApplicationController
  def index
  end

  def dashboard
  end

  def new

  end

  def post_new_ladder
    if ladder = Ladder.create(params[:ladder])
      redirect_to ("home/ladder/" + ladder.id.to_s)
    else
      @errors = ladder.errors.full_messages
      render("/home/new_ladder")
    end
  end

  def ladder
    @ladder = Ladder.find_by_id(params[:id])
    testdoug = User.find_by_id(1)
    testentries = testdoug.entries
    @entries = @ladder.entries
    @entries.sort! { |a, b| b.elo <=> a.elo }
  end
end
