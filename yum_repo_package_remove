for i in $(yum repolist all | grep / | awk -F '/' '{ print $1 }'); do yum repo-pkgs $i remove; done
