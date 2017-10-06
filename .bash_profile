# Dalton Petursson's Bash Profile
# .bash_profile is config for login shells



# config for things specific to a company or machine, placed at end to allow
# overrides
if [ -f ~/.bash_profile_local ]; then
  source ~/.bash_profile_local
fi

# source bash config file for non-login, interactive shells
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

