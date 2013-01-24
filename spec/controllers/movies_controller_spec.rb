require 'spec_helper'

describe MoviesController do
  describe 'Finding similar Movie' do
    it 'should call the model method that finds similar movies'
    describe 'with similar movies returned' do
      it 'should select the similar movies template for rending'
      it 'should make the similar movies results available to the view'
    end
    describe 'without similar movies' do
      it 'should redirect to the home page'
    end
  end
end
