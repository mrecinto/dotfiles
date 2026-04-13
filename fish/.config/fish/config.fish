if status is-interactive
    set -gx PATH $HOME/.local/bin $PATH
    set -g fish_greeting
    function org
      cd ~/Documents/org
      nvim org.md
    end

    function mnt
      cd /mnt/shared
      y
    end

function n
    set base "/mnt/shared/Documents/ucsd-notes/third-year/wi2026"

    # If no argument → just go to base
    if test (count $argv) -eq 0
        cd "$base"
        y
        return
    end

    # Class directory (e.g., 180a)
    set class_dir "$base/$argv[1]"

    # Notes directory inside class
    set notes_dir "$class_dir/notes"

    # Create class dir if it doesn't exist
    if not test -d "$class_dir"
        mkdir -p "$class_dir"
    end

    # Create notes dir if it doesn't exist
    if not test -d "$notes_dir"
        mkdir -p "$notes_dir"
    end

    # Enter notes directory
    cd "$notes_dir"

    y
end


function p
    set base "/mnt/shared/Documents/personal/practice"

    if test (count $argv) -eq 0
        cd "$base"
    else
        set target "$base/$argv[1]"
        mkdir -p "$target"
        cd "$target"
    end

    y
end
    function personal
      cd ~/Documents/personal
      y
    end
 function t
    if test (count $argv) -eq 0
        echo "usage: t <session-name>"
        return 1
    end

    tmux new-session -A -s $argv[1]
end
  
# function fish_prompt
#     # Matugen primary (ANSI slot 4)
#     printf "\e[38;5;4m%s" (whoami) 
#
#     printf "\e[97m@%s " (hostname -s)
#
#     # Reset to terminal foreground
#     printf "\e[39m%s> " (prompt_pwd)
# end
function fish_prompt
    # Username (Matugen primary)
    printf "\e[38;5;4m%s" (whoami)

    # Hostname (white)
    printf "\e[97m@%s " (hostname -s)

    # Path (Matugen primary, same tint)
    printf "\e[38;5;4m%s" (prompt_pwd)

    # Reset + prompt symbol
    printf "\e[39m> "
end


    function d
      cd ~/Downloads
      y
      
    end


    function notes
      cd ~/Documents/ucsd-notes
    end
    function third
      cd ~/Documents/ucsd-notes/third-year
    end


    function book
      cd ~/Documents/ucsd-notes/textbooks
      y
    end

    function 101
      cd /mnt/shared/Documents/ucsd-notes/third-year/sp2026/cse101
      y
    end
    function 100
      cd /mnt/shared/Documents/ucsd-notes/third-year/sp2026/cse100
      y
    end
    function 108
      cd /mnt/shared/Documents/ucsd-notes/third-year/sp2026/cogs108
      y
    end
    function 152
      cd /mnt/shared/Documents/ucsd-notes/third-year/sp2026/math152
      y
    end
    # current classes
    function 180a
      cd /mnt/shared/Documents/ucsd-notes/third-year/wi2026/180a
      y
    end
    function 154
      cd /mnt/shared/Documents/ucsd-notes/third-year/wi2026/154
      y
    end
    function 170a
      cd /mnt/shared/Documents/ucsd-notes/third-year/wi2026/170a
      y
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
      y
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
# alias xournalpp 'flatpak run com.github.xournalpp.xournalpp'
