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

-   make graph from .psmc

```{bash}
module load gnuplot/5.2.2
${psmcdir}/utils/psmc_plot.pl ${sample} ${sample}.psmc
```

-   will then need to bring .psmc onto laptop, and can then use the texshop app to read and save the graph as a pdf