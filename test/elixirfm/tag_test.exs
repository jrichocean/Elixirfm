defmodule Elixirfm.TagTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Tag

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/tag")
    :ok
  end

  test "get_info/1 returns sucessful response" do
    use_cassette "ok_get_info_response" do
      assert {:ok, %{"tag" => _}} = get_info("spain")
    end
  end

  test "get_similar/1 returns sucessful response" do
    use_cassette "ok_get_similar_response" do
      assert {:ok, %{"similartags" => _}} = get_similar("toad")
    end
  end

  test "get_top_albums/1 returns sucessful response" do
    use_cassette "ok_get_top_albums_response" do
      assert {:ok, %{"albums" => _}} = get_top_albums("spain")
    end
  end

  test "get_top_artists/1 returns sucessful response" do
    use_cassette "ok_get_top_artists_response" do
      assert {:ok, %{"topartists" => _}} = get_top_artists("mexico")
    end
  end

  test "top_tags/0 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = top_tags()
    end
  end

  test "get_top_tracks/1 returns sucessful response" do
    use_cassette "ok_get_top_tracks_response" do
      assert {:ok, %{"tracks" => _}} = get_top_tracks("argentina")
    end
  end

  test "get_weekly_chart/1 returns sucessful response" do
    use_cassette "ok_get_weekly_chart_response" do
      assert {:ok, %{"weeklychartlist" => _}} = get_weekly_chart("hip hop")
    end
  end
end
