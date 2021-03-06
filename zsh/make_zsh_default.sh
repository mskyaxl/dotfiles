#!/usr/bin/env bash

# If this user's login shell is not already "zsh", attempt to switch.
   TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
   if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
      #If this platform provides a "chsh" command (not Cygwin), do it, man!
      if hash chsh >/dev/null 2>&1; then
         printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
         chsh -s $(grep /zsh$ /etc/shells | tail -1)
     # Else, suggest the user do so manually.
      else
         printf "I can't change your shell automatically because this system does not have chsh.\n"
         printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
      fi
   else
     printf "Cool! zsh is already the default shell!\n"	   
   fi
