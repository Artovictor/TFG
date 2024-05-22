function airfoil = ffa_w3_301_iea15
%ffa_w3_301_iea15  Gets airfoil structure of FFA-W3-301 according to [1]
%
%   A = ffa_w3_301_iea15 gets the structure of the FFA-W3-301 airfoil 
%   using data presented at reference [1].
%
%   The Reynolds number of the aerodynamic coefficients is 1e7. 
%
%   The aerodynamic data of the airfoil FFA-W3-301 has been obtained from 
%   the IEA 10MW reference wind turbine as defined by [1]
%
%   The geometry of the airfoil FFA-W3-301 has been obtained from the IEA
%   10MW reference wind turbine as defined by [1]
% 
%   Example of usage
%   p = ffa_w3_301_iea15;
%   plotAirfoil(p,{'FFA-W3-301'});
%   plotAirfoil(p,{'FFA-W3-301'},'alphaSpan',linspace(-6,12,360)*pi/180);
%
%   See also airfoil2d, plotAirfoil, getKmaxAirfoil2d, isAirfoil
%
%   TODO LIST
%
%% References 
%
%  [1] IEA-15-240-RWT_tabular.xlsx excel file. 
%      From https://github.com/IEAWindTask37/IEA-15-240-RWT/tree/master/Documentation
%      Last accessed February 2024
%
%
%
[cl,cd,cm,...
 cl_data,cd_data,cm_data] = getffa_w3_301_iea15AeroData;
% a = ffa_w3_301_iea15;
% [AoAopt,clOpt,cdOpt,kMax]  = getKmaxAirfoil2d(a.cl,a.cd,5*pi/180);
% format long 
% AoAopt,clOpt,kMax
% plotAirfoil(a,{'FFA-W3-301'},'alphaSpan',linspace(-10,40,360)*pi/180);
% figure(1)
% plot(180/pi*AoAopt,clOpt,'r o');
% figure(2)
% plot(180/pi*AoAopt,cdOpt,'r o');
% figure(3)
% plot(180/pi*AoAopt,kMax,'r o');

% Get airfoil geometry function handles
[us,ls]       = getFFAW3_301geom;
 
% Get optimum values for aerodynamic maximum efficiency 
alphaOp = 0.174532925199433;
clOp    = 1.642080001183803;
kmax    = 1.031502641201071e+02;
cdOp    = clOp/kmax;

% Get AoA interval for linear lift coefficient. This parameter was obtained
% by visual inspection of the figure resulting from the following code 
% snippet 
% 
% d2r            = pi/180;
% alphaspan      = linspace(-60,60,101)'.*d2r;
% airfoil        = @ffa_w3_301_iea15;
% alpha_s        = NaN;
% dsa            = getStallAirfoil(alphaspan,airfoil,alpha_s);
% plotStallAirfoil(dsa,alphaspan)

alpha_linear   = [-10 4]*pi/180;

% Define output structure
airfoil = struct(...
          'class','airfoil',...
          'familyName',"FFA",...
          'id','ffa_w3_301_iea15',...
          'ac',[0,0],...
          'ndtmax',0.301,...
          'alpha_linear',alpha_linear,...
          'alphaOpt',alphaOp,...
          'clOpt',clOp,...
          'cdOpt',cdOp,...
          'kMax',kmax,...
          'cldata',cl_data,...
          'cddata',cd_data,...
          'cmdata',cm_data,...
          'cl',cl,...
          'cd',cd,...
          'cm',cm,...
          'us',us,...
          'ls',ls...
);


end

function [cl,cd,cm,cl_data,cd_data,cm_data] = getffa_w3_301_iea15AeroData
%
% The next below data come from reference [1]
%
%% References 
%
%  [1] IEA-15-240-RWT_tabular.xlsx excel file. 
%      From https://github.com/IEAWindTask37/IEA-15-240-RWT/tree/master/Documentation
%      Last accessed February 2024
%

