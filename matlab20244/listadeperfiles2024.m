
adb = getAirfoilDatabase;

airfoils_15 = adb.familyName =="FFA";
adb_15_7af = zeros(7,18);
adb_15_af1 = adb.id == "snl_ffa_w3_500_iea15";
adb_15_af2 = adb.id == "ffa_w3_360_iea15";
adb_15_af3 = adb.id == "ffa_w3_330b_iea15";
adb_15_af4 = adb.id == "ffa_w3_301_iea15";
adb_15_af5 = adb.id == "ffa_w3_270b_iea15";
adb_15_af6 = adb.id == "ffa_w3_241_iea15";
adb_15_af7 = adb.id == "ffa_w3_211_iea15";
%adb_15 = adb(adb_15_af1,:);
adb_15  = adb(airfoils_15,:);
n15     = size(adb_15,1);

%@snl_ffa_w3_500_iea15,@ffa_w3_360_iea15,@ffa_w3_330b_iea15,@ffa_w3_301_iea15,@ffa_w3_270b_iea15,@ffa_w3_241_iea15,@ffa_w3_211_iea15

colors   = lines(7);
figure(2)
%plot(adb_geom{:,'ndtmax'},adb_geom{:,'kMax'},'o',...
 %   'MarkerSize',5,'MarkerFaceColor',colors(1,:)); hold on;
%for i = 1:ngeom
  %  name      = regexprep(adb_geom{i,'id'},'_','-');
   % text(1.02*adb_geom{i,'ndtmax'},adb_geom{i,'kMax'},upper(name));
%end
plot(adb_15{:,'ndtmax'},adb_15{:,'kMax'},'o',...
    'MarkerSize',5,'MarkerFaceColor',colors(2,:)); hold on;
for i = 1:n15
    name      = regexprep(adb_15{i,'id'},'_','-');
    text(1.02*adb_15{i,'ndtmax'},adb_15{i,'kMax'},upper(name));
end


tabla_airfoil_15    = table2struct(adb_15);
id      = adb_15{:,'id'};
plotAirfoil(tabla_airfoil_15,id,'alphaSpan',d2r*linspace(-5,30,31));



xlabel('$(t/c)_{\mathrm{max}}$[--]')
ylabel('$k_{\mathrm{max}}$[--]');
grid on;
legend({'15'},'Location','Best');