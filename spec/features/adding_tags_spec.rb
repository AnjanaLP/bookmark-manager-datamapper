feature 'Adding tags' do
  scenario 'a user can add a tag to a new bookmark' do
    visit '/bookmarks/new'
    fill_in "URL",   with: 'http://www.taggedbookmark.com/'
    fill_in "Title", with: 'Tagged Bookmark'
    fill_in "Tags",  with: 'New Tag'
    click_button "Submit"

    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include("New Tag")
  end
end
