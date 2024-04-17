%%%%setWTToolBoxPath%%%%

wt_db = getWindTurbineDatabase; %%donde esta la IEA

%entorno tipo 1B (sin poner)


close all
%setPlot;



zRef       = 90;
URef       = 10;
sigma_u    = 2;
zmin       = 5;
alpha      = 0.2;
fU         = @(z) powerWindShear(z,URef,zRef,alpha,zmin);
I_u        = @(z) sigma_u./fU(z);
L_u        = @(z) 120*ones(size(z));

site_U     = getSite(URef,zRef,I_u,L_u);

%plotSite(site_U,[]);

%%la mb

mb_IEA15  = getMotherBlade([10 10 10 10 10 10 10],...
                      [0.15 0.245170317 0.328843951 0.439179346 0.537671407 0.638207657 0.771743852],...
                      {@snl_ffa_w3_500_iea15,@ffa_w3_360_iea15,@ffa_w3_330b_iea15,@ffa_w3_301_iea15,@ffa_w3_270b_iea15,@ffa_w3_241_iea15,@ffa_w3_211_iea15},...
                      'ftype',{@cosine,@linspace,@linspace,@linspace,@linspace,@linspace,@sine}...
                      );
plotMotherBlade(mb_IEA15,'MB$_IEA15$',...
                'plotSketch','yes',...
                'views',{[30,45]});

%%la ndb

b       = 3;
lambda0 = 8;
[ndOptBlade,lambda_opt,CPmax] = mb2cpmaxNdBlade(b,mb,lambda0);

