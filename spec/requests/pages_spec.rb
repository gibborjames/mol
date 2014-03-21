require 'spec_helper'

describe "Pages" do
  describe "Index pages" do
    it "should have the content 'Index Pages'" do
    	visit root_path
    	expect(page).to have_content('Index Pages')
    end
  end

  describe "Help pages" do
  	it "should have the content 'Help Pages'" do
  		visit help_path
  		expect(page).to have_content('Help Pages')
  	end
  end
end
