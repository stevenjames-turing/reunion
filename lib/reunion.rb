class Reunion
  attr_reader :name, :activities, :total_cost

  def initialize(name)
    @name = name
    @activities = []
    @total_cost = 0
  end

  def add_activity(activity)
    @activities << activity
    @total_cost += activity.total_cost
  end

  def breakout
    breakout = {}
    @activities.each do |activity|
      activity.owed.each_pair do |name, amt_owed|
        if breakout.has_key?(name)
          breakout[name] += amt_owed
        elsif !breakout.has_key?(name)
          breakout[name] = amt_owed
        end

      end
    end
    breakout
  end
end
