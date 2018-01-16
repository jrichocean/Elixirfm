defmodule Elixirfm.GeoTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Geo

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/geo")
    :ok
  end

  test "get_top_artists/1 returns sucessful response" do
    use_cassette "ok_get_top_artists_response" do
      assert {:ok, %{"topartists" => _}} = get_top_artists("spain")
    end
  end

  test "get_top_artists/2 returns sucessful response" do
    use_cassette "ok_get_top_artist_singular_response" do
      assert {:ok, %{"topartists" => _}} = get_top_artists("spain", [limit: 1])
    end
  end

  test "get_top_tracks/1 retruns sucessful response" do
    use_cassette "ok_top_tracks_response" do
      assert {:ok, %{"tracks" => _}} = get_top_tracks("spain", [limit: 1])
    end
  end

  test "get_top_tracks/2 returns sucessful response" do
    use_cassette "ok_get_top_track_singular_response" do
      assert {:ok, %{"tracks" => _}} = get_top_tracks("spain", [limit: 1])
    end
  end
end
