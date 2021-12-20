require './lib/activity'


RSpec.describe Activity do
  it 'exists' do
    activity = Activity.new("Brunch")

    expect(activity).to be_instance_of Activity
  end

  it 'initializes with a name' do
    activity = Activity.new("Brunch")

    expect(activity.name).to eq("Brunch")
  end

  it 'initializes with no participants and no cost' do
    activity = Activity.new("Brunch")

    expect(activity.participants).to eq({})
    expect(activity.total_cost).to eq(0)
  end

  it 'can add participants and account for how much they paid for activity' do
    activity = Activity.new("Brunch")

    activity.add_participant("Maria", 20)

    expect(activity.participants).to eq({"Maria" => 20})
    expect(activity.total_cost).to eq(20)
  end

  it 'can add multiple participants and tracks each in a hash' do
    activity = Activity.new("Brunch")

    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    expect(activity.total_cost).to eq(60)
  end
end
