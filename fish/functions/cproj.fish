function cproj
    set -l project (ghq list -p | fzf)

    if test -n "$project"
        cd "$project"
    end
end
