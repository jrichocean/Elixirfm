defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.
  """


  @doc """
  Get the top artists chart
  """
  def get_top_artists(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("/?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tags chart
  """
  def get_top_tags(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("/?method=chart.gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tracks chart
  """
  def get_top_tracks(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("/?method=chart.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")
  end

end
