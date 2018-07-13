%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Versions.m
This is a file detailing the changes between the version of the code for
Beyond-CMOS Benchmarking.
It does not start from the first version, but better late than never, right?
___________________________________________________________________________
Version 3.14 compared to 3.13
alu.m
Corrected factors in the area, energy, and stanby power of arithmetic operation units and whole ALUs.
areaNRI.m
Added output of the area, time, and energy for ALUs to a file.
BCB.m
Changed ranges for plotting energy vs. delay for various circuits. Renamed the circuit 'RAM' to 'Register Bit'.
beyondInputs6.m
Introduced gate capacitance in fF/um units. 
Updated capacitance and current values of various tunneling FETs according to simulations.
Replace the CMOS LP (low power) from U. E. Avci VLSI'11 by 
CMOS LV (ow voltage) = ITRS structure driven by 0.3V as simulated by Raseong Kim.
GpnJDevPerf.m
Inserted gate leakage in this graphene device.
lengthfactors.m
Removed the interconnect length exception for the memory array. Instead it is a small register file.
MajGateArea.m
Expressed areas in terms of the intrinsic area = that of te majority gate.
MajGateSimCirc.m
A major correction of mistakes in times, energies, and leakage powers for majority gate circuits.
materialParameters.m
Corrected the factors for the time and energy of transistor interter and NAND circuits, 
based on new SPICE simulations (rather than old PETE simulations.
plotNRI.m
Changed the formatting options for plots.
throughPower.m
Changed the formatting options for plots.
TransCurrents.m
Changed the formatting options for plots.
XtorlikeArea.m
Change factors in calculating the area of inverter and NAND circuits.
C:\denikono\benchnik\XtorlikeSimCirc.m
Corrected mistakes in treatment of time and energy of mainly inverters and NAND, 
minor changes in other circuits. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%