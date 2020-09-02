defmodule Elixirfm.Chart do
  @moduledoc "Functions for Last.fm Chart endpoints."
  
  @method "chart"

  @type chart_opts :: [page: non_neg_integer(), limit: non_neg_integer()]

  defp req(uri, args), do: Elixirfm.get_request(@method <> uri, args)

  @doc """
  Get the top artists chart
  """
  @spec top_artists(chart_opts) :: Elixirfm.response
  def top_artists(args \\ [page: 1, limit: 30]), do: req(".gettopartists", args)

  @doc """
  Get the top tags chart
  """
  @spec top_tags(chart_opts) :: Elixirfm.response
  def top_tags(args \\ [page: 1, limit: 30]), do: req(".gettoptags", args)

  @doc """
  Get the top tracks chart
  """
  @spec top_tracks(chart_opts) :: Elixirfm.response
  def top_tracks(args \\ [page: 1, limit: 30]), do: req(".gettoptracks", args)

end
