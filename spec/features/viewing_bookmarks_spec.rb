feature 'Viewing bookmarks' do
  scenario 'a user can see a list of existing bookmarks' do
    Bookmark.create(url: "http://www.google.co.uk", title: "Google")

    visit '/bookmarks'
    expect(page.status_code).to eq 200

    within 'ul.bookmark' do
      expect(page).to have_link("Google", href: "http://www.google.co.uk")
    end
  end
end
