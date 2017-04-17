defmodule Elixirfm.Auth do
  @moduledoc """
  Wrapper for authenticating a user with Last.fm
  _Support coming soon_
  """

  # @doc """
  # If the user is not logged in to Last.fm, they will be redirected to the login
  # page before being asked to grant your web application permission to use their account.
  # """
  # def request_user_auth() do
  #   HTTPoison.get("http://www.last.fm/api/auth/?api_key=#{@api_key}")
  # end

  # @doc """
  # You can optionally specify a callback URL that is different to your API Account callback url. Include this as a query param cb.
  # This allows you to have users forward to a specific part of your site after the authorisation process.
  # """
  # def request_user_auth(optional_callback_url) do
  #   HTTPoison.get("http://www.last.fm/api/auth/?api_key=#{@api_key}&#{optional_callback_url}")
  # end

  # @doc """
  # Fetch a session key for a user. The third step in the authentication process.
  # See the authentication how-to for more information.
  # """
  # def get_session(api_key, api_token, api_sig) do

  # end

  # defp create_api_sig() do
  #   :erlang.md5()
  #   @api_key <> "methodauth.getSessiontoken" <> callback_token <> @api_secret
  # end
end
