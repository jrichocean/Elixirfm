defmodule Elixirfm.ArtistTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Elixirfm.Artist

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/artist")
    :ok
  end

  test "search/1 returns sucessful response" do
    use_cassette "ok_search_response" do
      artist = Artist.search("Amon Amarth")
      assert {:ok, %{"results" => _}} = artist
    end
  end

  test "get_info/1 returns sucessful response" do
    use_cassette "ok_get_info_response" do
      artist = Artist.get_info("Amon Amarth")
      assert {:ok, %{"artist" => _}} = artist
    end
  end

  test "get_similar/1 returns sucessful response" do
    use_cassette "ok_get_similar_response" do
      similar_artists = Artist.get_similar("Amon Amarth")
      assert {:ok, %{"similarartists" => _}} = similar_artists
    end
  end

  test "get_top_album/1 returns sucessful response" do
    use_cassette "ok_get_top_album_response" do
      top_album = Artist.get_top_album("Amon Amarth")
      assert {:ok, %{"topalbums" => _}} = top_album
    end
  end

  test "get_top_tags/1 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      top_tags = Artist.get_top_tags("Amon Amarth")
      assert {:ok, %{"toptags" => _}} = top_tags
    end
  end

  test "get_top_tracks/1 returns sucessful response" do
    use_cassette "ok_get_top_tracks_response" do
      top_tracks = Artist.get_top_tracks("Amon Amarth")
      assert {:ok, %{"toptracks" => _}} = top_tracks
    end
  end

  test "get_correction/1 returns sucessful response" do
    use_cassette "ok_get_correction_response" do
      correction = Artist.get_correction("Amon Amarth")
      assert {:ok, %{"corrections" => _}} = correction
    end
  end

end
