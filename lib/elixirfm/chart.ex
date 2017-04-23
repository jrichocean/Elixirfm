defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.
  """

  @type chart_opts :: [page: non_neg_integer(), limit: non_neg_integer()]

  @doc false
  def endpoint(), do: "chart"

  @doc """
  Get the top artists chart
  """
  @spec get_top_artists(chart_opts) :: Elixirfm.response
  def get_top_artists(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("#{endpoint()}.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tags chart
  """
  @spec get_top_tags(chart_opts) :: Elixirfm.response
  def get_top_tags(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("#{endpoint()}.gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tracks chart
  """
  @spec get_top_tracks(chart_opts) :: Elixirfm.response
  def get_top_tracks(args \\ [page: 1, limit: 30]) do
    Elixirfm.get_request("#{endpoint()}.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")
  end

end
