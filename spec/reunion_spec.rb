require './lib/activity'
require './lib/reunion'


RSpec.describe Activity do
  let (:activity) {Activity.new("Brunch")}
  let (:activity_1) {Activity.new("Brunch")}
  let (:activity_2) {Activity.new("Drinks")}
  let (:activity_3) {Activity.new("Bowling")}
  let (:activity_4) {Activity.new("Jet Skiing")}
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

  it 'begins with a total cost of 0' do
    expect(reunion.activities).to eq([])
    expect(reunion.total_cost).to eq(0)
  end

  it 'adding activities increases the total cost owed for the entire reunion' do
    expect(reunion.total_cost).to eq(0)

    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    reunion.add_activity(activity_1)

    expect(reunion.total_cost).to eq(60)
  end

  it 'can add multiple activities and calculate total cost to include all activities' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    expect(reunion.total_cost).to eq(60)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Louis", 0)

    reunion.add_activity(activity_2)

    expect(reunion.total_cost).to eq(180)
  end

  it 'creates a breakout of all costs in hash form' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)

    expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
  end

  it 'can print a summary of the breakout' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})

    expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end

  xit 'can print a DETAILED summary of breakdown to show what each participant owes, who it is owed to, and for which activity' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.add_activity(activity_3)
    reunion.add_activity(activity_4)

    expected_breakout = {
      "Maria" => [
        {
          activity: "Brunch",
          payees: ["Luther"],
          amount: 10
        },
        {
          activity: "Drinks",
          payees: ["Louis"],
          amount: -20
        },
        {
          activity: "Bowling",
          payees: ["Louis"],
          amount: 10
        },
        {
          activity: "Jet Skiing",
          payees: ["Louis", "Nemo"],
          amount: 10
        }
      ],
      "Luther" => [
        {
          activity: "Brunch",
          payees: ["Maria"],
          amount: -10
        },
        {
          activity: "Drinks",
          payees: ["Louis"],
          amount: -20
        },
        {
          activity: "Bowling",
          payees: ["Louis"],
          amount: 10
        },
        {
          activity: "Jet Skiing",
          payees: ["Louis", "Nemo"],
          amount: 10
        }
      ],
      "Louis" => [
        {
          activity: "Drinks",
          payees: ["Maria", "Luther"],
          amount: 20
        },
        {
          activity: "Bowling",
          payees: ["Maria", "Luther"],
          amount: -10
        },
        {
          activity: "Jet Skiing",
          payees: ["Maria", "Luther"],
          amount: -10
        }
      ],
      "Nemo" => [
        {
          activity: "Jet Skiing",
          payees: ["Maria", "Luther"],
          amount: -10
        }
      ]
    }
    expect(reunion.detailed_breakout).to eq(expected_breakout)
  end
end
