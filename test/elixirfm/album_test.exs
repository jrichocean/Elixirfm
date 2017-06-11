defmodule Elixirfm.AlbumTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Elixirfm.Album

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/album")
    :ok
  end

  test "search/1 returns sucessful response" do
    use_cassette "ok_search_response" do
      artist = Album.search("Meir")
      assert {:ok, %{"results" => _}} = artist
    end
  end

  test "get_info/2 returns successful response" do
    use_cassette "ok_get_info_response" do
      info = Album.get_info("kvelertak", "Meir")
      assert {:ok, %{"album" => _}} = info
    end
  end

  test "get_top_tags/2 returns successful response" do
    use_cassette "ok_get_top_tags_response" do
      tags = Album.get_top_tags("kvelertak", "Meir")
      assert {:ok, %{"toptags" => _}} = tags
    end
  end

end