data = [...
-3.14	0	0.024539894130771	0
-3.101699414	0.065082	0.025141266966556	0.091428571428571
-3.061806173	0.130164	0.026941480054232	0.182857142857143
-3.021912933	0.195246	0.029928804391185	0.274285714285714
-2.98202	0.260328	0.034083781329464	0.365714285714286
-2.94213	0.32541	0.039379343319637	0.400847948448331
-2.902233213	0.390492	0.059102849881554	0.402204665965661
-2.862339973	0.455574	0.084949395477541	0.403561383482991
-2.82245	0.520656	0.114325143494607	0.404918101000321
-2.78255	0.585738	0.147043997066873	0.410104381457541
-2.74266	0.65082	0.182898692436134	0.42677935073443
-2.70277	0.715902	0.221662116220501	0.443454320011319
-2.662873773	0.780984	0.263088748813791	0.460129289288208
-2.622980533	0.846066	0.306916224734577	0.476804258565098
-2.583087293	0.911148	0.352867	0.471619354838378
-2.510780795	0.842569463951669	0.440614593789023	0.456561571145265
-2.438474298	0.781867005543737	0.532551726118952	0.442024532368336
-2.3661678	0.724484309840239	0.62676913332649	0.434517549959889
-2.293861303	0.667547427011095	0.721310844544451	0.427010567551441
-2.221554805	0.609281551992159	0.814214958254182	0.424825860778713
-2.149248307	0.548679896682451	0.903554538261091	0.425442351708994
-2.07694181	0.485302956907604	0.987477775650746	0.426341502984693
-2.004635312	0.419148513757273	1.06424657862802	0.428129015345989
-1.932328815	0.35056141049687	1.1322727849815	0.429916527707285
-1.860022317	0.280166319163829	1.19015124156423	0.42916314290944
-1.78771582	0.208814113497374	1.23668906060309	0.427880404536773
-1.715409322	0.137536529042602	1.27093044247705	0.424439224298427
-1.643102824	0.067506128659471	1.29217654717262	0.417940251417034
-1.570796327	5.55111512312578E-17	1.3	0.41144127853564
-1.498489829	-0.06750612865947	1.29217654717262	0.398038884499911
-1.426183332	-0.137536529042602	1.27093044247705	0.384636490464182
-1.353876834	-0.208814113497374	1.23668906060309	0.368920772208982
-1.281570336	-0.280166319163828	1.19015124156423	0.351572119210627
-1.209263839	-0.35056141049687	1.1322727849815	0.333909388721252
-1.136957341	-0.419148513757273	1.06424657862802	0.314739086274988
-1.064650844	-0.485302956907604	0.987477775650746	0.295568783828725
-0.992344346	-0.548679896682451	0.903554538261092	0.276533337733309
-0.920037849	-0.609281551992159	0.814214958254182	0.2575408004768
-0.847731351	-0.667547427011095	0.721310844544451	0.238731675588984
-0.775424853	-0.724484309840239	0.62676913332649	0.220271034201684
-0.703118356	-0.781867005543737	0.532551726118952	0.201810392814385
-0.630811858	-0.842569463951669	0.440614593789023	0.136441248372189
-0.558505361	-0.911148	0.352867	0.0675974
-0.488692191	-1.103486	0.217209	0.0423056
-0.41887902	-1.107375	0.156289	0.0202552
-0.34906585	-1.118153	0.10335	0.00406595
-0.314159265	-1.123325	0.0818035	0.0001727
-0.27925268	-1.118652	0.0633072	-0.00166925
-0.244346095	-1.1162	0.0471828	-0.00119555
-0.20943951	-1.095881	0.032802	-0.00463405
-0.174532925	-0.917674	0.0235149	-0.02493615
-0.13962634	-0.69311	0.017929	-0.04303885
-0.104719755	-0.453961	0.0143063	-0.0586752
-0.06981317	-0.177791	0.0124233	-0.0760125
-0.034906585	0.1047965	0.01159539	-0.0912123
-0.017453293	0.243828	0.01143042	-0.0976331
0	0.381107	0.01138052	-0.1034111
0.017453293	0.516603	0.0114316	-0.1086068
0.034906585	0.650441	0.0115641	-0.113328
0.052359878	0.782666	0.0117667	-0.117621
0.06981317	0.913264	0.0120419	-0.121539
0.087266463	1.042074	0.0123928	-0.125103
0.104719755	1.16873	0.0128344	-0.128279
0.122173048	1.29296	0.0133791	-0.131041
0.13962634	1.4139	0.0140591	-0.133322
0.157079633	1.53088	0.0148823	-0.135032
0.174532925	1.64208	0.0159193	-0.135991
0.191986218	1.74568	0.0172569	-0.136052
0.20943951	1.83887	0.0190791	-0.135138
0.226892803	1.91764	0.0216874	-0.133217
0.244346095	1.97413	0.0257196	-0.1302
0.261799388	1.99916	0.0322202	-0.126409
0.27925268	1.99377	0.0415688	-0.122652
0.314159265	1.9172	0.067308	-0.116751
0.34906585	1.73683	0.1052596	-0.116518
0.41887902	1.47321	0.192293	-0.1379
0.488692191	1.36017	0.274492	-0.162419
0.558505361	1.30164	0.352867	-0.184634
0.630811858	1.2036706627881	0.440614593789023	-0.208938504775145
0.703118356	1.11695286506248	0.532551726118952	-0.232763315699392
0.775424853	1.03497758548606	0.62676913332649	-0.250112259636511
0.847731351	0.953639181444421	0.721310844544451	-0.26746120357363
0.920037849	0.870402217131656	0.814214958254182	-0.28365214013009
0.992344346	0.783828423832073	0.903554538261092	-0.299233599117782
1.064650844	0.693289938439434	0.987477775650746	-0.3147151510782
1.136957341	0.598783591081818	1.06424657862802	-0.32988270952433
1.209263839	0.500802014995529	1.1322727849815	-0.345050267970459
1.281570336	0.400237598805469	1.19015124156423	-0.359424175541027
1.353876834	0.298305876424819	1.23668906060309	-0.373632739179186
1.426183332	0.196480755775146	1.27093044247705	-0.387015505407399
1.498489829	0.096437326656386	1.29217654717262	-0.399228391971519
1.570796327	8.32667268468867E-17	1.3	-0.41144127853564
1.643102824	-0.06750612865947	1.29217654717262	-0.417940251417034
1.715409322	-0.137536529042602	1.27093044247705	-0.424439224298427
1.78771582	-0.208814113497374	1.23668906060309	-0.427880404536773
1.860022317	-0.280166319163828	1.19015124156423	-0.42916314290944
1.932328815	-0.35056141049687	1.1322727849815	-0.429916527707285
2.004635312	-0.419148513757273	1.06424657862802	-0.428129015345989
2.07694181	-0.485302956907604	0.987477775650746	-0.426341502984693
2.149248307	-0.548679896682451	0.903554538261093	-0.425442351708994
2.221554805	-0.609281551992159	0.814214958254182	-0.424825860778713
2.293861303	-0.667547427011095	0.721310844544451	-0.427010567551441
2.3661678	-0.724484309840239	0.62676913332649	-0.434517549959889
2.438474298	-0.781867005543737	0.532551726118952	-0.442024532368336
2.510780795	-0.842569463951669	0.440614593789023	-0.456561571145265
2.583087293	-0.911148	0.352867	-0.471619354838378
2.622980533	-0.846066	0.306916224734577	-0.476804258565098
2.662873773	-0.780984	0.263088748813791	-0.460129289288208
2.702767013	-0.715902	0.221662116220501	-0.443454320011319
2.742660253	-0.65082	0.182898692436134	-0.42677935073443
2.782553493	-0.585738	0.147043997066873	-0.410104381457541
2.822446733	-0.520656	0.114325143494607	-0.422060958143178
2.862339973	-0.455574	0.084949395477541	-0.443561383482991
2.902233213	-0.390492	0.059102849881554	-0.465061808822804
2.942126453	-0.32541	0.039379343319637	-0.486562234162617
2.982019693	-0.260328	0.034083781329464	-0.457142857142857
3.021912933	-0.195246	0.029928804391185	-0.342857142857143
3.061806173	-0.130164	0.026941480054232	-0.228571428571429
3.101699414	-0.065082	0.025141266966556	-0.114285714285714
3.14	0	0.024539894130771	0
];    

