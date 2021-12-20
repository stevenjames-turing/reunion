class Activity
  attr_reader :name, :participants, :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, amt_paid)
    @total_cost += amt_paid
    @participants[name] = amt_paid
  end

  def split
    # @total_cost.fdiv(@participants.count)
    @total_cost / @participants.count
  end

  def owed
    owed = {}
    @participants.each_pair do |name, amt_paid|
      owed[name] = (split - amt_paid)
    end
    owed
  end
end
