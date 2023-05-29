# Africomp
Code for "Patient specific automated generative methods for a single finger, coupling non-linear soft actuator structural behavior to a kinematic finger model"
This section details the code used to automate mesh creation in MSC Apex and FEA analysis in MSC Marc/Mentat thereafter performing DOT optimization. 
The jupyter notebook python files are used to automate this proceedure where:

File "Apex_Final_18507522_04_11_OJoint_Cor.ipynb" is used to automate mesh creation
File "Marc_Final_InProgress_04_11_OJoint.ipynb" is used to setup the cascaded PNA actuators interacting with a finger model, thereafter performing FEM analysis
File "FinalCombination_Real_07_11.ipynb" is the main function used to automate the code calling the apex, marc and dot code to perform optimization. 

The dot2.py is the code used to perform DOT optimization. The code originally created by Professor G. Venter can be obtained by going to the DOTWrapper respository give in the following link: https://github.com/MODRG/DOTWrapper

The OpenSimOperate27_10 was used to create code fed into OpenSim to create the motion as well as scale the model accordingly. 

To be able to run the models one must be able to perform the remoting application as instructed by MSC Apex found in: https://help.hexagonmi.com/en-US/bundle/msc_apex_help/page/node/2178.html

After installing Anaconda, inside the Anaconda CMD run: ipython kernel install --name "Marc" --user
and ipython kernel install --name "Apex" --user
afterwards run the code in the cmd :jupyter kernelspec list which should give the directories for the kernels.

The code part which says "C:\\Users\\user\\anaconda3\\python.exe"
should be changed too where the MSC.Software file is example directories:

Apex:-----
"C:\\Users\\SBCgl\\AppData\\Roaming\\MSC.Software\\MSC Apex\\2022-004456\\python3\\python3.9.exe"

Marc:-----
"C:\\Users\\SBCgl\\AppData\\Roaming\\MSC.Software\\Marc\\2022.4.0\\mentat2022.4\\bin\\run_python.bat"
