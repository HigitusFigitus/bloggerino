require "rails_helper"

RSpec.feature "Deleting an Article" do
  before do
    @article = Article.create(
      title: "Drake Equation",
      body: "Drake Equation prime number extraordinary claims require extraordinary evidence Cambrian explosion. Ship of the imagination Apollonius of Perga!"
      )
  end

  scenario "User deletes an article" do
    visit "/"
    click_link @article.title
    click_link "Delete article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end
