defmodule Elixirfm.Album do
  @moduledoc """
  Wrapper for Last.fm Album endpoints.

  _Currently only supports endpoints that do not require authentication._

  To-do:
    1. album.getTags
    2. album.removeTag
  """


  @doc """
  Search for an album by name. Returns album matches sorted by relevance.
  """
  def search(query, args \\ [limit: 5, page: 1]) do
    Elixirfm.get_request("album.search&album=#{query}")
  end

  @doc """
  Get Album info.
  """
  def get_info(artist, album, args \\ [username: "", lang: "eng"]) do
    Elixirfm.get_request("album.getinfo&artist=#{artist}&album=#{album}&username=" <> args[:username] <> "&lang=" <> args[:lang])
  end

  # @doc """
  # *requires auth
  # Gets an Albums tags applied by an individual. If not authenticated, must pass username
  # """
  # def get_tags(artist, album, args \\ []) do
  #   Elixirfm.get_request("album.gettags&artist=#{artist}&album=#{album}")
  # end

  @doc """
  Get the top tags for an album on Last.fm, ordered by popularity.
  """
  def get_top_tags(artist, album, args \\ []) do
    Elixirfm.get_request("album.gettoptags&artist=#{artist}&album=#{album}")
  end

end
