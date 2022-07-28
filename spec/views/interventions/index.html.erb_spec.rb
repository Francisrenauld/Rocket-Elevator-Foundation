require 'rails_helper'

RSpec.describe "interventions/index", type: :view do
  before(:each) do
    assign(:interventions, [
      Intervention.create!(
        author: 2,
        customer_id: 3,
        building_id: 4,
        battery_id: 5,
        column_id: 6,
        elevator_id: 7,
        employee_id: 8,
        result: "Result",
        report: "Report",
        status: "Status"
      ),
      Intervention.create!(
        author: 2,
        customer_id: 3,
        building_id: 4,
        battery_id: 5,
        column_id: 6,
        elevator_id: 7,
        employee_id: 8,
        result: "Result",
        report: "Report",
        status: "Status"
      )
    ])
  end

  it "renders a list of interventions" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: 8.to_s, count: 2
    assert_select "tr>td", text: "Result".to_s, count: 2
    assert_select "tr>td", text: "Report".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
