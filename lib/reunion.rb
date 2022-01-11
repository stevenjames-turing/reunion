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


  # STILL NEEDS WORK
  def detailed_breakout
    detailed_breakout = {}

    # CREATES HASH OF PARTICIPANTS AND BREAKOUT HASH FOR EACH ACTIVITY THEY PARTICIPATED IN
    breakout.each_pair do |participant, total_owed|
      if !detailed_breakout.has_key?(participant)
        # creates hash of participant names and assigns to open array
        detailed_breakout[participant] = []
        @activities.each do |activity|
          if activity.participants.has_key?(participant)
            # creates hash with :activity, :payees, :amount inside of participant hash
            detailed_breakout[participant] << {:activity=> activity.name, :payees=> [], :amount=> 0}
          end
        end
      elsif detailed_breakout.has_key?(participant)
        @activities.each do |activity|
          if activity.participants.has_key?(participant)
            detailed_breakout[participant] << {:activity=> activity.name, :payees=> [], :amount=> 0}
          end
        end
      end
    end

    # @activities.each do |activity|
    #   activity.owed.each_pair do |name, amt_owed|
    #     if
    #     if activity.name == detailed_breakout[name][0][:activity]
    #
    #
    #
    #
    #       detailed_breakout[name][0][:payees] << name if detailed_breakout[name]
    #     end
    #   end
    # end
    #
    #
    #
    # # breakout.each_pair do |participant, total_owed|
    # #   if !detailed_breakout.has_key?(participant)
    # #     # creates hash of participant names and assigns to open array
    #     detailed_breakout[participant] = []
    #
    #
    #         # creates has with :activity, :payees, :amount inside of participant hash
    #         detailed_breakout[participant] << {:activity=> activity.name, :payees=> [], :amount=> 0}
    #         activity.owed.each_pair do |name, amt_owed|
    #           require 'pry'; binding.pry
    #           detailed_breakout[participant][0][:payees] << name
    #           detailed_breakout[participant][0][:amount] += amt_owed
    #         end
    #
    #       end
    #     end
    #   elsif detailed_breakout.has_key?(participant)
    #     @activities.each do |activity|
    #       if activity.participants.has_key?(participant)
    #         detailed_breakout[participant] << {:activity=> activity.name, :payees=> [], :amount=> 0}
    #         activity.owed.each_pair do |name, amt_owed|
    #           detailed_breakout[participant][0][:payees] << name
    #           detailed_breakout[participant][0][:amount] += amt_owed
    #         end
    #       end
    #     end
    #   end
    # end
  detailed_breakout
  end
end
