feature 'Creating bookmarks' do
  scenario 'a user can create a new bookmark' do
    visit '/bookmarks/new'
    expect(page.status_code).to eq 200

    fill_in "URL", with: "http://www.newbookmark.com"
    fill_in "Title", with: "New Bookmark"
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    within 'ul.bookmark' do
      expect(page).to have_link("New Bookmark", href: "http://www.newbookmark.com")
    end
  end
end
