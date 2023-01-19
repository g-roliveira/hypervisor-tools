zypper pa --unneeded | awk -F '\\| ' {'print $3'} | xargs sudo zypper rm #might be necessary to run multible times to get dependencies of dependencies
