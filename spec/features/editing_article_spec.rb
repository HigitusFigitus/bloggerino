require "rails_helper"

RSpec.describe "Editing an article" do
  before do
    @article = Article.create(
      title: "Light years",
      body: "Light years vanquish the impossible brain is the seed of intelligence rich in heavy atoms, decipherment permanence of the stars. Inconspicuous motes of rock and gas of brilliant syntheses vanquish the impossible intelligent beings, consciousness hearts of the stars vastness is bearable only through love a very small stage in a vast cosmic arena, prime number galaxies billions upon billions citizens of distant epochs, vastness is bearable only through love a mote of dust suspended in a sunbeam paroxysm of global death dispassionate extraterrestrial observer white dwarf Drake Equation star stuff harvesting star light!"
      )
  end

  scenario "User updates an article" do
    visit "/"
    click_link @article.title
    click_link "Edit article"
    fill_in "Title", with: "Updated title of article"
    fill_in "Body", with: "Updated body of article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

    scenario "User fails to update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit article"
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body of article"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end
