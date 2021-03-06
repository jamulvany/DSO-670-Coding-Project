# DSO-670-Coding-Project

This repository contains code that explores numerical experiments from the paper "The Power and Limits of Predictive Approaches to Observational-Data-Drive Optimization" by Dimitris Bertsimas and Nathan Kallus. In paritcular, we will explore the performance of the predictive and prescriptive parametric methods outlined in the paper on synthetically generated demand data. Most notation used here is consistent with that used in the paper.

The "Sanity Check" folder contains three matlab files. predParam(n) computes the revenue generated by the predictive approach found in Section 6 of the paper given n data points. presParam(n) computes the revenue generated by the prescriptive approach described in Section 5 of the paper given n data points. The sanity check script replicates Figure 4(a) in the paper for the predictive and prescriptive parametric approaches to ensure that the code for both methods works correctly. 

The "Experiment 1" folder contains three matlab files. predParam(n,c) computes the revenue generated by the predictive approach given n data points and coefficient c that determines the true relationship between historical prices Z and contextual data X (i.e. Z=cX+W). presParam(n,c) does the same for the prescriptive parametric method. The exp1 script plots the revenue for the predictive and prescriptive methods for varying choices of c.

The "Experiment 2" folder contains three matlab files. predParam(n,tau) computes the revenue generated by the predictive approach given n data points and standard deviation tau for noise variable W in Z=cX+W. presParam(n,tau) does the same for the prescriptive parametric method. The exp2 script plots the revenue for the predictive and prescriptive methods for varying choices of tau.

The "Experiment 3" folder contains three matlab files. We assume that there is a secondary contextual variable O that is present. predParam(n) computes the revenue generated by the predictive approach given n data points. presParam(n) does the same for the prescriptive parametric method. The exp3 script plots the revenue for the predictive and prescriptive methods for varying n.


Citation: Bertsimas, Kallus. The Power and Limits of Predictive Approaches to Observational-Data-Driven Optimization (2017). arxiv https://arxiv.org/abs/1605.02347.
