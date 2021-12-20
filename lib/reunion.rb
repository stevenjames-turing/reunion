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

  def summary
    summary = ""
    participants = breakout.keys
    count = 0
    until breakout.keys.count == count
      summary += "#{participants[0]}: #{breakout[participants[0]]}\n"
      count += 1
      participants.shift
    end
    summary.chomp
  end
end
