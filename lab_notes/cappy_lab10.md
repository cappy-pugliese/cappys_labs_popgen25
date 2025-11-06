# Running PSMC

-   download PSMC from github

    ```{bash}
    mkdir <folder name>
    # make directory for the program
    git init
    # initialize it as a git repository
    git pull <url>
    # pulls git into repository
    ```

-   after downloading, run `make` inside both the psmc folder and the utils folder

    ```{bash}
    make

    cd utils
    make
    ```