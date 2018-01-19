defmodule Elixirfm.AuthTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Elixirfm.Auth

  test "api_sig/1 produces md5 hash" do
    import Elixirfm.Auth, only: [_api_sig: 1]

    assert _api_sig("hi!") == <<119, 45, 154, 232, 171, 87, 173, 110, 208, 9, 146, 16, 229, 16, 89, 36>>
  end

  test "get_session/1 with invalid args returns :error tuple" do
    assert get_session(2345) == {:error, "arg must be a string or anonymous function"}
  end

  test "get_session/1 with invalid fun returns :error tuple" do
    fun = fn -> 123 end
    assert get_session(fun) == {:error, "function did not return valid string"}
  end

end
