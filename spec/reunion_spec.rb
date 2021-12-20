require './lib/activity'
require './lib/reunion'


RSpec.describe Activity do
  let (:activity) {Activity.new("Brunch")}
  let (:reunion) {Reunion.new("1406 BE")}

  it 'exists' do
    expect(reunion).to be_instance_of Reunion
  end

  it 'initializes with a name' do
    expect(reunion.name).to eq("1406 BE")
  end 
end
