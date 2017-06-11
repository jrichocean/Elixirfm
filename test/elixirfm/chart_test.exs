defmodule Elixirfm.ChartTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Elixirfm.Chart

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/chart")
    :ok
  end

  test "get_top_artists/0 returns sucessful response" do
    use_cassette "ok_get_top_artists_response" do
      top_artists = Chart.get_top_artists()
      assert {:ok, %{"artists" => _}} = top_artists
    end
  end

  test "get_top_artists/1 returns 1 response" do
    use_cassette "ok_get_top_artists_single_response" do
      single_artist = Chart.get_top_artists([limit: 1])
      assert {:ok, %{"artists" => %{"@attr" => %{"perPage" => "1"}}}} = single_artist
    end
  end  

  test "get_top_tags/0 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      top_tags = Chart.get_top_tags()
      assert {:ok, %{"tags" => _}} = top_tags
    end
  end

  test "get_top_tags/1 returns sucessful response" do
    use_cassette "ok_get_top_tags_single_response" do
      single_tag = Chart.get_top_tags([limit: 1])
      assert {:ok, %{"tags" => %{"@attr" => %{"perPage" => "1"}}}} = single_tag
    end
  end

  test "get_top_tracks/0 returns sucessful response" do
    use_cassette "ok_get_top_tracks_response" do
      top_tracks = Chart.get_top_tracks()
      assert {:ok, %{"tracks" => _}} = top_tracks
    end
  end

  test "get_top_tracks/1 returns sucessful response" do
    use_cassette "ok_get_top_tracks_single_response" do
      single_tracks = Chart.get_top_tracks([limit: 1])
      assert {:ok, %{"tracks" => %{"@attr" => %{"perPage" => "1"}}}} = single_tracks
    end
  end

end
