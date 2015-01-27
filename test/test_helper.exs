ExUnit.start()

defmodule ExJira.Test do

  def oauth_credentials do
    [ 
      site: System.get_env("EXJIRA_OAUTH_TEST_SITE_ROOT"),
      private_key_file: System.get_env("EXJIRA_OAUTH_TEST_PRIVATE_KEY"),
      consumer_key: System.get_env("EXJIRA_OAUTH_TEST_CONSUMER_KEY") 
    ]
  end

  def standard_credentials do
    [ 
      site: System.get_env("EXJIRA_SITE_ROOT"),
      private_key_file: System.get_env("EXJIRA_PRIVATE_KEY"),
      consumer_key: System.get_env("EXJIRA_CONSUMER_KEY"),
      access_token: System.get_env("EXJIRA_ACCESS_TOKEN"),
      access_token_secret: System.get_env("EXJIRA_ACCESS_TOKEN_SECRET")
    ]
  end

end