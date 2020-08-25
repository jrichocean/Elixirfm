defmodule Elixirfm.TrackTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Track

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/track")
    ExVCR.Config.filter_request_headers("Authorization")
    ExVCR.Config.filter_url_params(true)
    :ok
  end

  test "correction/2 returns sucessful response" do
    use_cassette "ok_correction_response" do
      assert {:ok, %{"corrections" => _}} = correction("kvelertak", "meir")
    end
  end

  test "top_tags/2 returns sucessful response" do
    use_cassette "ok_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = top_tags("kvelertak", "meir")
    end
  end

  test "similar/2 returns sucessful response" do
    use_cassette "ok_similar_track_response" do
      assert {:ok, %{"similartracks" => _}} = Elixirfm.Track.similar("kvelertak", "meir")
    end
  end

  # test "info/2 returns sucessful response" do
  #   use_cassette "ok_info_response" do
  #     assert {:ok, %{"info" => _}} = info("kvelertak", "meir")
  #   end
  # end

  # test "tags/2 returns sucessful response" do
  #   use_cassette "ok_tags_response" do
  #     assert {:ok, %{"tags" => _}} = tags("kvelertak", "meir")
  #   end
  # end

  test "search_track/1 returns successful response" do
    use_cassette "ok_search_track_1_response" do
      assert {:ok, %{"results" => _}} = Elixirfm.Track.search_track("kvelertak")
    end
  end

end