alpha_i   = data(:,1);
cl_i      = data(:,2);
cd_i      = data(:,3);
cm_i      = data(:,4);
cl        = @(alpha)interp1(alpha_i,cl_i,alpha);
cd        = @(alpha)interp1(alpha_i,cd_i,alpha);
cm        = @(alpha)interp1(alpha_i,cm_i,alpha);

cl_data   = [alpha_i,cl_i];
cd_data   = [alpha_i,cd_i];
cm_data   = [alpha_i,cm_i];

end

function [us,ls] = getFFAW3_301geom
%
% The next below data come from reference [1]
%
%% References 
%
%  [1] IEA-15-240-RWT_tabular.xlsx excel file. 
%      From https://github.com/IEAWindTask37/IEA-15-240-RWT/tree/master/Documentation
%      Last accessed February 2024
%
data_ls = [
0	0
7.807E-05	-0.00098225
0.00029009	-0.0038427
0.00059937	-0.00790888
0.00096448	-0.01119444
0.00146264	-0.01395867
0.00219661	-0.01702693
0.00309879	-0.01986336
0.00409516	-0.02277707
0.00526774	-0.02585365
0.00665839	-0.02902721
0.00821941	-0.03225419
0.00993095	-0.0354754
0.01187982	-0.03879837
0.01404463	-0.04222416
0.01639219	-0.0456621
0.01898469	-0.04918739
0.02182867	-0.05281184
0.02489252	-0.056457
0.02822001	-0.06018234
0.03182924	-0.06397734
0.03568998	-0.06781374
0.03984236	-0.07171229
0.04430035	-0.07567108
0.04903788	-0.07964775
0.05410025	-0.0836589
0.05948747	-0.08769058
0.06518787	-0.09172845
0.07124791	-0.09577523
0.07764648	-0.0998001
0.08439704	-0.10380363
0.0915234	-0.10776788
0.09900711	-0.11166856
0.10688721	-0.1155089
0.11514762	-0.11924991
0.12380644	-0.12288261
0.13287211	-0.12639744
0.14233176	-0.12975871
0.1522146	-0.13295904
0.16249918	-0.13598144
0.17321393	-0.13880129
0.18434125	-0.14139247
0.19590296	-0.14375103
0.20788328	-0.14585175
0.22029378	-0.14767899
0.23312344	-0.14921756
0.24637487	-0.15044292
0.26004146	-0.15133677
0.27412439	-0.15189867
0.28861129	-0.15207861
0.30349962	-0.15188281
0.3187741	-0.15127833
0.33443448	-0.15026529
0.35045732	-0.14880776
0.36684322	-0.14689814
0.38356093	-0.14451131
0.40060975	-0.14165209
0.41795607	-0.13829471
0.4355933	-0.13444104
0.4534925	-0.13009554
0.47163211	-0.12525581
0.48999236	-0.11992601
0.50853595	-0.11413531
0.52724867	-0.10791833
0.5460886	-0.10131971
0.5650309	-0.09437959
0.58404504	-0.08717996
0.603088	-0.07979531
0.62213765	-0.0723041
0.64114752	-0.0648181
0.66008031	-0.05743322
0.67890619	-0.05023546
0.69757164	-0.04333091
0.71604492	-0.03680342
0.73429135	-0.03071971
0.75225234	-0.02512324
0.76989792	-0.02004647
0.78719153	-0.01555998
0.80407383	-0.01170028
0.82051349	-0.00840864
0.83646946	-0.00567019
0.85189026	-0.00346747
0.86674791	-0.00177337
0.8810097	-0.00057044
0.89461041	0.00016442
0.90752456	0.00045227
0.9197304	0.00040686
0.9311753	4.808E-05
0.94182765	-0.00057005
0.95167536	-0.00142772
0.96067486	-0.00241285
0.96878747	-0.00346998
0.97601191	-0.00454941
0.98233053	-0.00560222
0.98768615	-0.00657537
0.99208631	-0.00743116
0.99557391	-0.00814595
0.99806302	-0.00867599
0.99942968	-0.0089741
1	-0.0091
];  

