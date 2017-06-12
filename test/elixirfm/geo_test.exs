defmodule Elixirfm.GeoTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Elixirfm.Geo

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/geo")
    :ok
  end

  test "get_top_artists/1 returns sucessful response" do
    use_cassette "ok_get_top_artists_response" do
      artists = Geo.get_top_artists("spain")
      assert {:ok, %{"topartists" => _}} = artists
    end
  end

  test "get_top_artists/2 returns sucessful response" do
    use_cassette "ok_get_top_artist_singular_response" do
      artist = Geo.get_top_artists("spain", [limit: 1])
      assert {:ok, %{"topartists" => %{"@attr" => %{"perPage" => "1"}}}} = artist
    end
  end

  test "get_top_tracks/1 retruns sucessful response" do
    use_cassette "ok_top_tracks_response" do
      tracks = Geo.get_top_tracks("spain", [limit: 1])
      assert {:ok, %{"tracks" => _}} = tracks
    end
  end

  test "get_top_tracks/2 returns sucessful response" do
    use_cassette "ok_get_top_track_singular_response" do
      track = Geo.get_top_tracks("spain", [limit: 1])
      assert {:ok, %{"tracks" => %{"@attr" => %{"perPage" => "1"}}}} = track
    end
  end
end
