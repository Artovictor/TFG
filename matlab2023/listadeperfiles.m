
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
xlabel('$(t/c)_{\mathrm{max}}$[--]')
ylabel('$k_{\mathrm{max}}$[--]');
grid on;
legend({'Geometric','DU','NACA','RISO','FFA','NREL','AH'},'Location','Best');