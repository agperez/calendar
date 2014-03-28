require 'spec_helper'

describe "sermons/new" do
  before(:each) do
    assign(:sermon, stub_model(Sermon,
      :book => "MyString",
      :first_chapter => 1,
      :last_chapter => 1,
      :first_verse => 1,
      :last_verse => 1
    ).as_new_record)
  end

  it "renders new sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sermons_path, "post" do
      assert_select "input#sermon_book[name=?]", "sermon[book]"
      assert_select "input#sermon_first_chapter[name=?]", "sermon[first_chapter]"
      assert_select "input#sermon_last_chapter[name=?]", "sermon[last_chapter]"
      assert_select "input#sermon_first_verse[name=?]", "sermon[first_verse]"
      assert_select "input#sermon_last_verse[name=?]", "sermon[last_verse]"
    end
  end
end
