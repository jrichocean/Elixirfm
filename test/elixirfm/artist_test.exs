defmodule Elixirfm.ArtistTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Artist

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/artist")
    :ok
  end

  test "search/1 returns sucessful response" do
    use_cassette "ok_search_response" do
      assert {:ok, %{"results" => _}} = search("Amon Amarth")
    end
  end

  # test "get_info/1 returns sucessful response" do
  #   use_cassette "ok_get_info_response" do
  #     assert {:ok, %{"artist" => _}} = get_info("Amon Amarth")
  #   end
  # end

  test "get_similar/1 returns sucessful response" do
    use_cassette "ok_get_similar_response" do
      assert {:ok, %{"similarartists" => _}} = get_similar("Amon Amarth")
    end
  end

  test "get_top_album/1 returns sucessful response" do
    use_cassette "ok_get_top_album_response" do
      assert {:ok, %{"topalbums" => _}} = get_top_album("Amon Amarth")
    end
  end

  test "get_top_tags/1 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = get_top_tags("Amon Amarth")
    end
  end

  test "get_top_tracks/1 returns sucessful response" do
    use_cassette "ok_get_top_tracks_response" do
      assert {:ok, %{"toptracks" => _}} = get_top_tracks("Amon Amarth")
    end
  end

  test "get_correction/1 returns sucessful response" do
    use_cassette "ok_get_correction_response" do
      assert {:ok, %{"corrections" => _}} = get_correction("Amon Amarth")
    end
  end

end
