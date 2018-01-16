defmodule Elixirfm.Album do
  @moduledoc """
  Wrapper for Last.fm Album endpoints.

  _Currently only supports endpoints that do not require authentication._

  To-do:
    1. album.getTags
    2. album.removeTag
  """
  @endpoint "album"

  defp uri(url), do: Elixirfm.get_request(@endpoint <> url)

  @doc """
  Search for an album by name. Returns album matches sorted by relevance.
  """
  @spec search(String.t(), keyword()) :: Elixirfm.response
  def search(query, args \\ [limit: 5, page: 1]) do
    uri(".search&album=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get Album info.
  """
  @spec get_info(String.t(), String.t(), keyword()) :: Elixirfm.response
  def get_info(artist, album, args \\ [username: "", lang: "eng"]) do
    uri(".getinfo&artist=#{artist}&album=#{album}&username=#{args[:username]}&lang=#{args[:lang]}")
  end

  # @doc """
  # *requires auth
  # Gets an Albums tags applied by an individual. If not authenticated, must pass username
  # """
  # def get_tags(artist, album, args \\ []) do
  #   uri("#{@endpoint}.gettags&artist=#{artist}&album=#{album}")
  # end

  @doc """
  Get the top tags for an album on Last.fm, ordered by popularity.
  """
  @spec get_top_tags(String.t(), String.t(), keyword()) :: Elixirfm.response
  def get_top_tags(artist, album, args \\ [autocorrect: 0]) do
    uri(".gettoptags&artist=#{artist}&album=#{album}&autocorrect=#{args[:autocorrect]}")
  end
end
