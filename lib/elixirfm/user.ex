defmodule Elixirfm.User do
  @moduledoc "Last.fm User Endpoints"
  
  @type recent_track_arg :: {:limit, non_neg_integer()}
                            | {:page, non_neg_integer()}
                            | {:extended, non_neg_integer()}
                            | {:to, non_neg_integer()}
                            | {:from, non_neg_integer()}

  @type recent_track_args :: [recent_track_arg]

  @method "user"

  defp uri(url), do: Elixirfm.get_request(@method <> url)
  defp uri(url, args), do: Elixirfm.get_request(@method <> url, args)

  @doc """
  Get a user's profile infomation.
  """
  @spec info(String.t()) :: Elixirfm.response
  def info(user), do: uri(".getinfo&user=#{user}")

  @doc """
  Get a list of the user's friends on Last.fm.
  """
  @spec friends(String.t(), [limit: non_neg_integer(), page: non_neg_integer(), recenttracks: boolean()]) :: Elixirfm.response
  def friends(query, args \\ [limit: 15, page: 1, recenttracks: false]) do
    uri(".getfriends&user=#{query}", args)
  end

  @doc """
  Get a list of tracks by a given artist scrobbled by this user, including scrobble time.
  Can be limited to specific timeranges, defaults to all time.

  _start and end times not implemented yet_
  """
  @spec artist_tracks(String.t(), String.t(), [page: non_neg_integer()]) :: Elixirfm.response
  def artist_tracks(user, artist, args \\ [page: 1]) do
    uri(".getartisttracks&user=#{user}&artist=#{artist}", args)
  end

  @doc """
  Get the top albums listened to by a user. You can stipulate a time period. Sends the overall chart by default.

  ```peroid``` argument acceptes: overall | 7day | 1month | 3month | 6month | 12month
  """
  @spec top_albums(String.t(), [period: String.t(), page: non_neg_integer(), limit: non_neg_integer]) :: Elixirfm.response
  def top_albums(query, args \\ [period: "overall", page: 1, limit: 15]) do
    uri(".gettopalbums&user=#{query}", args)
  end

  @doc """
  Get the top artists listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  @spec top_artists(String.t(), [period: String.t(), page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def top_artists(query, args \\ [period: "overall", page: 1, limit: 15]) do
    uri(".gettopartists&user=#{query}", args)
  end

  @doc """
  Get the top tags used by this user.
  """
  @spec top_tags(String.t(), [limit: non_neg_integer()]) :: Elixirfm.response
  def top_tags(query, args \\ [limit: 15]),
    do: uri(".gettoptags&user=#{query}", args)

  @doc """
  Get the top tracks listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  @spec top_track(String.t(), [peroid: String.t(), page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def top_track(query, args \\ [peroid: "overall", page: 1, limit: 15]) do
    uri(".gettoptracks&user=#{query}", args)
  end

  # @doc """
  # Get an album chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent album chart for this user.
  # """
  # def album_chart(query, args \\ [from: , to: ]) do
  #   request("#{endpoint}.getweeklyalbumchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  # @doc """
  # def artist_chart(Get an artist chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent artist chart for this user.)
  # """
  # def artist_chart(query args \\ [from: , to: ]) do
  #   request("#{endpoint}.getweeklyartistchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  @doc """
  Get a list of available charts for this user, expressed as date ranges which can be sent to the chart services.
  """
  @spec weekly_charts(String.t()) :: Elixirfm.response
  def weekly_charts(user), do: uri(".getweeklychartlist&user=#{user}")

  # @doc """
  # Get a track chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent track chart for this user.
  # """
  def weekly_track_chart(query, min, max) do
    uri(".getweeklytrackchart&user=#{query}&from=#{min}&to=#{max}")
  end


  @doc """
  Get the last 50 tracks loved by a user.
  """
  @spec loved_tracks(String.t(), [page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def loved_tracks(query, args \\ [page: 1, limit: 50]),
    do: uri(".getlovedtracks&user=#{query}", args)

  @doc """
  Get a list of the recent tracks listened to by this user.
  Also includes the currently playing track with the nowplaying="true" attribute if the user is currently listening.

  ```extended``` argument accepts 1 or 0 as true or false

  _to and from arguments not implemented yet_
  """
  @spec recent_tracks(String.t(), recent_track_args) :: Elixirfm.response
  def recent_tracks(query, args \\ [limit: 20, page: 1, extended: 0, to: 0, from: 0]),
    do: uri(".getrecenttracks&user=#{query}", args)

end
