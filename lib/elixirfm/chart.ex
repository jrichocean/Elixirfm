defmodule Elixirfm.Chart do
  @moduledoc """
  Wrapper for Last.fm Chart endpoints.
  """
  use HTTPoision.Base

  @endpoint_base "http://ws.audioscrobbler.com/"
  @api_key Application.fetch_env!(:elixirfm, :api_key)


  @doc """
  Get the top artists chart
  """
  def get_top_artists(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!(args[:api_version] <> "/?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tags chart
  """
  def get_top_tags(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!(args[:api_version] <> "/?method=chart.gettoptags&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tracks chart
  """
  def get_top_tracks(args \\ [api_version: "2.0", page: 1, limit: 30]) do
    get!(args[:api_version] "/?method=chart.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  def process_url(url), do: @endpoint_base <> url <> "&api_key=#{@api_key}&format=json"
  def process_response_body(body), do: body |> Poison.decode!
end
