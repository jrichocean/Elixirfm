defmodule Elixirfm.TrackTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Track

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/track")
    :ok
  end

  test "get_correction/2 returns sucessful response" do
    use_cassette "ok_get_correction_response" do
      assert {:ok, %{"corrections" => _}} = get_correction("kvelertak", "meir")
    end
  end

  test "get_top_tags/2 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = get_top_tags("kvelertak", "meir")
    end
  end

  test "get_similar/2 returns sucessful response" do
    use_cassette "ok_get_similar_track_response" do
      assert {:ok, %{"similartracks" => _}} = Elixirfm.Track.get_similar("kvelertak", "meir")
    end
  end

  # test "get_info/2 returns sucessful response" do
  #   use_cassette "ok_get_info_response" do
  #     assert {:ok, %{"info" => _}} = get_info("kvelertak", "meir")
  #   end
  # end

  # test "get_tags/2 returns sucessful response" do
  #   use_cassette "ok_get_tags_response" do
  #     assert {:ok, %{"tags" => _}} = get_tags("kvelertak", "meir")
  #   end
  # end

  test "search_track/1 returns successful response" do
    use_cassette "ok_search_track_1_response" do
      assert {:ok, %{"trackmatches" => _}} = Elixirfm.Track.search_track("kvelertak")
    end
  end

  test "search_track/2 returns successful response" do
    use_cassette "ok_search_track_2_response" do
      assert {:ok, %{"trackmatches" => _}} = Elixirfm.Track.search_track("kvelertak", "kvelertak")
    end
  end
end
