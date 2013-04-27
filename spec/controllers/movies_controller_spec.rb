require 'spec_helper'

describe MoviesController do
	describe "similar movies" do
		context "with director" do
			it "should assign director and movies" do
        movie = Movie.new(director: "zhezi", id: 55)
        movie.should_receive(:similar_by_director).and_return("aaa")
        Movie.stub(:find).with("55").and_return(movie)
        get :similar_movies, movie_id: 55
        assigns[:director].should == movie.director
        assigns[:movies].should == "aaa"
      end
		end
		context "without director" do
      it "should redirect to root page with a flash message" do
        movie = Movie.new(id: 55, title: "ziv")
        Movie.stub(:find).with("55").and_return(movie)
        get :similar_movies, movie_id: 55
        response.should redirect_to(root_path)
        flash[:notice].should == "'#{movie.title}' has no director info"
      end
		end
	end
end