defmodule Elixirfm.User do
  @moduledoc """
  Last.fm User Enpoints
  """

  @type recent_track_arg :: {:limit, non_neg_integer()}
                            | {:page, non_neg_integer()}
                            | {:extended_info, non_neg_integer()}
                            | {:to, non_neg_integer()}
                            | {:from, non_neg_integer()}

  @type recent_track_args :: [recent_track_arg]

  @method "user"

  defp uri(url), do: Elixirfm.get_request(@method <> url)

  @doc """
  Get a user's profile infomation.
  """
  @spec get_info(String.t()) :: Elixirfm.response
  def get_info(user), do: uri(".getinfo&user=#{user}")

  @doc """
  Get a list of the user's friends on Last.fm.
  """
  @spec get_friends(String.t(), [limit: non_neg_integer(), page: non_neg_integer(), recenttracks: boolean()]) :: Elixirfm.response
  def get_friends(query, args \\ [limit: 15, page: 1, recenttracks: false]) do
    uri(".getfriends&user=#{query}&limit=#{args[:limit]}&page=#{args[:page]}&recenttracks=#{args[:recenttracks]}")
  end

  @doc """
  Get a list of tracks by a given artist scrobbled by this user, including scrobble time.
  Can be limited to specific timeranges, defaults to all time.

  _start and end times not implemented yet_
  """
  @spec get_artist_tracks(String.t(), String.t(), [page: non_neg_integer()]) :: Elixirfm.response
  def get_artist_tracks(user, artist, args \\ [page: 1]) do
    uri(".getartisttracks&user=#{user}&artist=#{artist}&page=#{args[:page]}")
  end

  @doc """
  Get the top albums listened to by a user. You can stipulate a time period. Sends the overall chart by default.

  ```peroid``` argument acceptes: overall | 7day | 1month | 3month | 6month | 12month
  """
  @spec get_top_albums(String.t(), [period: String.t(), page: non_neg_integer(), limit: non_neg_integer]) :: Elixirfm.response
  def get_top_albums(query, args \\ [period: "overall", page: 1, limit: 15]) do
    uri(".gettopalbums&user=#{query}&peroid=#{args[:peroid]}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top artists listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  @spec get_top_artists(String.t(), [period: String.t(), page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def get_top_artists(query, args \\ [period: "overall", page: 1, limit: 15]) do
    uri(".gettopartists&user=#{query}&peroid=#{args[:peroid]}&limit=#{args[:limit]}&page=#{args[:page]}")
  end

  @doc """
  Get the top tags used by this user.
  """
  @spec get_top_tags(String.t(), [limit: non_neg_integer()]) :: Elixirfm.response
  def get_top_tags(query, args \\ [limit: 15]),
    do: uri(".gettoptags&user=#{query}&limit=#{args[:limit]}")

  @doc """
  Get the top tracks listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  @spec get_top_track(String.t(), [peroid: String.t(), page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def get_top_track(query, args \\ [peroid: "overall", page: 1, limit: 15]) do
    uri(".gettoptracks&user=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  # @doc """
  # Get an album chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent album chart for this user.
  # """
  # def get_album_chart(query args \\ [from: , to: ]) do
  #   get_request("#{endpoint}.getweeklyalbumchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  # @doc """
  # def get_artist_chart(Get an artist chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent artist chart for this user.)
  # """
  # def get_artist_chart(query args \\ [from: , to: ]) do
  #   get_request("#{endpoint}.getweeklyartistchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  @doc """
  Get a list of available charts for this user, expressed as date ranges which can be sent to the chart services.
  """
  @spec get_weekly_charts(String.t()) :: Elixirfm.response
  def get_weekly_charts(user), do: uri(".getweeklychartlist&user=#{user}")

  # @doc """
  # Get a track chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent track chart for this user.
  # """
  # def get_weekly_track_chart(query args \\ [from: , to: ]) do
  #   get_request("#{endpoint}.getweeklytrackchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end


  @doc """
  Get the last 50 tracks loved by a user.
  """
  @spec get_loved_tracks(String.t(), [page: non_neg_integer(), limit: non_neg_integer()]) :: Elixirfm.response
  def get_loved_tracks(query, args \\ [page: 1, limit: 50]),
    do: uri(".getlovedtracks&user=#{query}&limit=#{args[:limit]}&page=#{args[:page]}")

  @doc """
  Get a list of the recent tracks listened to by this user.
  Also includes the currently playing track with the nowplaying="true" attribute if the user is currently listening.

  ```extended_info``` argument accepts 1 or 0 as true or false

  _to and from arguments not implemented yet_
  """
  @spec get_recent_tracks(String.t(), [limit: non_neg_integer(), page: non_neg_integer(), extended_info: non_neg_integer()]) :: Elixirfm.response
  def get_recent_tracks(query, args \\ [limit: 20, page: 1, extended_info: 0]) do
    uri(".getrecenttracks&user=#{query}&limit=#{args[:limit]}&page=#{args[:page]}&extended=#{args[:extended_info]}")
  end
end
