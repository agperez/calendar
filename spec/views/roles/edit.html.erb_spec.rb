require 'spec_helper'

describe "roles/edit" do
  before(:each) do
    @role = assign(:role, stub_model(Role,
      :name => "MyString",
      :color => "MyString"
    ))
  end

  it "renders the edit role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", role_path(@role), "post" do
      assert_select "input#role_name[name=?]", "role[name]"
      assert_select "input#role_color[name=?]", "role[color]"
    end
  end
end
