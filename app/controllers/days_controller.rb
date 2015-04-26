class DaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    count = Day.count
    @day = Day.find_by_id params[:id]

    if @day && @day.active?
      day_number = @day.number

      if day_number == 1
        @days = complete_days day_number, 2, 'top'
      elsif day_number == 2
        @days = complete_days day_number, 1, 'top'
      elsif day_number == count - 1
        @days = complete_days day_number, 1, 'bottom'
      elsif day_number == count
        @days = complete_days day_number, 2, 'bottom'
      else
        @days = complete_days day_number
      end
    else
      redirect_to root_path, notice: 'El dia no se encuentra o esta bloqueado'
    end
  end

  private

  def complete_days(day_number, repeat = 0, position = 'none')
    day_min = day_number - 2
    day_max = day_number + 2

    days = Day.where('number >= ? AND number <= ?', day_min, day_max).order(:number)
    add_days days, repeat, position
  end

  def add_days(days, repeat, position)
    repeat.times do
      aux_day = Day.new
      aux_day.number = -1
      aux_day.status = nil
      if position == 'top'
        days.unshift(aux_day)
      elsif position == 'bottom'
        days.push(aux_day)
      end
    end
    days
  end
end
