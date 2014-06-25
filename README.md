MVST
=========

Purpose
-------

An R-Software package to facilitate the implementation and study of multi-variate spatio-temporal models, primarily in environmental applications. 
		
Details: The study of environmental phenomena, particularly those which evolve in both space and time, has become increasingly difficult due to the prolific nature of satellite data and the sheer scale of the space-time domain under consideration. Further, observations of different nature, such as point-referenced observations or observations with a large support (which take averages or aggregate readings) frequently need to be considered simultaneously. Further, one generally needs to consider more than one evolving phenomenon, which may be interacting with each other. Today there are methods and computational tools in place to harness these intrinsic difficulties. The purpose of this package is to wrap up theoretical results and linear algebraic tools to facilitate the study for the end-user.

Computationally tractability in these types of problems is maintained by (i) assuming that each spatial/spatio-temporal process under consideration is a Gaussian field, (ii) that each Gaussian field can be representatively decomposed on a finite-element mesh (using the approach of Lindgren et al. (2011)) and that the observations are corrupted with Gaussian noise. The statitician will have already noted that this results in a (large) Bayesian update which can be computed in a few lines of code. The difficulty, however, is not the update itself, rather the matrix construction when we have multiple interacting processes and multiple observations. For this reason, the package implements an object-oriented approach to the problem, where each process or observation is an object which can be linked to one another. The links effectively construct the incidence matrices which map the observations to the processes. Any number of links can be considered and the ease with which it is done allows for the manipulation of a large number of interacting spatio-temporal processes and observations with relative ease. 

The abstraction in an object-oriented framework has several advantages. In particular, any basis set can be associated with a statistical model. I have restricted the use to a finite element basis, however the methods can easily be extended to consider an EOF basis or a bisquare basis, the interface to the user would remain unchanged. A further interesting feature is the ability to deal with observations seamlessly, using a common interface, irrespective of their nature. For example, due to the inheritance structure one may use same command to plot observations, irrespective of their spatial support. In this package I harness the flexibility of Hadley Wickham's `ggplot2` package for plotting.

The package is still under development (and will always be), however it is in a good state to start being used by the end-user. A very simple hands-on tutorial on how to use the package can be seen in the accompanying vignette, while a full-blown application, containing 4 interacting spatio-temporal processes and 4 observations data sets, can be seen on our [project website](http://www.rates-antarctica.net/).
		
Usage
-------


To install in R, first load Hadley Wickham's devtools and then in console type
	
	install_git("https://www.github.com/andrewzm/MVST",build_vignettes=F,dependencies=T)



Contact:	Andrew Zammit-Mangion

Date:	25/06/2014

Copyright (c) 2014, under the Simplified BSD License. 

For more information on FreeBSD see: http://www.opensource.org/licenses/bsd-license.php
All rights reserved.
