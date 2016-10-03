defmodule Elixirfm.Artist do
  @moduledoc """
  Wrapper for artist endpoints
  """
  @api "http://ws.audioscrobbler.com/2.0/"
  @api_key Application.fetch_env!(:elixirfm, :api_key)
  

  @doc """
  Search an artist
  """
  def search(query, args \\ [page: 1, limit: 30]) do
    url = "?method=artist.search&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}"
    HTTPoison.get!(url).body
  end


  def process_url(url), do: @api <> url <> "&api_key=#{@api_key}&format=json"
  def process_response_body(body), do: body |> Poison.decode!

end
