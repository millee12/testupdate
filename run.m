%runscript for embedded matlab compressor
clear
%Initialize busses for test model
nA=2;
M0A=1;
T0A=300;
P0A=700;
H0A=3.2510e+05*M0A;
stateA.mass = M0A*ones(nA,1);
stateA.pressure = P0A*ones(nA,1);
stateA.enthalpy = H0A*ones(nA,1);
stateA.temperature = zeros(nA,1);
stateA.density = zeros(nA,1);
stateA.quality = zeros(nA,1);
stateA.dimensions=1;
stateA.phases=2;
 load('fpropsR134a.mat','fluid');
 fluid=rmfield(fluid,'name');
 stateA.fluid=fluid;
% stateA.tags.subst='R134a';
businfo=Simulink.Bus.createObject(stateA);
stateAbus=eval(businfo.busName);
clear businfo.bus.Name
sim('testupdate')
