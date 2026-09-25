function fish_right_prompt --description 'Write out the right prompt'
    echo -n -s (set_color brblack) (date '+%H:%M:%S') (set_color --reset)
end
