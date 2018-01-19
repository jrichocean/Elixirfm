defmodule Elixirfm.Auth do
  @moduledoc """
  Functions for authenticating a user with Last.fm
  """
  @endpoint "http://www.last.fm/api/auth/"

  defp api_key(), do: Elixirfm.lastfm_key()
  defp api_secret(), do: Elixirfm.lastfm_secret()

  defp uri(url) do
    HTTPoison.get(@endpoint <> url)
  end

  @doc """
  request_user_auth/0 checks if the user is logged in to Last.fm, if not they will be redirected
  to the login page before being asked to grant your web application permission to use their account.
  You can optionally specify a callback URL that is different to your API Account callback url.
  to do this see the request_user_auth/1 function
  """
  def request_user_auth(), do: HTTPoison.get(@endpoint)

  @doc """
  request_user_auth/1 includes the query param `&cb=`. This allows you to have users to
  forward to a specific part of your site after the authorization process.
  """
  def request_user_auth(optional_callback_url) do
    uri("?api_key=#{api_key()}&cb=#{optional_callback_url}")
  end

  @doc """
  get_session/1 Fetches a session key for a user. It takes either the token returned
  after executing request_user_auth/1 or an anonymous function that returns the callback
  token as a string. This is the third step in the Last.fm authentication process.
  """
  @spec get_session(String.t|function) :: {:ok, term}|{:error, term}
  def get_session(callback_token) when is_binary(callback_token) do
    uri("auth.getSession&token=" <> _api_sig(callback_token))
  end
  def get_session(fun) when is_function(fun) do
    case String.valid?(fun.()) do
      token when token == true -> {:ok, get_session(token)}
      false -> {:error, "function did not return valid string"}
    end
  end
  def get_session(_), do: {:error, "arg must be a string or anonymous function"}

  def _api_sig(callback_token) do
    ["api_key", api_key(), "methodauth.getSessiontoken", callback_token, api_secret()]
    |> Enum.join()
    |> :erlang.md5()
  end
end

