mb = @iea15MWBlade;

close all

% Example of usage
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


 %% 
% The following values are reported 
% From table 1-1 at page 5 of reference [1] rotor radius is 240/2 m.
% However, at Overview tab of [2] the rotor diameter is 242.23775645 m
% From table 1-1 at page 36 of reference [1] hub radius is 7.94/2 = 3.97 m 
% The blade length reported value in table 2-1 of [1 ]is 117 m. 
% However, the rotor radius minus the hub radius is, 120 m - 3.97 m = 
% 116.03 m. In order to fix the values we have three possibilities
% i) set a value of hub radius of 120 m - 117 m = 3 m
% ii) set a value of blade length of 120 m - 3.97 m = 116.03 m
% iii) set a value of rotor diameter of 3.97 + 117 = 120.97 which is a
% rotor diameter of 241.9 quite different from the value reported at the
% excel file of 242.23 m
%
%
% Because of the cleanest value set the option i) is chosen. That is
% Rotor radius R = 120 m;
% Blade length l_B = 117 m;
% Hub radius r_H = 3 m;
R                 = 120;
l_B               = 117;
rH                = R - l_B;
data              = getIEA15MWBladeGeometryFromExcelFile;
r                 = rH + l_B*data(:,1);
ns                = length(r);
c                 = data(:,2);
thetaG            = data(:,3);

y_pa              = c.*data(:,4);
twistCenter       = [y_pa,zeros(ns,1)];

% Airfoil circular tab of reference [2]
cd                = 0.35;
p                 ={@()cylinder(cd),...
                    @snl_ffa_w3_500_iea15,...
                    @ffa_w3_360_iea15,...
                    @ffa_w3_330b_iea15,...
                    @ffa_w3_301_iea15,...
                    @ffa_w3_270b_iea15,...
                    @ffa_w3_241_iea15,...
                    @ffa_w3_211_iea15,...
                    };



% According to the thickness distribution we define the airfoil data of the
% blade (cell of airfoil structures) and the airfoil layout of the blade.
% Airfoil relative thickness
% tc_i              = [1000,500,4000,350,300,250,210]./1000;
x                 = r/R;
tcLimits          = [0.98,0.4,0.34,0.31,0.28,0.26,0.211,0.19];
tc                = data(:,8)/100;
[airfoil,layout]  = tc2airfoilLayout(tc,x,tcLimits,p);

% The following snippet of code is to visually debug the airfoil
% distribution
%
% b    = iea15MWBlade;
% ns   = length(b.r);
% tb   = zeros(ns,1);
% data = getIEA15MWBladeGeometryFromExcelFile;
% for i = 1:ns
% tb(i) = b.airfoil{i}.ndtmax*100;
% end
% figure
% plot(data(:,1),data(:,8)); hold on;
% plot(data(:,1),tb); hold on;
% xlabel('$x$[--]');
% ylabel('$t/c$[--]');
%
% As it can be seen in the figure the thickness distribution is well
% covered using the airfoils maximum thickness.
%
% Update 29/04/2021: tc2airfoilLayout provides layout.xi which is the
% adimensional position of the blade where it occurs a change of the
% airfoil region. But in order to use blade2dsBlade function, it is
% neccesary to have the variable with dimensions so that, the field
% layout.ri is added to layout structure:
layout.ri = layout.xi.*R;


blade = struct(...
               'class','blade',...
               'id','IEC10MW',...
               'r',r,...
               'twistCenter',twistCenter,...
               'airfoil',{airfoil}, ...
               'layout', layout,...
               'c',c,...
               'thetaG',thetaG...
               );


