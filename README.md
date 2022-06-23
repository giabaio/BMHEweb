# BMHEweb
A R package to visualise the website for the summer school Bayesian methods in health economics

## Instructions
In order to view the course website locally, you will need to use the `R` package `servr`. You will also need to package `remotes`, which allows you to install packages from `GitHub`. You can do this by typing in your `R` terminal the following command.
```
install.packages("servr")
install.packages("remotes")
```

Once you have done this, you will need to install the package stored in this `GitHub` repository, which you can do by typing on your `R` terminal the following command.
```
remotes::install_github("giabaio/BMHEweb")
```

At this point, `R` will install the package `bmheWeb` on your computer --- this is what you need to visualise the entire course website. Once the installation has completed, you can then browse the course website anytime you like by simply going on your `R` terminal and typing the following command.
```
bmheWeb::launch_site()
```

This will open your default browser (e.g. Firefox or Chrome) and go to the home page of the course website. From there, you can navigate using the various links.
