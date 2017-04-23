defmodule Elixirfm.Track do
  @moduledoc """
  Wrapper for Last.fm Track endpoints
  """

  @doc false
  def endpoint(), do: "track"

  # @doc """
  # Tag an album using a list of user supplied tags.
  # *requires auth*
  # """
  # def add_tags() do
  # end

  @doc """
  Use the last.fm corrections data to check whether the supplied track has a correction to a canonical track.
  """
  @spec get_correction(String.t(), String.t()) :: Elixirfm.response
  def get_correction(artist, track) do
    Elixirfm.get_request("#{endpoint()}.getcorrection&artist=#{artist}&track=#{track}")
  end

  @doc """
  Get the metadata for a track on Last.fm using the artist & track name.
  """
  @spec get_info(String.t(), String.t(), [username: String.t()]) :: Elixirfm.response
  def get_info(artist, track, args \\ [username: ""]) do
    Elixirfm.get_request("#{endpoint()}.track.getInfo&artist=#{artist}&track=#{track}&username=#{args[:username]}")
  end

  @doc """
  Get the similar tracks for this track on Last.fm, based on listening data.
  """
  @spec get_similar(String.t(), String.t(), [limit: non_neg_integer()]) :: Elixirfm.response
  def get_similar(artist, track, args \\ [limit: 20]) do
    Elixirfm.get_request("#{endpoint()}.getsimilar&artist=#{artist}&track=#{track}&limit=#{args[:limit]}")
  end

  @doc """
  Get the tags applied by an individual user to a track on Last.fm.
  To retrieve the list of top tags applied to a track by all users use .getTopTags.
  """
  @spec get_tags(String.t(), String.t(), [username: String.t()]) :: Elixirfm.response
  def get_tags(artist, track, args \\ [username: ""]) do
    Elixirfm.get_request("#{endpoint()}.getTags&artist=#{artist}&track=#{track}&user=#{args[:username]}")
  end

  @doc """
  Get the top tags for this track on Last.fm, ordered by tag count.
  """
  @spec get_top_tags(String.t(), String.t()) :: Elixirfm.response
  def get_top_tags(artist, track) do
    Elixirfm.get_request("#{endpoint()}.gettoptags&artist=#{artist}&track=#{track}")
  end

end
