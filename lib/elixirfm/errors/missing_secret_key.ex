defmodule Elixirfm.MissingSecretKeyError do
  @moduledoc "Missing Secret Key Error"
  defexception message: """
    The secret_key settings is required for some of the Lastfm endpoints. Please include your
    Last.fm secret_key in your application config file like so:

      config :elixirfm, secret_key: _YOUR_SECRET_KEY_

    You can also set the api secret key as an environment variable:

      LASTFM_SECRET_KEY= _YOUR_SECRET_KEY_
  """
end
