defmodule Elixirfm.AlbumTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Album

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/album")
    :ok
  end

  test "search/1 returns sucessful response" do
    use_cassette "ok_search_response" do
      assert {:ok, %{"results" => _}} = search("Meir")
    end
  end

  test "get_info/2 returns successful response" do
    use_cassette "ok_get_info_response" do
      assert {:ok, %{"album" => _}} = get_info("kvelertak", "Meir")
    end
  end

  test "get_top_tags/2 returns successful response" do
    use_cassette "ok_get_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = get_top_tags("kvelertak", "Meir")
    end
  end
end
