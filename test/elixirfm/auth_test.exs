defmodule Elixirfm.AuthTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Auth

  setup do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/auth")
    :ok
  end

  test "api_sig/1 produces md5 hash" do
    import Elixirfm.Auth, only: [_api_sig: 1]

    assert _api_sig("hi!") == <<20, 84, 133, 104, 111, 40, 56, 185, 151, 44, 168, 133, 254, 121, 21, 252>>
  end

  test "get_session/1 with invalid args returns :error tuple" do
    assert get_session(2345) == {:error, "arg must be a string or anonymous function"}
  end

  test "get_session/1 with invalid fun returns :error tuple" do
    fun = fn -> 123 end
    assert get_session(fun) == {:error, "function did not return valid string"}
  end

end
