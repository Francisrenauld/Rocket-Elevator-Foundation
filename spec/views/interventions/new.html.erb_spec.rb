require 'rails_helper'

RSpec.describe "interventions/new", type: :view do
  before(:each) do
    assign(:intervention, Intervention.new(
      author: 1,
      customer_id: 1,
      building_id: 1,
      battery_id: 1,
      column_id: 1,
      elevator_id: 1,
      employee_id: 1,
      result: "MyString",
      report: "MyString",
      status: "MyString"
    ))
  end

  it "renders new intervention form" do
    render

    assert_select "form[action=?][method=?]", interventions_path, "post" do

      assert_select "input[name=?]", "intervention[author]"

      assert_select "input[name=?]", "intervention[customer_id]"

      assert_select "input[name=?]", "intervention[building_id]"

      assert_select "input[name=?]", "intervention[battery_id]"

      assert_select "input[name=?]", "intervention[column_id]"

      assert_select "input[name=?]", "intervention[elevator_id]"

      assert_select "input[name=?]", "intervention[employee_id]"

      assert_select "input[name=?]", "intervention[result]"

      assert_select "input[name=?]", "intervention[report]"

      assert_select "input[name=?]", "intervention[status]"
    end
  end
end
