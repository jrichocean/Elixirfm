defmodule Elixirfm.RequestError do
  @moduledoc """
  You may receive one of the following error codes from your webservices request. Some indicate errors you may encounter in development (e.g. "10: Invalid API key"), and some indicate errors you may encounter and need to handle in normal operation (e.g. "20: Not Enough Content")

    **1** : This error does not exist

    **2** : _Invalid service_ - This service does not exist

    **3** : _Invalid Method_ - No method with that name in this package

    **4** : _Authentication Failed_ - You do not have permissions to access the service

    **5** : _Invalid format_ - This service doesn't exist in that format

    **6** : _Invalid parameters_ - Your request is missing a required parameter

    **7** : Invalid resource specified

    **8** : _Operation failed_ - Most likely the backend service failed. Please try again.

    **9** : _Invalid session key_ - Please r_e-authenticate

    **10** : _Invalid API key_ - You must be granted a valid key by last.fm

    **11** : _Service Offline_ - This service is temporarily offline. Try again later.

    **12** : _Subscribers Only_ - This station is only available to paid last.fm subscribers

    **13** : Invalid method signature supplied

    **14** : _Unauthorized Token_ - This token has not been authorized

    **15** : This item is not available for streaming.

    **16** : The service is temporarily unavailable, please try again.

    **17** : **Login**: User requires to be logged in

    **18** : _Trial Expired_ - This user has no free radio plays left. Subscription required.

    **19** : This error does not exist

    **20** : _Not Enough Content_ - There is not enough content to play this station

    **21** : _Not Enough Members_ - This group does not have enough members for radio

    **22** : _Not Enough Fans_ - This artist does not have enough fans for for radio

    **23** : _Not Enough Neighbours_ - There are not enough neighbours for radio

    **24** : _No Peak Radio_ - This user is not allowed to listen to radio during peak usage

    **25** : _Radio Not Found_ - Radio station not found

    **26** : _API Key Suspended_ - This application is not allowed to make requests to the web services

    **27** : _Deprecated_ - This type of request is no longer supported

    **29** : _Rate Limit Exceded_ - Your IP has made too many requests in a short period, exceeding our API guidelines
  """
  defstruct type: nil, error: nil, message: nil, headers: nil
end
