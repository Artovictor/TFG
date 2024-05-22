adb = getAirfoilDatabase;

du       = adb.familyName=="DU" ;
adb_du   = adb(du,:);
ndu      = size(adb_du,1);
geom     = adb.familyName=="geometric" ;
adb_geom = adb(geom,:);
ngeom      = size(adb_geom,1);
naca     = adb.familyName=="NACA";
adb_naca = adb(naca,:);
nnaca      = size(adb_naca,1);
riso     = adb.familyName=="RISO";
adb_riso = adb(riso,:);
nriso      = size(adb_riso,1);
ffa      = adb.familyName=="FFA";
adb_ffa  = adb(ffa,:);
nffa      = size(adb_ffa,1);
nrel     = adb.familyName=="NREL";
adb_nrel = adb(nrel,:);
nnrel      = size(adb_nrel,1);
ah       = adb.familyName=="AH";
adb_ah   = adb(ah,:);
nah      = size(adb_ah,1);

adb_15_af(1,:) = snl_ffa_w3_500_iea15;
adb_15_af(2,:) = ffa_w3_360_iea15;
adb_15_af(3,:) = ffa_w3_330b_iea15;
adb_15_af(4,:) = ffa_w3_301_iea15;
adb_15_af(5,:) = ffa_w3_270b_iea15;
adb_15_af(6,:) = ffa_w3_241_iea15;
adb_15_af(7,:) = ffa_w3_211_iea15;
adb_15_af_table = struct2table(adb_15_af);
adb_15_size = size(adb_15_af_table,1);

colors   = lines(7);
figure(2)
plot(adb_geom{:,'ndtmax'},adb_geom{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(1,:)); hold on;
for i = 1:ngeom
    name      = regexprep(adb_geom{i,'id'},'_','-');
    text(1.02*adb_geom{i,'ndtmax'},adb_geom{i,'kMax'},upper(name));
end
plot(adb_du{:,'ndtmax'},adb_du{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(2,:)); hold on;
for i = 1:ndu
    name      = regexprep(adb_du{i,'id'},'_','-');
    text(1.02*adb_du{i,'ndtmax'},adb_du{i,'kMax'},upper(name));
end
plot(adb_naca{:,'ndtmax'},adb_naca{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(3,:)); hold on;
for i = 1:nnaca
    name      = regexprep(adb_naca{i,'id'},'_','-');
    text(1.02*adb_naca{i,'ndtmax'},adb_naca{i,'kMax'},upper(name));
end
plot(adb_riso{:,'ndtmax'},adb_riso{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(4,:)); hold on;
for i = 1:nriso
    name      = regexprep(adb_riso{i,'id'},'_','-');
    text(1.02*adb_riso{i,'ndtmax'},adb_riso{i,'kMax'},upper(name));
end
plot(adb_ffa{:,'ndtmax'},adb_ffa{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(5,:)); hold on;
for i = 1:nffa
    name      = regexprep(adb_ffa{i,'id'},'_','-');
    text(1.02*adb_ffa{i,'ndtmax'},adb_ffa{i,'kMax'},upper(name));
end
plot(adb_nrel{:,'ndtmax'},adb_nrel{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(6,:)); hold on;
for i = 1:nnrel
    name      = regexprep(adb_nrel{i,'id'},'_','-');
    text(1.02*adb_nrel{i,'ndtmax'},adb_nrel{i,'kMax'},upper(name));
end
plot(adb_ah{:,'ndtmax'},adb_ah{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(7,:)); hold on;
for i = 1:nah
    name      = regexprep(adb_ah{i,'id'},'_','-');
    text(1.02*adb_ah{i,'ndtmax'},adb_ah{i,'kMax'},upper(name));
end
plot(adb_15_af_table{:,'ndtmax'},adb_15_af_table{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor','red'); hold on;
for i = 1:adb_15_size
    name      = regexprep(adb_15_af_table{i,'id'},'_','-');
    text(1.02*adb_15_af_table{i,'ndtmax'},adb_15_af_table{i,'kMax'},upper(name));
end
xlabel('$(t/c)_{\mathrm{max}}$[--]')
ylabel('$k_{\mathrm{max}}$[--]');
grid on;
legend({'Geometric','DU','NACA','RISO','FFA','NREL','AH','15MW'},'Location','Best');



% %adb_15 = adb(adb_15_af1,:);
% adb_15  = adb(airfoils_15,:);
% n15     = size(adb_15,1);
% adb_15_af(1,:) = adb_15_af1;
% adb_15_af(2,:) = adb_15_af2;
% adb_15_af(3,:) = adb_15_af3;
% adb_15_af(4,:) = adb_15_af4;
% adb_15_af(5,:) = adb_15_af5;
% adb_15_af(6,:) = adb_15_af6;
% adb_15_af(7,:) = adb_15_af7;

%@snl_ffa_w3_500_iea15,@ffa_w3_360_iea15,@ffa_w3_330b_iea15,@ffa_w3_301_iea15,@ffa_w3_270b_iea15,@ffa_w3_241_iea15,@ffa_w3_211_iea15


% 
% tabla_airfoil_15    = table2struct(adb_15);
% id      = adb_15{:,'id'};
% plotAirfoil(tabla_airfoil_15,id,'alphaSpan',d2r*linspace(-5,30,31));
