defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.

  _Currently only supports endpoints that do not require authentication._
  """

  def get_top_artists(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!(args[:api_version] <> "/?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  def get_top_tags(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!(args[:api_version] <> "/?method=chart.gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  def get_top_tracks(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!("/?method=chart.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")
  end
end
