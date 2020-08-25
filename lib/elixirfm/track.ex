defmodule Elixirfm.Track do
  @moduledoc "Functions for Last.fm Track endpoints"
  
  @method "track"

  defp uri(url), do: Elixirfm.get_request(@method <> url)
  defp uri(url, args), do: Elixirfm.get_request(@method <> url, args)

  # @doc """
  # Tag an album using a list of user supplied tags.
  # *requires auth*
  # """
  # def add_tags() do
  # end

  @doc """
  Use the last.fm corrections data to check whether the supplied track has a correction to a canonical track.
  """
  @spec correction(String.t(), String.t()) :: Elixirfm.response
  def correction(artist, track),
    do: uri(".getcorrection&artist=#{artist}&track=#{track}")

  @doc """
  Get the metadata for a track on Last.fm using the artist & track name.
  """
  @spec info(String.t(), String.t(), [username: String.t()]) :: Elixirfm.response
  def info(artist, track, args \\ [username: ""]),
    do: uri(".getInfo&artist=#{artist}&track=#{track}", args)

  @doc """
  Get the similar tracks for this track on Last.fm, based on listening data.
  """
  @spec similar(String.t(), String.t(), [limit: non_neg_integer()]) :: Elixirfm.response
  def similar(artist, track, args \\ [limit: 20]),
    do: uri(".getsimilar&artist=#{artist}&track=#{track}", args)

  @doc """
  Get the tags applied by an individual user to a track on Last.fm.
  To retrieve the list of top tags applied to a track by all users use .getTopTags.
  """
  @spec tags(String.t(), String.t(), [username: String.t()]) :: Elixirfm.response
  def tags(artist, track, args \\ []),
    do: uri(".getTags&artist=#{artist}&track=#{track}", args)

  @doc """
  Get the top tags for this track on Last.fm, ordered by tag count.
  """
  @spec top_tags(String.t(), String.t()) :: Elixirfm.response
  def top_tags(artist, track),
    do: uri(".gettoptags&artist=#{artist}&track=#{track}")

  @doc """
  Search for track by track name, returns tracks sorted by relanvance.
  Can be supplied with an artist to further narrow down search
  """
  @spec search_track(String.t(), [artist: String.t()]) :: Elixirfm.response
  def search_track(title, args \\ [artist: ""]),
    do: uri(".search&track=#{title}&artist=#{args[:artist]}")

end
