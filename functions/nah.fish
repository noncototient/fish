function nah
    git reset --hard
    git clean -df

    set current_branch (git rev-parse --abbrev-ref HEAD);
    read -l -P "Do you want to delete $current_branch branch? [y/N]? " confirm

    switch $confirm
        case Y y
            git checkout master
            git branch -D $current_branch
            set_color red
            echo "Deleted $current_branch branch"
            set_color normal
        case '' N n
            set_color green
            echo "Keeping and staying on $current_branch branch"
            set_color normal
    end
end
