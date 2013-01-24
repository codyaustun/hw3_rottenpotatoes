require 'spec_helper'

describe MoviesController do
  describe 'finding similar movies' do
    before :each do
      @movie1 = FactoryGirl.create(:movie)
      @movie2 = FactoryGirl.create(:movie, :title => 'A Fake Title 2')
      @movie3 = FactoryGirl.create(:movie, :title => 'A Fake Title 3',
                                 :director => nil)
    end
    it 'should call the model method that finds movies by id' do
      Movie.should_receive(:find).with(%Q{#{@movie1.id}}).
        and_return(@movie1)
      get :similar, {:id => @movie1.id}
    end
    it 'should call the model method that finds similar movies' do
      Movie.stub(:find).and_return(@movie1)
      Movie.should_receive(:find_all_by_director).with('Bob').
        and_return([@movie1,@movie2])
      get :similar, {:id => @movie1.id}
    end
    describe 'with similar movies returned' do
      before :each do
        Movie.stub(:find_all_by_director).and_return([@movie1,@movie2])
        get :similar, {:id => @movie1.id}
      end
      it 'should select the similar movies template for rending' do
        response.should render_template('similar')
      end
      it 'should make the similar movies results available to the view' do
        assigns(:movies).should == [@movie1,@movie2]
      end
    end
    describe 'without similar movies' do
      it 'should redirect to the home page' do
        Movie.stub(:find_all_by_director).and_return(@movie3)
        get :similar, {:id => @movie3.id}
        response.should redirect_to(:action => :index)
      end
    end
  end
end
