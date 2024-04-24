%%%%setWTToolBoxPath%%%%


close all

%% Entorno

wt_db = getWindTurbineDatabase;

wt_db.IECWindClass=="IB"; 


%% Blade, motherblade y nondimensionalblade 15MW

b = iea15MWBlade; 
% plotBlade(b,{'NDB_IEA-15'});
% plotAirfoil(b.layout.airfoili,{... 
% 'Cylinder',...
% 'SNL-FFA-W3-500',...
% 'FFA-W3-360',...
% 'FFA-W3-330b',...
% 'FFA-W3-301',...
% 'FFA-W3-270b',...
% 'FFA-W3-241',...
% 'FFA-W3-211',...
% });
ndb   = blade2ndBlade(b);
% plotNdBlade(ndb,{'IEA-15'});

ns   = length(b.r);
tb   = zeros(ns,1);
data = getIEA15MWBladeGeometryFromExcelFile;
for i = 1:ns
tb(i) = b.airfoil{i}.ndtmax*100;
end
% figure
% plot(data(:,1),data(:,8)); hold on;
% plot(data(:,1),tb); hold on;
% xlabel('$x$[--]');
% ylabel('$t/c$[--]');

id_af = strings(ns,1);
n_mb = zeros(length(b.layout.airfoili),1)';
for i = 1:ns
id_af{i} = b.airfoil{i}.id;
end
n_mb(1) = sum(id_af=="cylinder");
for i = 2:length(b.layout.airfoili)
        n_mb(i) = sum(id_af==func2str(b.layout.airfoili{i}));
end

mb = getMotherBlade(n_mb',b.layout.xi(1:length(n_mb))',b.layout.airfoili);
% plotMotherBlade(mb,{'MB_IEA15'});

% A continuación lo que hace la función iea15MWBlade:  
%%NO DESCOMENTAR%%
% R                 = 120;
% l_B               = 117;
% rH                = R - l_B;
% data              = getIEA15MWBladeGeometryFromExcelFile;
% r                 = rH + l_B*data(:,1);
% ns                = length(r);
% c                 = data(:,2);
% thetaG            = data(:,3);
% 
% y_pa              = c.*data(:,4);
% twistCenter       = [y_pa,zeros(ns,1)];
% 
% cd                = 0.35;
% p                 ={@()cylinder(cd),...
%                     @snl_ffa_w3_500_iea15,...
%                     @ffa_w3_360_iea15,...
%                     @ffa_w3_330b_iea15,...
%                     @ffa_w3_301_iea15,...
%                     @ffa_w3_270b_iea15,...
%                     @ffa_w3_241_iea15,...
%                     @ffa_w3_211_iea15,...
%                     };
% 
% x                 = r/R;
% tcLimits          = [0.98,0.4,0.34,0.31,0.28,0.26,0.211,0.19];
% tc                = data(:,8)/100;
% [airfoil,layout]  = tc2airfoilLayout(tc,x,tcLimits,p);
% 
% layout.ri = layout.xi.*R;
% 
% 
% blade = struct(...
%                'class','blade',...
%                'id','IEC15MW',...
%                'r',r,...
%                'twistCenter',twistCenter,...
%                'airfoil',{airfoil}, ...
%                'layout', layout,...
%                'c',c,...
%                'thetaG',thetaG...
%                );

%% Blade, motherblade y nondimensionalblade sin cilindro (15MWMod)

b_mod = iea15MWBladeMod; 
% plotBlade(b_mod,{'IEA-15Mod'});
% plotAirfoil(b_mod.layout.airfoili,{...
% 'SNL-FFA-W3-500',...
% 'FFA-W3-360',...
% 'FFA-W3-330b',...
% 'FFA-W3-301',...
% 'FFA-W3-270b',...
% 'FFA-W3-241',...
% 'FFA-W3-211',...
% });
ndb_mod   = blade2ndBlade(b_mod); 
% plotNdBlade(ndb_mod,{'NDB_IEA-15Mod'});

ns   = length(b_mod.r);
tb   = zeros(ns,1);
data = getIEA15MWBladeModGeometryFromExcelFile;
for i = 1:ns
tb(i) = b_mod.airfoil{i}.ndtmax*100;
end
% figure
% plot(data(:,1),data(:,8)); hold on;
% plot(data(:,1),tb); hold on;
% xlabel('$x$[--]');
% ylabel('$t/c$[--]');

id_af_mod = strings(ns,1);
n_mb_mod = zeros(length(b_mod.layout.airfoili),1)';
for i = 1:ns
id_af_mod{i} = b_mod.airfoil{i}.id;
end
for i = 1:length(b_mod.layout.airfoili)
        n_mb_mod(i) = sum(id_af_mod==func2str(b_mod.layout.airfoili{i}));
end

mb_mod = getMotherBlade(n_mb_mod',b_mod.layout.xi(1:length(n_mb_mod))',b_mod.layout.airfoili);
% plotMotherBlade(mb_mod,{'MB_IEA15Mod'});



