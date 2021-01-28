def create_a_twitter_bookmark
  visit('/add_bookmark')
  fill_in('url' , with: 'http://www.twitter.com')
  fill_in('title' , with: 'Twitter')
  click_button('Submit')
end
  