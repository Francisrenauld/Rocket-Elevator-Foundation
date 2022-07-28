require 'rails_helper'

RSpec.describe "interventions/show", type: :view do
  before(:each) do
    @intervention = assign(:intervention, Intervention.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/Result/)
    expect(rendered).to match(/Report/)
    expect(rendered).to match(/Status/)
  end
end
