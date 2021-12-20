require './lib/activity'
require './lib/reunion'


RSpec.describe Activity do
  let (:activity) {Activity.new("Brunch")}
  let (:activity_1) {Activity.new("Brunch")}
  let (:activity_2) {Activity.new("Drinks")}
  let (:reunion) {Reunion.new("1406 BE")}

  it 'exists' do
    expect(reunion).to be_instance_of Reunion
  end

  it 'initializes with a name' do
    expect(reunion.name).to eq("1406 BE")
  end

  it "initializes with no activities" do
    expect(reunion.activities).to eq([])
  end

  it 'can add activities and store in array' do
    reunion.add_activity(activity_1)
    
    expect(reunion.activities).to eq([activity_1])
  end
end
