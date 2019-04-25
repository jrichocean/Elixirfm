defmodule Elixirfm.ChartTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Chart

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/chart")
    :ok
  end

  test "get_top_artists/0 returns sucessful response" do
    use_cassette "ok_get_top_artists_response" do
      assert {:ok, %{"topartists" => _}} = get_top_artists()
    end
  end

  test "get_top_artists/1 returns 1 response" do
    use_cassette "ok_get_top_artists_single_response" do
      assert {:ok, %{"artists" => _}} = get_top_artists([limit: 1])
    end
  end

  test "get_top_tags/0 returns sucessful response" do
    use_cassette "ok_get_top_tags_response" do
      assert {:ok, %{"toptags" => _}} = get_top_tags()
    end
  end

  test "get_top_tags/1 returns sucessful response" do
    use_cassette "ok_get_top_tags_single_response" do
      assert {:ok, %{"tags" => _}} = get_top_tags([limit: 1])
    end
  end

  test "get_top_tracks/0 returns sucessful response" do
    use_cassette "ok_get_top_tracks_response" do
      assert {:ok, %{"tracks" => _}} = get_top_tracks()
    end
  end

  test "get_top_tracks/1 returns sucessful response" do
    use_cassette "ok_get_top_tracks_single_response" do
      assert {:ok, %{"tracks" => _}} = get_top_tracks([limit: 1])
    end
  end

end
