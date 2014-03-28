require 'spec_helper'

describe "sermons/index" do
  before(:each) do
    assign(:sermons, [
      stub_model(Sermon,
        :book => "Book",
        :first_chapter => 1,
        :last_chapter => 2,
        :first_verse => 3,
        :last_verse => 4
      ),
      stub_model(Sermon,
        :book => "Book",
        :first_chapter => 1,
        :last_chapter => 2,
        :first_verse => 3,
        :last_verse => 4
      )
    ])
  end

  it "renders a list of sermons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Book".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
