class HomeController < ApplicationController
  def index
  end

  def dashboard
  end

  def ladder
    @ladder = Ladder.find_by_id(params[:id])
    testdoug = User.find_by_id(1)
    testentries = testdoug.entries
    @entries = @ladder.entries
    @entries.sort! { |a, b| b.elo <=> a.elo }
  end
end
