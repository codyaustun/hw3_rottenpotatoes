Then /the director of "([^"]*)" should be "([^"]*)"$/ do |movie, director|
  Movie.find_by_title(movie).director.should == director 
end
