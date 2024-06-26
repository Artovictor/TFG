%%%%setWTToolBoxPath%%%%

%close all

b = iea15MWBlade; 
plotBlade(b,{'IEA-15'});
plotAirfoil(b.layout.airfoili,{...
'Cylinder',...
'SNL-FFA-W3-500',...
'FFA-W3-360',...
'FFA-W3-330b',...
'FFA-W3-301',...
'FFA-W3-270b',...
'FFA-W3-241',...
'FFA-W3-211',...
});
ndb   = blade2ndBlade(b); 
plotNdBlade(ndb,{'IEA-15'});