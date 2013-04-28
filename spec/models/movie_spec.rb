require 'spec_helper'

describe Movie do
  describe "similar_by_director" do
    it "should return movies by the director" do
    	movie1 = Movie.create(director: "zhezi")
    	movie2 = Movie.create(director: "ziv")
    	ans = movie1.similar_by_director
    	ans.include?(movie1).should be_true
    	ans.include?(movie2).should_not be_true
    	Movie.all_ratings
    end
  end
end