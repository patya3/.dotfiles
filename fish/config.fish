
set -g fish_term24bit 1
set fish_greeting
set EDITOR "nvim"
set FORGE_EMAIL "patrik.meszaros@aensys.hu"
set FORGE_API_TOKEN {api_toke}
export FORGE_EMAIL FORGE_API_TOKEN

starship init fish | source

# binds
bind -M insert \ck history-search-backward
bind -M insert \ch open_neovim_with_fzf_fish


# functions
function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
    bind \cf accept-autosuggestion
end

function lss
  ls -cla -d *$argv* 
end

function lsa
  ls -la
end

function open_neovim_with_fzf_fish
  set result $(_fzf_search_directory)
  if set -q result
    if test -d "$result"
      cd $result & nvim
    else if test -f "$result"
      set dir_and_file (string split -r -m1 / $result)
      set dir_and_file_length (count $dir_and_file)
      if test $dir_and_file_length -eq 2
        set git_dir (git -C $dir_and_file[1] rev-parse --absolute-git-dir)
        if not $git_dir
          cd $dir_and_file[1] & nvim $dir_and_file[2]
        else
          set git_folder_path (string split -r -m1 / $git_dir)
          cd $git_folder_path[1] & nvim
        end
      else
        nvim $dir_and_file[1]
      end
    end
  end
  commandline --function repaint
end

# aliasis
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""
alias lg="lazygit"
# alias ls="ls -la"
alias ..='cd ..'
alias ...='cd ../..'
alias cp="cp -i"
alias mv='mv -i'
alias fcd='cd $(ls -d */ | fzf)'
# alias fd='cd $(ls -d */ | fzf) & nvim'
alias ff='nvim $(fzf)'
alias used_ports='sudo lsof -i -P -n | grep LISTEN'
