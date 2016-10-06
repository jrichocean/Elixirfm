defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.
  """


  @doc """
  Get the top artists chart
  """
  def get_top_artists(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    Elixirfm.get_request(args[:api_version] <> "/?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tags chart
  """
  def get_top_tags(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    Elixirfm.get_request(args[:api_version] <> "/?method=chart.gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tracks chart
  """
  def get_top_tracks(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    Elixirfm.get_request(args[:api_version] <> "/?method=chart.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")
  end

end
