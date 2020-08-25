defmodule Elixirfm.GeoTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Geo

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/geo")
    :ok
  end

  test "top_artists/1 returns sucessful response" do
    use_cassette "ok_top_artists_response" do
      assert {:ok, %{"topartists" => _}} = top_artists("spain")
    end
  end

  test "top_artists/2 returns sucessful response" do
    use_cassette "ok_top_artist_singular_response" do
      assert {:ok, %{"topartists" => _}} = top_artists("spain", [limit: 1])
    end
  end

  test "top_tracks/1 retruns sucessful response" do
    use_cassette "ok_top_tracks_response" do
      assert {:ok, %{"tracks" => _}} = top_tracks("spain", [limit: 1])
    end
  end

  test "top_tracks/2 returns sucessful response" do
    use_cassette "ok_top_track_singular_response" do
      assert {:ok, %{"tracks" => _}} = top_tracks("spain", [limit: 1])
    end
  end
end
