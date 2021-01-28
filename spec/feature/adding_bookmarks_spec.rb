feature 'Adding bookmarks' do
  scenario 'the user can add new bookmark' do
    visit('/')
    click_button 'Add bookmark'
    expect(page).to have_content('Enter URL:')
  end

  scenario 'A user can add a bookmark to Bookmark Manager' do
    create_a_twitter_bookmark
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
