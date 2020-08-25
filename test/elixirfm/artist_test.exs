defmodule Elixirfm.ArtistTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Artist

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/artist")
    ExVCR.Config.filter_request_headers("Authorization")
    ExVCR.Config.filter_url_params(true)
    :ok
  end

  test "search/1 returns sucessful response" do
    use_cassette "ok_search_response" do
      assert {:ok, %{"results" => _}} = search("Amon Amarth")
    end
  end

  # test "info/1 returns sucessful response" do
  #   use_cassette "ok_info_artist_response" do
  #     assert {:ok, %{"artist" => _}} = info("Amon Amarth")
  #   end
  # end

  test "similar/1 returns sucessful response" do
    use_cassette "ok_similar_artist_response" do
      assert {:ok, %{"similarartists" => _}} = similar("Amon Amarth")
    end
  end

  test "top_album/1 returns sucessful response" do
    use_cassette "ok_top_album_response" do
      assert {:ok, %{"topalbums" => _}} = top_album("Amon Amarth")
    end
  end

  test "top_tags/1 returns sucessful response" do
    use_cassette "ok_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = top_tags("Amon Amarth")
    end
  end

  test "top_tracks/1 returns sucessful response" do
    use_cassette "ok_top_tracks_artist_response" do
      assert {:ok, %{"toptracks" => _}} = Elixirfm.Artist.top_tracks("Amon Amarth")
    end
  end

  test "correction/1 returns sucessful response" do
    use_cassette "ok_correction_response" do
      assert {:ok, %{"corrections" => _}} = correction("Amon Amarth")
    end
  end

end
