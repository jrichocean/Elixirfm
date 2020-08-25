defmodule Elixirfm.TagTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Tag

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/tag")
    ExVCR.Config.filter_request_headers("Authorization")
    ExVCR.Config.filter_url_params(true)
    :ok
  end

  test "info/1 returns sucessful response" do
    use_cassette "ok_info_response" do
      assert {:ok, %{"tag" => _}} = Elixirfm.Tag.info("spain")
    end
  end

  test "similar/1 returns sucessful response" do
    use_cassette "ok_similar_response" do
      assert {:ok, %{"similartags" => _}} = similar("toad")
    end
  end

  test "top_albums/1 returns sucessful response" do
    use_cassette "ok_top_albums_response" do
      assert {:ok, %{"albums" => _}} = top_albums("spain")
    end
  end

  test "top_artists/1 returns sucessful response" do
    use_cassette "ok_top_artists_response" do
      assert {:ok, %{"topartists" => _}} = top_artists("mexico")
    end
  end

  test "top_tags/0 returns sucessful response" do
    use_cassette "ok_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = top_tags()
    end
  end

  test "top_tracks/1 returns sucessful response" do
    use_cassette "ok_top_tracks_response" do
      assert {:ok, %{"tracks" => _}} = top_tracks("argentina")
    end
  end

  test "weekly_chart/1 returns sucessful response" do
    use_cassette "ok_weekly_chart_response" do
      assert {:ok, %{"weeklychartlist" => _}} = weekly_chart("hip hop")
    end
  end
end
