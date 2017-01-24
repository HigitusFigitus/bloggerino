require "rails_helper"

RSpec.feature "Showing an article" do
  before do
    @article = Article.create(
      title: "Science circumnavigated rogue tendrils",
      body: "Science circumnavigated rogue tendrils of gossamer clouds rich in mystery with pretty stories for which there's little good evidence billions upon billions paroxysm of global death birth vanquish the impossible of brilliant syntheses rich in mystery Sea of Tranquility concept of the number one across the centuries, Rig Veda Cambrian explosion, white dwarf light years Cambrian explosion, are creatures of the cosmos! Circumnavigated, Drake Equation tesseract Drake Equation Cambrian explosion astonishment Drake Equation, extraplanetary, of brilliant syntheses colonies a still more glorious dawn awaits, globular star cluster not a sunrise but a galaxyrise."
      )
  end

  scenario "User shows an arttcle" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
