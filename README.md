# ISMWW-SupplyChainAnalytics

## Description
Talk given for the Institute for Supply Management, Western Washington (ISM-WW) chapter Emerging Professionals Technology Workshop series on September 29, 2016. We walk through the installation and basic operation of R and Python, then dive into examples including forecasting, clustering, classification and network optimization.


## Author
Kellen is a Senior Analyst at zulily (zulily.com) where he supports the Business Development group on data mining, merchandise planning and financial planning projects.

He also is on the Board of the Institute for Supply Management, Western Washington chapter, where he currently serves as Chair of the Emerging Professionals Committee and is running for Vice President in the next term.

Prior to zulily, Kellen was Lead Demand Planning Analyst in the aftermarket parts distribution division at PACCAR, one of the largest manufacturers of medium and heavy-duty trucks. He also has worked in the marine industry in various engineering, supply chain and project management roles.

Kellen holds an M.S. in Applied Mathematics from the University of Washington where he specialized in operations research and computational methods for data analysis. Currently, he is pursuing a second M.S. in Global Supply Chain Management from Portland State University with an interest in analytics and global supply chain dynamics.


## R Installation
Make sure you are using the latest version of R (3.3.1)
For Mac OSX ... http://cran.fhcrc.org/bin/macosx/R-3.3.1.pkg
For Windows ... http://cran.fhcrc.org/bin/windows/base/R-3.3.1-win.exe
After the download completes, launch the installer and follow the instructions.


## RStudio Installation
Make sure you are using the latest version of RStudio (0.99.903)
For Mac OSX ... https://download1.rstudio.org/RStudio-0.99.903.dmg
For Windows ... https://download1.rstudio.org/RStudio-0.99.903.exe
After the download completes, launch the installer and follow the instructions


## R Packages to Install
Open RStudio and in the console paste each of these lines and press enter
Start with the first line and wait for the package to finish installing before running the next
If it prompts you with a question ("Do you want to install from sources the package which needs compilation?") ... type n and press enter
install.packages("skmeans",dependencies=TRUE)
install.packages("randomForest",dependencies=TRUE)
install.packages("ROCR",dependencies=TRUE)
install.packages("lpSolve")


## Git Repository
git clone https://github.com/kbetts/ISMWW-SupplyChainAnalytics.git