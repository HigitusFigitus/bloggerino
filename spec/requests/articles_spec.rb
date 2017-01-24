require "rails_helper"

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(
      title: "Hypatia from which we spring",
      body: "Hypatia from which we spring, science, extraplanetary rings of Uranus. Colonies extraplanetary, at the edge of forever galaxies descended from astronomers! Sea of Tranquility muse about, Vangelis concept of the number one. Worldlets. Shores of the cosmic ocean, ship of the imagination, astonishment realm of the galaxies, kindling the energy hidden in matter Flatland, dream of the mind's eye. "
      )
  end

  describe "GET /articles/:id" do

    context "with existing article" do
      before { get "/articles/#{@article.id}" }

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end


    context "with non-existing article" do
      before { get "/articles/xxxx" }

      it "handles non-existing article" do
        expect(response.status).to eq 404
        flash_message = "The article you are looking for cannot be found"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
