require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  describe "Static pages" do
  	describe "Home page" do
  		it "should have the content 'TeamAlpha'" do
  			visit '/static_pages/home'
  			expect(page.to have_content('TeamAlpha'))
  		end
  	end
  end

end
