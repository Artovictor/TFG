%%%%setWTToolBoxPath%%%%

wt_db = getWindTurbineDatabase; %%donde esta la IEA

%entorno tipo 1B (sin poner)
%wt_db.IECWindClass=="IB" |

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

%mb_IEA15  = getMotherBlade([10 10 10 10 10 10 10],...
 %                     [0.15 0.245170317 0.328843951 0.439179346 0.537671407 0.638207657 0.771743852],...
  %                    {@snl_ffa_w3_500_iea15,@ffa_w3_360_iea15,@ffa_w3_330b_iea15,@ffa_w3_301_iea15,@ffa_w3_270b_iea15,@ffa_w3_241_iea15,@ffa_w3_211_iea15},...
   %                   'ftype',{@cosine,@linspace,@linspace,@linspace,@linspace,@linspace,@sine}...
    %                  );


%N = [10 10 10 10 10 10 10];
%xi = [0.15 0.245170317 0.328843951 0.439179346 0.537671407 0.638207657 0.771743852];
%data = getIEA15MWBladeGeometryFromExcelFile;
%xi = data(:,1)';
%p                 ={@()cylinder(cd),...
 %                   @snl_ffa_w3_500_iea15,...
  %                  @ffa_w3_360_iea15,...
   %                 @ffa_w3_330b_iea15,...
    %                @ffa_w3_301_iea15,...
     %               @ffa_w3_270b_iea15,...
      %              @ffa_w3_241_iea15,...
       %             @ffa_w3_211_iea15,...
        %            };
%mb_IEA15 = getMotherBlade(N,xi,p);

%plotMotherBlade(mb_IEA15,{'Mother blade'},'views',{[30 25]});

%plotMotherBlade(mb_IEA15,'MB$_IEA15$',...
  %              'plotSketch','yes',...
   %             'views',{[30,45]});



mb = iea15MWBlade; 
plotBlade(mb,{'IEA-15'});
plotAirfoil(mb.layout.airfoili,{...
'Cylinder',...
'SNL-FFA-W3-500',...
'FFA-W3-360',...
'FFA-W3-330b',...
'FFA-W3-301',...
'FFA-W3-270b',...
'FFA-W3-241',...
'FFA-W3-211',...
});
ndb   = blade2ndBlade(mb);
plotNdBlade(ndb,{'IEA-15'});

%%la ndb

b       = 3;
lambda0 = 8;
%[ndOptBlade,lambda_opt,CPmax] = mb2cpmaxNdBlade(b,mb,lambda0);

ndc    = linspace(0.20 , 0.05 , length(N) );
%{@cosine,@linspace,@linspace,@linspace,@linspace,@linspace,@sine}
thetaG = zeros(1,length(N));

%ndB_IEA15 = getNdBlade (N, ndc, thetaG, xi, p);

%figure

%plot( ndB_IEA15.x , ndB_IEA15.ndc , 'O-')
%axis([0,1,0,0.22])
%grid on
%xlabel('$x$[-]')
%ylabel('$c/R$[-]')
%legend({'ndB'})
%set(gcf , 'Position', [100,100,700,250])

%plotNdBlade(ndB_IEA15,'Non-dimensional blade','views',{[30 25]});

%grid on
        