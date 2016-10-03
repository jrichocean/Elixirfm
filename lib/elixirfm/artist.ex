defmodule Elixirfm.Artist do
  @moduledoc """
  Wrapper for Last.fm Artist endpoints.

  _Currently only supports endpoints that do not require authentication._

  todo:
    artist.addTags
    artist.getTags
    artist.removeTags
  """
  use HTTPoison.Base


  @endpoint_base "http://ws.audioscrobbler.com/2.0/"
  @api_key Application.fetch_env!(:elixirfm, :api_key)
  

  @doc """
  Search an artist
  """
  def search(query, args \\ [page: 1, limit: 30]) do
    get!('?method=artist.search&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}')
  end

  @doc """
  Get artist info
  """
  def get_info(query, args \\ [lang: "eng", username: ""]) do
    get!("?method=artist.getinfo&artist=#{query}&lang=#{args[:lang]}&username=#{args[:username]}")
  end

  @doc """
  Retrive list of Similar Artists
  """
  def get_similar(query, args \\ [limit: 10]) do
    get!("?method=artist.getsimilar&artist=#{query}&limit=#{args[:limit]}")
  end

  @doc """
  *requires auth
  Get Lastfm tags associated with the artist
  """
  # def get_tags(query, args \\ []) do
  #   get!("?method=artist.getTags&artist=#{query}")
  # end

  @doc """
  Get Top albums for an artist, ordered by popularity
  """
  def get_top_album(query, args \\ [page: 1, limit: 30]) do
    get!("?method=artist.gettopalbums&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Gets top tags for an artist on Lastfm, ordered by popularity
  """
  def get_top_tags(query) do
    get!("?method=artist.gettoptags&artist=#{query}")
  end

  @doc """
  Gets top tracks for an artist, ordered by popularity. (defaults to first 15)
  """
  def get_top_tracks(query, args \\ [page: 1, limit: 15]) do
    get!("?method=artist.gettoptracks&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
  """
  def get_correction(query) do
    get!("?method=artist.getcorrection&artist=#{query}")
  end


  def process_url(url), do: @endpoint_base <> url <> "&api_key=#{@api_key}&format=json"
  def process_response_body(body), do: body |> Poison.decode!

end
