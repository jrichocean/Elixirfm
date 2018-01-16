defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.
  """
  @endpoint "chart"

  @type chart_opts :: [page: non_neg_integer(), limit: non_neg_integer()]

  defp uri(url), do: Elixirfm.get_request(@endpoint <> url)

  @doc """
  Get the top artists chart
  """
  @spec get_top_artists(chart_opts) :: Elixirfm.response
  def get_top_artists(args \\ [page: 1, limit: 30]),
    do: uri(".gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Get the top tags chart
  """
  @spec get_top_tags(chart_opts) :: Elixirfm.response
  def get_top_tags(args \\ [page: 1, limit: 30]),
    do: uri(".gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Get the top tracks chart
  """
  @spec get_top_tracks(chart_opts) :: Elixirfm.response
  def get_top_tracks(args \\ [page: 1, limit: 30]),
    do: uri(".gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")

end