data_us = [...
1	0.0091
0.99944304	0.0092
0.99812049	0.0095
0.99569352	0.01019102
0.99230484	0.01098722
0.98802844	0.01199275
0.98281508	0.01321968
0.97666422	0.01466868
0.96964069	0.01632499
0.96174313	0.01818939
0.95297315	0.02026184
0.94338928	0.0225287
0.93301284	0.02498942
0.92185147	0.02765633
0.90995468	0.03053579
0.89736121	0.03361281
0.88408503	0.03688185
0.8701629	0.04032843
0.85565276	0.04394211
0.84057695	0.04771939
0.82497463	0.05163426
0.80889455	0.05568122
0.79236237	0.0598265
0.77542101	0.064066
0.75812546	0.06838366
0.7405018	0.07275679
0.72259209	0.07716884
0.70444539	0.08159288
0.68608843	0.0859995
0.66757021	0.09039339
0.64892678	0.09473603
0.63018643	0.09901837
0.61140138	0.10322855
0.59259673	0.10734222
0.57380843	0.11135197
0.5550757	0.11523528
0.53641763	0.11897139
0.51787958	0.12256454
0.49948103	0.1259975
0.48125155	0.12923028
0.46322225	0.1322622
0.44540666	0.13505874
0.42784323	0.13762622
0.41053864	0.13995045
0.39352525	0.14202895
0.37681123	0.14383082
0.36041977	0.14537434
0.34436494	0.14664124
0.32865846	0.14762855
0.31331898	0.14834512
0.29834798	0.1487826
0.2837658	0.14891816
0.26956679	0.14878205
0.25577362	0.14835062
0.2423778	0.14763902
0.22939648	0.14665631
0.21681735	0.14540796
0.20465763	0.14389445
0.19290757	0.14211807
0.18157496	0.14009933
0.17065819	0.13784051
0.16014896	0.13536035
0.15005511	0.13267642
0.14035465	0.12980554
0.1310675	0.12676333
0.12216148	0.12356534
0.11365876	0.12022661
0.10553619	0.11677002
0.09779065	0.11319471
0.09042902	0.10953142
0.08341621	0.10578776
0.07677403	0.1019807
0.0704692	0.09812104
0.06450016	0.09422341
0.05888182	0.09031596
0.05356799	0.08637472
0.04857581	0.0824277
0.04389793	0.07849466
0.03949498	0.07455546
0.03539484	0.07065466
0.03157626	0.06678259
0.02800644	0.06292689
0.02471592	0.05912309
0.02168071	0.05536396
0.01886319	0.05161464
0.01629514	0.0479351
0.0139662	0.04434298
0.01181764	0.04073649
0.00988361	0.03723028
0.00818368	0.03384709
0.00663128	0.03041742
0.00524853	0.02707923
0.00408271	0.02385868
0.00308998	0.02069172
0.00219098	0.01762608
0.00145967	0.01440222
0.00096333	0.01148451
0.00059878	0.0081594
0.00028988	0.00393427
7.804E-05	0.0009904
0   0
];


ndy_ls      = 0.25 - data_ls(:,1);
ndy_us      = 0.25 - data_us(:,1);
ndz_ls      = data_ls(:,2);
ndz_us      = data_us(:,2);

ls          = @(ndy)interp1(ndy_ls,ndz_ls,ndy);
us          = @(ndy)interp1(ndy_us,ndz_us,ndy);

end

