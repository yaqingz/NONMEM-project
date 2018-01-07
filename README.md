# NONMEM-project
Pharmacokinetics-pharmacodynamics population model building with NONMEM on amphetamine’s effect affecting release of dopamine

1. Background
Characterizing the relationship between the pharmacokinetics (PK, concentration vs. time) and pharmacodynamics
(PD, effect vs. time) is an important tool being used in both pharmaceutical industry and medical institutes.
Amphetamine is a central nervous system stimulant, which will causes emotional and cognitive boost and its main
elimination route is via kidney, with 40% unchanged drug. As known, amphetamine will cause a release of
dopamine in the central nervous system.


2. Aim
The objective for this study is to build a population model explaining the relation between amphetamine
concentrations and dopamine levels.


3. Dataset used in modeling
The dataset, collected from animal experiments, consists of the data of 20 different individuals, with the
amphetamine concentration vs. time and dopamine concentration vs. time. Measurements of dopamine levels had
been taken in the nucleus accumbens using micro-dialysis, when amphetamine concentrations were measured in
plasma. Each individual had their dopamine baseline prior to a 5 mg intraperitoneal amphetamine administration.
After administration, both dopamine and amphetamine levels were measured every 15 minutes for 180 minutes after
administration.


4. Method

4.1 Tools used in modeling
During model building, NONMEM 7.3 was used for modeling and estimation. Meanwhile, PsN and Xpose 4.6.0 in
R environment were used to assist operation. After models were finished, Berkeley Madonna v. 8 was used as a tool
of plotting prediction.

4.2 Model building and evaluation criteria
The models consists of three components. The structural model included the basic properties, e.g. absorption rate,
and number of compartments, the statistical model included between-subject, between-occasion, and residual
variabilities, and the covariate model included the relationships between parameters.
Each model in NONMEM model included a pharmacokinetic code with initial parameter estimates and bounds
(THETA values), with between subject variability (ETA values), as well as differential equations to specify amount
and rate of transfer between compartments. Furthermore, an error code was included to specify the model for
residual variability which specifies how the variability of observed data varies from the individual model
predictions. Covariate data (OMEGA values) and variance of the residual variability (SIGMA values) were also
included in the model.
Models were evaluated by five criteria: justification from literature and dataset statistics, relative change in 
objective function with statistics significance, uncertainty of parameter estimates, goodness-of-fit plots in R, and
simulation based diagnostics.

4.3 PK/PD model
For PK model, three parameters were taken into account: clearance (CL) volume of distribution (V) and absorption
rate constant (Ka). Furthermore, the drug is considered following first order absorption.
At first stage, both one compartment and two compartments model are tested. After deciding model type, between subject 
variability (BSV) and residual unexplained variability (RUV) were added to each parameters, with
consideration of various relation with parameters (exponential, proportional and additive).
After comparison and adjustment, the final PK model was decided as first order absorption, one compartment model
with exponential BSV on CL and V, proportional RUV.
With the estimation of relevant parameters from PK model, PD model was developed. To seek for best fitting modeltype 
to dataset, five models were tested: direct effect linear, power linear, Emax, sigmoid Emax and indirect effect
model. In the following stage, BSV were added.
Above all, the model performed best, which is an indirect effect model combined with linear relation of drug
concentration, was chosen.


5. Results
After all the attempts made, a final decision is made: PK model is a first order absorption, one compartment model
with exponential BSV on CL and V, proportional RUV. With the data obtained from PK model estimation, the PD
model is developed as an indirect effect with linear concentration change with exponential BSV for all parameters
and proportional RUV.
