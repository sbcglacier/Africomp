# Analysis and Design for a Wearable Single-Finger-Assistive Soft Robotic Device Allowing Flexion and Extension for Different Finger Sizes
This repository contains the files used to perform 2D and 3D FEA analysis in Marc/Mentat for the proposed framework detailed in my published paper, which focuses on creating a hand assistive rehabilitation device for tendon-gliding exercises (TGE). It includes the response surface models for generating active and passive moments for joints based on a patient's middle finger dimensions. Additionally, Python code for automatically setting up the 2D FEA simulation in Marc/Mentat is provided. Files for automating the creation of the 3D model used in the reduced-order FEA for three cascaded units are also included. The repository contains an Excel file with data used to create the response surface models from OpenSim, as well as R code for conducting ANOVA analysis, calculating p-values, and determining R-squared and adjusted R-squared values. Dot was used as the selected optimization tool.

The file MiddleFingerPassiveActiveMoments.ipynb contains the python code to generate the passive and active moments for the finger joints targetting TGE joint angles.

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

Go to environmental Variables and add the following variables under user variables:
LD_LIBRARY_PATH -> C:\Program Files (x86)\vrand\dot6.0
VRAND_AUT -> C:\Program Files (x86)\vrand\licenses\vrand.lic

Copy to: C:\\Users\\SBCgl\\AppData\\Roaming\\MSC.Software\\MSC Apex\\2022-004456\\python3\\DLLs the py_post and py_mentat .pyd files
