%%Motherblade definition
close all
clear;
clc;
d2r = pi/180;
setPlot;



mb  = getMotherBlade([10 10 10 10 10],...
                      [0.1 0.4 0.5 0.6 0.75],...
                      {@du40,@ffa_w3_301_dtu10,@ah93w257,@du21_A17,@naca64_A17},...
                      'ftype',{@cosine,@linspace,@linspace,@linspace,@sine});

%plotMotherBlade(mb,'MB',...
 %               'plotSketch','yes',...
  %              'views',{[30,45]});

b       = 3;
lambda0 = 8;
[ndOptBlade,lambda_opt,CPmax] = mb2cpmaxNdBlade(b,mb,lambda0);


CPvar     = getaxds({'CP'},{'$C_P$[--]'},1);




nl             = 11;
lambda_i       = linspace(6,11,nl)';
thetaC_i       = zeros(nl,1);


ndb            = cell(nl,1);
ndbs           = cell(nl,1);
for i = 1:nl
    ndb{i}       = mb2optimumNdBlade(mb,lambda_i(i),b);
    ndbs{i}      = getBemNdBladeState(b,ndb{i},lambda_i(i),thetaC_i(i));
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