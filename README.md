# Africomp
Code for "Patient specific automated generative methods for a single finger, coupling non-linear soft actuator structural behavior to a kinematic finger model"
This section details the code used to automate mesh creation in MSC Apex and FEA analysis in MSC Marc/Mentat thereafter performing DOT optimization. 
The jupyter notebook python files are used to automate this proceedure where:

File "Apex_Final_18507522_04_11_OJoint_Cor.ipynb" is used to automate mesh creation
File "Marc_Final_InProgress_04_11_OJoint.ipynb" is used to setup the cascaded PNA actuators interacting with a finger model, thereafter performing FEM analysis
File "FinalCombination_Real_07_11.ipynb" is the main function used to automate the code calling the apex, marc and dot code to perform optimization. 
