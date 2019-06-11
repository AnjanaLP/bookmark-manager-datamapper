feature 'Adding tags' do
  before do
    visit '/bookmarks/new'
    fill_in "URL",   with: 'http://www.taggedbookmark.com/'
    fill_in "Title", with: 'Tagged Bookmark'
  end

  scenario 'a user can add a tag to a new bookmark' do
    fill_in "Tags",  with: 'New Tag'
    click_button "Submit"

    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include("New Tag")
  end

  scenario 'a user can add multiple tags to a new bookmark' do
    fill_in "Tags",  with: 'New Tag, Test'
    click_button "Submit"

    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include("New Tag", "Test")
  end
end
