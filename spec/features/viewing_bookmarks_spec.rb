feature 'Viewing bookmarks' do
  scenario 'a user can see a list of existing bookmarks' do
    Bookmark.create(url: "http://www.google.co.uk", title: "Google")

    visit '/bookmarks'
    expect(page.status_code).to eq 200

    within 'ul.bookmark' do
      expect(page).to have_link("Google", href: "http://www.google.co.uk")
    end
  end

  scenario 'a user can filter bookmarks by a tag' do
    Bookmark.create(url: "http://www.bbcnews.co.uk", title: "BBC News", tags: [Tag.first_or_create(name: "news")])
    Bookmark.create(url: "http://www.google.co.uk", title: "Google", tags: [Tag.first_or_create(name: "search")])
    Bookmark.create(url: "http://www.skynews.co.uk", title: "Sky News", tags: [Tag.first_or_create(name: "news")])

    visit '/tags/news'

    within 'ul.bookmark' do
      expect(page).to have_link("BBC News", href: "http://www.bbcnews.co.uk" )
      expect(page).to have_link("Sky News", href: "http://www.skynews.co.uk")
      expect(page).not_to have_link("Google", href: "http://www.google.co.uk")
    end
  end
end
