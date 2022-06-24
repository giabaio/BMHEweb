# BMHEweb
A R package to visualise the website for the summer school Bayesian methods in health economics

## Instructions
In order to view the course website locally, you will need to use the `R` package `servr`. You will also need to package `devtools`, which allows you to install packages from a "Package Archive File" (e.g. `zip`). You can do this by typing in your `R` terminal the following command.
```
install.packages("servr")
install.packages("devtools")
```

Once you have done this, dowload the content of this `GitHub` repository on your computer. You can do this by clicking on the green bottom in the top-right corner of the page (labelled as `Code`) and selecting `Download ZIP`. The download make take some time.  

When the `zip` file is downloaded on your computer, navigate to the directory in which you have saved it (e.g. `~/home/gianluca` or `C:\gianluca`) and install the package typing on your `R` terminal the following command.
```
devtools::install_local("BMHEweb.zip")
```
Alternatively, you can provide the full path to the `zip` file, e.g.
```
devtools::install_local("/home/gianluca/BMHEweb.zip")
```
or
```
devtools::install_local("C:\\gianluca\\BMHEweb.zip")
```

At this point, `R` will install the package `bmheWeb` on your computer --- this is what you need to visualise the entire course website. Once the installation has completed, you can then browse the course website anytime you like by simply going on your `R` terminal and typing the following command.
```
bmheWeb::launch_site()
```

This will open your default browser (e.g. Firefox or Chrome) and go to the home page of the course website. From there, you can navigate using the various links.
