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

  # def breakout
    # key is a person's name
    # value is what they owe for the whole reunion as a combo
    # from all activities
end
