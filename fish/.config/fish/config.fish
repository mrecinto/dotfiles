if status is-interactive
    set -gx PATH $HOME/.local/bin $PATH
    function notes
      cd ~/Documents/ucsd-notes
    end
    function third
      cd ~/Documents/ucsd-notes/third-year
    end


    function book
      cd ~/Documents/ucsd-notes/textbooks
      nvim .
    end

    # current classes
    function 180a
      cd ~/Documents/ucsd-notes/third-year/wi2026/math180a
    end
    function 154
      cd ~/Documents/ucsd-notes/third-year/wi2026/math154
    end
    function 170a
      cd ~/Documents/ucsd-notes/third-year/wi2026/math170a
    end


    function wibreak
      cd ~/Documents/ucsd-notes/third-year/winter-break-2025
    end

















    function nsync
      rclone -v sync \
      'gdrive:GoodNotes/UCSD/' \
      /mnt/shared/GoodNotes/UCSD/
    end

    function cfg
      cd ~/dotfiles
    end

    function fi-cfg
      cd ~/.config/fish
    end

    function shared
      cd /mnt/shared/
    end
    function gdrive
      cd /mnt/shared/GoodNotes/UCSD
    end

   function discord
      Discord --enable-features=UseOzonePlatform --ozone-platform=wayland
   end
   # Doom Emacs
set -gx PATH $HOME/.config/emacs/bin $PATH

# Commands to run in interactive sessions can go here
end
