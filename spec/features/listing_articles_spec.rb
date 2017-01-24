require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    @article1 = Article.create(
      title: "Network of wormholes",
      body: "Network of wormholes are creatures of the cosmos something incredible is waiting to be known preserve and cherish that pale blue dot? Star stuff harvesting star light not a sunrise but a galaxyrise? Great turbulent clouds citizens of distant epochs inconspicuous motes of rock and gas Jean-François Champollion, hundreds of thousands, preserve and cherish that pale blue dot circumnavigated, another world extraplanetary corpus callosum. With pretty stories for which there's little good evidence citizens of distant epochs paroxysm of global death, shores of the cosmic ocean culture. Dispassionate extraterrestrial observer Apollonius of Perga rings of Uranus hundreds of thousands Apollonius of Perga. Citizens of distant epochs."
      )

    @article2 = Article.create(
      title: "Encyclopaedia galactica",
      body: "Encyclopaedia galactica extraordinary claims require extraordinary evidence galaxies as a patch of light. Star stuff harvesting star light, Orion's sword muse about. Rings of Uranus. Explorations? Astonishment star stuff harvesting star light? Stirred by starlight corpus callosum rich in heavy atoms something incredible is waiting to be known! Hundreds of thousands Apollonius of Perga Sea of Tranquility muse about tendrils of gossamer clouds rich in heavy atoms! Intelligent beings not a sunrise but a galaxyrise, vastness is bearable only through love explorations quis nostrum exercitationem ullam corporis suscipit laboriosam prime number emerged into consciousness, Hypatia emerged into consciousness star stuff harvesting star light! Concept of the number one, descended from astronomers consectetur, explorations, Jean-François Champollion totam rem aperiam.")
  end

  scenario "User lists all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "User has no articles" do
    Article.delete_all

    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within ("h1#no-articles") do
      expect(page).to have_content("No articles created")
    end
  end
end