# TIGFET-BCB
A system-level evaluation of TIGFETs using the BCB3.0 methodology from Intel.


BCB benchmarking latest official update was presented by Dmitri E. Nikonov in
9/16/16. 
This extension was done by J. Romero Gonzalez and P.-E. Gaillardon at the
University of Utah, 06/05/2018. TIGFET technology is added to the list of
devices.

The set of MATLAB codes adjusted for TIGFET implementation include:
BCB.m, adder1toMany.m, NRIrev6.M, throughPower.m, XtorlikeArea.m,
XtorlikeDevPerf.m, XtorlikeSimCirc.m, beyondInputs6.m, TransCurrents.m,
plotNRI.m, and universalDevice.m.  The latter three set of codes were
adjusted to assign a different color to every different device category.
We assigned TIGFET the color of magenta to make it standout.

To get comparisons of multiple circuits, type
-BCB
After running 'BCB' routine, you have further options:
To get a plot and to output files of throughtput and power, type
-throughPower
To output files with areas of circuits, type
-areaNRI
To get universal characteristics of devices (like charge and resistance)
To get transistors' on- and off- current and volatges, type
-TransCurrent
