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
end
