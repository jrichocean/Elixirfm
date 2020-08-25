defmodule Elixirfm.MissingApiKeyError do
  @moduledoc "Missing Api Key Error"
  defexception message: """
    The api_key settings is required for some of the Lastfm endpoints. Please include your
    Last.fm api key in your application config file like so:

      config :elixirfm, api_key: _YOUR_API_KEY_

    You can also set the secret key as an environment variable:

      LASTFM_API_KEY= _YOUR_API_KEY_
  """
end
