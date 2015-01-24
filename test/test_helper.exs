ExUnit.start()

defmodule ExJira.Test do

  def oauth_credentials do
    [ site: System.get_env("EXJIRA_SITE_ROOT"),
        private_key_file: System.get_env("EXJIRA_PRIVATE_KEY"),
        consumer_key: System.get_env("EXJIRA_CONSUMER_KEY") ]
  end

end