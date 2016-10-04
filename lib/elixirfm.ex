defmodule Elixirfm do
  @moduledoc """
  Provides a wrapper for the Lastfm API.

  Currently in begining stages of development.  
  """

  defmodule MissingSecretKeyError do
    defexception message: """
      The secret_key settings is required for some of the Lastfm endpoints. Please include your
      strip api key in your application config file like so:

        config :stripe, secret_key: YOUR_SECRET_KEY

      Alternatively, you can also set the secret key as an environment variable:

        STRIPE_SECRET_KEY=YOUR_SECRET_KEY
    """
  end


end