% A continuación lo que hace la función iea15MWBladeMod:  
%%NO DESCOMENTAR%%
% R                 = 120;
% l_B               = 117;
% rH                = R - l_B;
% data              = getIEA15MWBladeModGeometryFromExcelFile;
% r                 = rH + l_B*data(:,1);
% ns                = length(r);
% c                 = data(:,2);
% thetaG            = data(:,3);
% 
% y_pa              = c.*data(:,4);
% twistCenter       = [y_pa,zeros(ns,1)];
% 
% p                 ={@snl_ffa_w3_500_iea15,...
%                     @ffa_w3_360_iea15,...
%                     @ffa_w3_330b_iea15,...
%                     @ffa_w3_301_iea15,...
%                     @ffa_w3_270b_iea15,...
%                     @ffa_w3_241_iea15,...
%                     @ffa_w3_211_iea15,...
%                     };
% x                 = r/R;
% tcLimits          = [0.4,0.34,0.31,0.28,0.26,0.211,0.19];
% tc                = data(:,8)/100;
% [airfoil,layout]  = tc2airfoilLayout(tc,x,tcLimits,p);
% layout.ri = layout.xi.*R;
% 
% blade = struct(...
%                'class','blade',...
%                'id','IEC15MWMod',...
%                'r',r,...
%                'twistCenter',twistCenter,...
%                'airfoil',{airfoil}, ...
%                'layout', layout,...
%                'c',c,...
%                'thetaG',thetaG...
%                );

%Tener en cuenta que a partir de ahora si sacamos un valor interno de la
%función, estaremos sacando el valor 15MWMod y no el 15MW base.

%% Optimización de la pala modificada

numberofblades = 3;
lambda0 = 8;
[ndOptBlade,lambda_opt,CPmax] = mb2cpmaxNdBlade(numberofblades,ndb_mod,lambda0);
% plotNdBlade(ndOptBlade,{'Optimum blade'});


d2r       = (pi/180);
l_i       = linspace(3,11,31);
t_i       = d2r*linspace(-15,25,31);
lt_0      = [lambda_opt,0];
ndBemMap  = getBemNdRotorMap(l_i,t_i,numberofblades,ndOptBlade,lt_0);

axds      = getaxds({'lambda'},{'$\lambda$[--]'},1);
ayds      = getaxds({'thetaC'},{'$\theta_C[^{\mathrm{o}}]$'},1/d2r);
CPvar     = getaxds({'CP'},{'$C_P$[--]'},1);

plotNdBemGBS(ndBemMap,axds,ayds,...
             'defaultVars',CPvar,...
             'labels','on',...
             'ContourLevelList',[0,0.1,0.2,0.3,0.4,0.5]);

figure(1)
hold on;
plot(ndBemMap.lambdaCPmax,ndBemMap.thetaCCPmax/d2r,'r *')

%Con esto checkeamos que converge.  El nonconvergedstatesratio tiene que
%ser próximo a 0

[io,info]  = isbemconverged(ndBemMap)

%Con esto representamos los que no convergen (los asteriscos de la gráfica):


%%%%%%%%%%%%%%%%%PROBLEMO AQUI
sub_lt = info.nonConvergedStatesSUB(:,2:3);
lk_nc  = ndBemMap.lambda(sub_lt(:,1),1);
tk_nc  = ndBemMap.thetaC(1,sub_lt(:,2))';

figure(1)
hold on;
plot(lk_nc,tk_nc/d2r,'b *'); hold on;

%Usamos otros parámetros de operación para comparar.mb2cpmaxNdBlade nos ha
%dado la que más coeficiente de energía produce para nuestro lambda 8 og.

nl             = 11;
lambda_i       = linspace(6,11,nl)';
thetaC_i       = zeros(nl,1);


ndb            = cell(nl,1);
ndbs           = cell(nl,1);
for i = 1:nl
    ndb{i}       = mb2optimumNdBlade(mb_mod,lambda_i(i),numberofblades);
    ndbs{i}      = getBemNdBladeState(numberofblades,ndb{i},lambda_i(i),thetaC_i(i));
end

lxds = getaxds({'lambda'},{'$\lambda$[--]'},1);
axg = plotNdBemGBS(ndbs,lxds,{'$\theta_C = 0$[$^o$]'},'defaultVars',CPvar);
hold on;
plot(axg{1},lambda_opt,CPmax,'r *')

stropt = strcat('Optimum blade $\lambda$=',num2str(lambda_opt,'%2.1f'),' [--]');

figure(5)
plot(ndb{1}.x,ndb{1}.ndc,'b--'); hold on;
plot(ndOptBlade.x,ndOptBlade.ndc,'r-'); hold on;
plot(ndb{11}.x,ndb{11}.ndc,'m-.'); hold on;
xlabel('$x$[--]'); ylabel('$c/R$[--]');
legend({'Optimum blade $\lambda$=6 [--]',...
       stropt,...
       'Optimum blade $\lambda$=11 [--]'},'Location','Best')

figure(6)
plot(ndb{1}.x,ndb{1}.thetaG/d2r,'b--'); hold on;
plot(ndOptBlade.x,ndOptBlade.thetaG/d2r,'r-'); hold on;
plot(ndb{11}.x,ndb{11}.thetaG/d2r,'m-.'); hold on;
xlabel('$x$[--]'); ylabel('$\theta_G[^\mathrm{o}]$');
legend({'Optimum blade $\lambda$=6 [--]',...
       stropt,...
       'Optimum blade $\lambda$=11 [--]'},'Location','Best')