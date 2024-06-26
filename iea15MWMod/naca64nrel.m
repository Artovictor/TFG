function airfoil = naca64nrel
%NACA64NREL  Gets airfoil structure of NACA64
%
% Aerodynamic coefficients data from figure 3-6 of reference [1]
% References
% Geometry according to [2] it comes from NACA64-618
%% References
%
% [1] J. Jonkman, S. Butterfield, W. Musial, and G. Scott. Definition 
% of a 5-MW Reference Wind Turbine for Offshore System Development. 
% NREL-TP-500-38060. February 2009.
% [2] Kooijman, H. J. T., Lindenburg, C., Winkelaar, D., and van der Hooft, 
% E. L. DOWEC 6 MW Pre-Design: Aero-elastic modeling of the DOWEC 6 MW 
% pre-design in PHATAS" DOWEC Dutch Offshore Wind Energy Converter 
% 1997?2003 DOWEC   10046_009,   ECN-CX--01-135,   Petten,   
% the   Netherlands:   Energy   Research   Center of the Netherlands, 
% September 2003.
% [3] https://m-selig.ae.illinois.edu/ads/coord/naca643618.dat
%
%% File history
%
% Function originally written by Armais Chavez and Victor Ruiz @2015
% Geometry corrected by Oscar @2019 using the actual geometry according 
% to [3]
% 

% Get naca64 aerodynamic function handles
[cl,cd,cm]  = getnaca64nrelAd;

% Get naca64  geometry function handles
[ls,us]     = getnaca64nrelGeometry;

%% TO BE FIXED
% Get AoA interval for linear lift coefficient. This parameter was obtained
% by visual inspection of the figure resulting from the following code 
% snippet 
%
% d2r            = pi/180;
% alphaspan      = linspace(-40,40,301)'.*d2r;
% airfoil        = @du21_A17;
% alpha_s        = NaN;
% dsa            = getStallAirfoil(alphaspan,airfoil,alpha_s);
% plotStallAirfoil(dsa,alphaspan)

alpha_linear   = NaN;

% Get optimum values for aerodynamic maximum efficiency 
alphaOp     = 10*(pi/180);
clOp        = 1.3997;
kmax        = 88.5886;
cdOp        = 0.0158;


airfoil = struct(...
          'class','airfoil',...
          'familyName',"NACA",...
          'id','naca64nrel',...
          'ac',[0,0],...
          'ndtmax',0.18,...
          'alpha_linear',alpha_linear,...
          'alphaOpt',alphaOp,...
          'clOpt',clOp,...
          'cdOpt',cdOp,...
          'kMax',kmax,...
          'cldata',missing,...
          'cddata',missing,...
          'cmdata',missing,...          
          'cl',cl,...
          'cd',cd,...
          'cm',cm,...
          'us',us,...
          'ls',ls...
);

end


function [cl,cd,cm]  = getnaca64nrelAd


alpha_i=[-180
  -179
  -178
  -177
  -176
  -175
  -174
  -173
  -172
  -171
  -170
  -169
  -168
  -167
  -166
  -165
  -164
  -163
  -162
  -161
  -160
  -159
  -158
  -157
  -156
  -155
  -154
  -153
  -152
  -151
  -150
  -149
  -148
  -147
  -146
  -145
  -144
  -143
  -142
  -141
  -140
  -139
  -138
  -137
  -136
  -135
  -134
  -133
  -132
  -131
  -130
  -129
  -128
  -127
  -126
  -125
  -124
  -123
  -122
  -121
  -120
  -119
  -118
  -117
  -116
  -115
  -114
  -113
  -112
  -111
  -110
  -109
  -108
  -107
  -106
  -105
  -104
  -103
  -102
  -101
  -100
   -99
   -98
   -97
   -96
   -95
   -94
   -93
   -92
   -91
   -90
   -89
   -88
   -87
   -86
   -85
   -84
   -83
   -82
   -81
   -80
   -79
   -78
   -77
   -76
   -75
   -74
   -73
   -72
   -71
   -70
   -69
   -68
   -67
   -66
   -65
   -64
   -63
   -62
   -61
   -60
   -59
   -58
   -57
   -56
   -55
   -54
   -53
   -52
   -51
   -50
   -49
   -48
   -47
   -46
   -45
   -44
   -43
   -42
   -41
   -40
   -39
   -38
   -37
   -36
   -35
   -34
   -33
   -32
   -31
   -30
   -29
   -28
   -27
   -26
   -25
   -24
   -23
   -22
   -21
   -20
   -19
   -18
   -17
   -16
   -15
   -14
   -13
   -12
   -11
   -10
    -9
    -8
    -7
    -6
    -5
    -4
    -3
    -2
    -1
     0
     1
     2
     3
     4
     5
     6
     7
     8
     9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29
    30
    31
    32
    33
    34
    35
    36
    37
    38
    39
    40
    41
    42
    43
    44
    45
    46
    47
    48
    49
    50
    51
    52
    53
    54
    55
    56
    57
    58
    59
    60
    61
    62
    63
    64
    65
    66
    67
    68
    69
    70
    71
    72
    73
    74
    75
    76
    77
    78
    79
    80
    81
    82
    83
    84
    85
    86
    87
    88
    89
    90
    91
    92
    93
    94
    95
    96
    97
    98
    99
   100
   101
   102
   103
   104
   105
   106
   107
   108
   109
   110
   111
   112
   113
   114
   115
   116
   117
   118
   119
   120
   121
   122
   123
   124
   125
   126
   127
   128
   129
   130
   131
   132
   133
   134
   135
   136
   137
   138
   139
   140
   141
   142
   143
   144
   145
   146
   147
   148
   149
   150
   151
   152
   153
   154
   155
   156
   157
   158
   159
   160
   161
   162
   163
   164
   165
   166
   167
   168
   169
   170
   171
   172
   173
   174
   175
   176
   177
   178
   179
   180]*(pi/180);

clCoeff=[0.0544
    0.1305
    0.2065
    0.2826
    0.3599
    0.4403
    0.5206
    0.6024
    0.6956
    0.7352
    0.7262
    0.7171
    0.7081
    0.6991
    0.6901
    0.6790
    0.6666
    0.6542
    0.6418
    0.6381
    0.6549
    0.6717
    0.6885
    0.7053
    0.7196
    0.7311
    0.7425
    0.7540
    0.7655
    0.7769
    0.7831
    0.7855
    0.7878
    0.7902
    0.7925
    0.7949
    0.7929
    0.7888
    0.7847
    0.7806
    0.7766
    0.7725
    0.7671
    0.7572
    0.7473
    0.7374
    0.7274
    0.7175
    0.7076
    0.6977
    0.6874
    0.6750
    0.6626
    0.6502
    0.6378
    0.6254
    0.6130
    0.6006
    0.5846
    0.5663
    0.5480
    0.5297
    0.5114
    0.4931
    0.4748
    0.4565
    0.4382
    0.4199
    0.4004
    0.3790
    0.3575
    0.3361
    0.3146
    0.2932
    0.2717
    0.2503
    0.2288
    0.2074
    0.1859
    0.1644
    0.1403
    0.1136
    0.0868
    0.0601
    0.0334
    0.0066
   -0.0201
   -0.0447
   -0.0669
   -0.0891
   -0.1114
   -0.1336
   -0.1558
   -0.1780
   -0.2003
   -0.2225
   -0.2447
   -0.2665
   -0.2870
   -0.3076
   -0.3281
   -0.3486
   -0.3691
   -0.3896
   -0.4102
   -0.4307
   -0.4512
   -0.4717
   -0.4922
   -0.5128
   -0.5311
   -0.5491
   -0.5670
   -0.5849
   -0.6029
   -0.6208
   -0.6388
   -0.6567
   -0.6746
   -0.6920
   -0.7060
   -0.7199
   -0.7339
   -0.7479
   -0.7618
   -0.7758
   -0.7898
   -0.8037
   -0.8136
   -0.8198
   -0.8260
   -0.8321
   -0.8383
   -0.8445
   -0.8506
   -0.8568
   -0.8630
   -0.8661
   -0.8690
   -0.8719
   -0.8747
   -0.8776
   -0.8805
   -0.8833
   -0.8862
   -0.8891
   -0.8813
   -0.8705
   -0.8597
   -0.8492
   -0.8516
   -0.8540
   -0.8564
   -0.8589
   -0.8613
   -0.8747
   -0.8940
   -0.9133
   -0.9326
   -0.9520
   -0.9855
   -1.0228
   -1.0600
   -1.0972
   -1.0998
   -1.0638
   -1.0278
   -0.9918
   -0.9113
   -0.8146
   -0.7136
   -0.5684
   -0.4489
   -0.3535
   -0.2452
   -0.1174
    0.0018
    0.1192
    0.2327
    0.3294
    0.4260
    0.5442
    0.6807
    0.8172
    0.9388
    1.0370
    1.1351
    1.2332
    1.2987
    1.3492
    1.3997
    1.4269
    1.4298
    1.4326
    1.4355
    1.4384
    1.4394
    1.4395
    1.4395
    1.4273
    1.3989
    1.3706
    1.3422
    1.2840
    1.2099
    1.1359
    1.0962
    1.0590
    1.0218
    0.9845
    0.9473
    0.9134
    0.8823
    0.8513
    0.8203
    0.7960
    0.7980
    0.8000
    0.8020
    0.8040
    0.8060
    0.8080
    0.8081
    0.8015
    0.7949
    0.7883
    0.7818
    0.7752
    0.7686
    0.7620
    0.7549
    0.7450
    0.7351
    0.7251
    0.7152
    0.7053
    0.6954
    0.6855
    0.6756
    0.6657
    0.6557
    0.6429
    0.6255
    0.6081
    0.5907
    0.5734
    0.5560
    0.5386
    0.5212
    0.5038
    0.4864
    0.4690
    0.4496
    0.4289
    0.4082
    0.3875
    0.3668
    0.3461
    0.3254
    0.3047
    0.2840
    0.2633
    0.2426
    0.2219
    0.2012
    0.1777
    0.1529
    0.1281
    0.1032
    0.0784
    0.0535
    0.0287
    0.0039
   -0.0210
   -0.0458
   -0.0706
   -0.0955
   -0.1203
   -0.1452
   -0.1700
   -0.1948
   -0.2197
   -0.2445
   -0.2694
   -0.2942
   -0.3190
   -0.3439
   -0.3686
   -0.3891
   -0.4096
   -0.4300
   -0.4505
   -0.4709
   -0.4914
   -0.5118
   -0.5323
   -0.5528
   -0.5708
   -0.5884
   -0.6060
   -0.6236
   -0.6412
   -0.6587
   -0.6763
   -0.6939
   -0.7115
   -0.7291
   -0.7467
   -0.7643
   -0.7819
   -0.7893
   -0.7957
   -0.8022
   -0.8086
   -0.8151
   -0.8215
   -0.8279
   -0.8344
   -0.8408
   -0.8473
   -0.8537
   -0.8602
   -0.8631
   -0.8630
   -0.8629
   -0.8628
   -0.8628
   -0.8627
   -0.8626
   -0.8625
   -0.8570
   -0.8455
   -0.8340
   -0.8225
   -0.8111
   -0.7996
   -0.7860
   -0.7709
   -0.7558
   -0.7406
   -0.7255
   -0.7144
   -0.7171
   -0.7198
   -0.7225
   -0.7252
   -0.7279
   -0.7306
   -0.7333
   -0.7360
   -0.7388
   -0.7005
   -0.6287
   -0.5570
   -0.4799
   -0.3935
   -0.3072
   -0.2383
   -0.1765
   -0.1146
   -0.0528];

cdCoeff=[0.0114
    0.0116
    0.0118
    0.0120
    0.0123
    0.0142
    0.0245
    0.0348
    0.0451
    0.0554
    0.0657
    0.0761
    0.0892
    0.1105
    0.1317
    0.1530
    0.1743
    0.1956
    0.2169
    0.2382
    0.2594
    0.2807
    0.3020
    0.3233
    0.3447
    0.3681
    0.3916
    0.4150
    0.4384
    0.4618
    0.4853
    0.5087
    0.5321
    0.5555
    0.5790
    0.6024
    0.6256
    0.6486
    0.6716
    0.6946
    0.7177
    0.7407
    0.7637
    0.7867
    0.8097
    0.8327
    0.8557
    0.8787
    0.9017
    0.9247
    0.9477
    0.9667
    0.9827
    0.9987
    1.0147
    1.0307
    1.0467
    1.0627
    1.0787
    1.0947
    1.1107
    1.1267
    1.1428
    1.1588
    1.1748
    1.1908
    1.2058
    1.2155
    1.2252
    1.2350
    1.2447
    1.2544
    1.2642
    1.2739
    1.2836
    1.2934
    1.3031
    1.3128
    1.3226
    1.3284
    1.3277
    1.3269
    1.3261
    1.3253
    1.3245
    1.3237
    1.3230
    1.3222
    1.3214
    1.3206
    1.3198
    1.3190
    1.3183
    1.3136
    1.3088
    1.3040
    1.2992
    1.2943
    1.2895
    1.2847
    1.2799
    1.2751
    1.2703
    1.2655
    1.2607
    1.2559
    1.2453
    1.2299
    1.2145
    1.1990
    1.1836
    1.1682
    1.1528
    1.1373
    1.1219
    1.1065
    1.0911
    1.0756
    1.0602
    1.0428
    1.0241
    1.0053
    0.9865
    0.9677
    0.9490
    0.9302
    0.9114
    0.8927
    0.8739
    0.8551
    0.8363
    0.8176
    0.7986
    0.7766
    0.7546
    0.7327
    0.7107
    0.6888
    0.6668
    0.6449
    0.6229
    0.6009
    0.5790
    0.5570
    0.5351
    0.5131
    0.4911
    0.4679
    0.4432
    0.4185
    0.3938
    0.3691
    0.3444
    0.3198
    0.2951
    0.2704
    0.2457
    0.2210
    0.1963
    0.1716
    0.1469
    0.1222
    0.0975
    0.0786
    0.0620
    0.0455
    0.0289
    0.0123
    0.0102
    0.0105
    0.0108
    0.0112
    0.0115
    0.0118
    0.0122
    0.0124
    0.0126
    0.0128
    0.0131
    0.0133
    0.0135
    0.0137
    0.0140
    0.0142
    0.0144
    0.0146
    0.0149
    0.0151
    0.0153
    0.0155
    0.0158
    0.0343
    0.0567
    0.0790
    0.1013
    0.1236
    0.1460
    0.1683
    0.1906
    0.2112
    0.2315
    0.2519
    0.2722
    0.2926
    0.3129
    0.3333
    0.3536
    0.3739
    0.3943
    0.4171
    0.4405
    0.4639
    0.4874
    0.5108
    0.5342
    0.5576
    0.5811
    0.6045
    0.6279
    0.6513
    0.6746
    0.6969
    0.7193
    0.7416
    0.7639
    0.7862
    0.8086
    0.8309
    0.8525
    0.8713
    0.8900
    0.9087
    0.9275
    0.9462
    0.9650
    0.9837
    1.0024
    1.0212
    1.0399
    1.0587
    1.0769
    1.0948
    1.1126
    1.1305
    1.1483
    1.1662
    1.1840
    1.2019
    1.2197
    1.2375
    1.2554
    1.2732
    1.2911
    1.3089
    1.3232
    1.3362
    1.3491
    1.3620
    1.3749
    1.3878
    1.4008
    1.4137
    1.4266
    1.4395
    1.4517
    1.4533
    1.4549
    1.4566
    1.4582
    1.4598
    1.4614
    1.4631
    1.4647
    1.4663
    1.4653
    1.4607
    1.4561
    1.4516
    1.4470
    1.4424
    1.4379
    1.4333
    1.4287
    1.4242
    1.4196
    1.4138
    1.4015
    1.3892
    1.3769
    1.3645
    1.3522
    1.3399
    1.3276
    1.3153
    1.3030
    1.2907
    1.2764
    1.2588
    1.2413
    1.2238
    1.2063
    1.1887
    1.1712
    1.1537
    1.1362
    1.1186
    1.1011
    1.0836
    1.0661
    1.0485
    1.0310
    1.0135
    0.9960
    0.9739
    0.9492
    0.9245
    0.8998
    0.8751
    0.8504
    0.8257
    0.8010
    0.7763
    0.7516
    0.7269
    0.7022
    0.6776
    0.6529
    0.6282
    0.6035
    0.5788
    0.5541
    0.5294
    0.5047
    0.4800
    0.4553
    0.4306
    0.4059
    0.3820
    0.3608
    0.3396
    0.3184
    0.2973
    0.2761
    0.2549
    0.2337
    0.2126
    0.1914
    0.1702
    0.1490
    0.1393
    0.1316
    0.1238
    0.1161
    0.1083
    0.1005
    0.0928
    0.0850
    0.0772
    0.0695
    0.0617
    0.0539];

cmCoeff=[0.0609
    0.1018
    0.1427
    0.1778
    0.2121
    0.2463
    0.2806
    0.3149
    0.3492
    0.3380
    0.3256
    0.3133
    0.3009
    0.2885
    0.2762
    0.2638
    0.2514
    0.2453
    0.2516
    0.2579
    0.2642
    0.2706
    0.2769
    0.2832
    0.2895
    0.2958
    0.3021
    0.3085
    0.3136
    0.3178
    0.3221
    0.3263
    0.3305
    0.3348
    0.3390
    0.3432
    0.3475
    0.3517
    0.3540
    0.3560
    0.3580
    0.3600
    0.3620
    0.3639
    0.3659
    0.3679
    0.3699
    0.3719
    0.3739
    0.3759
    0.3779
    0.3799
    0.3795
    0.3788
    0.3781
    0.3773
    0.3766
    0.3759
    0.3752
    0.3744
    0.3737
    0.3730
    0.3722
    0.3715
    0.3708
    0.3700
    0.3693
    0.3686
    0.3678
    0.3670
    0.3661
    0.3652
    0.3643
    0.3634
    0.3625
    0.3616
    0.3608
    0.3599
    0.3590
    0.3581
    0.3572
    0.3563
    0.3553
    0.3537
    0.3521
    0.3504
    0.3488
    0.3471
    0.3455
    0.3438
    0.3422
    0.3405
    0.3389
    0.3372
    0.3356
    0.3340
    0.3323
    0.3307
    0.3277
    0.3234
    0.3192
    0.3149
    0.3107
    0.3064
    0.3021
    0.2979
    0.2936
    0.2894
    0.2851
    0.2808
    0.2766
    0.2731
    0.2695
    0.2659
    0.2623
    0.2587
    0.2551
    0.2515
    0.2479
    0.2443
    0.2407
    0.2371
    0.2336
    0.2300
    0.2264
    0.2228
    0.2192
    0.2156
    0.2120
    0.2093
    0.2068
    0.2042
    0.2017
    0.1992
    0.1967
    0.1942
    0.1917
    0.1892
    0.1867
    0.1842
    0.1817
    0.1792
    0.1767
    0.1742
    0.1710
    0.1635
    0.1560
    0.1485
    0.1410
    0.1335
    0.1260
    0.1185
    0.1110
    0.1035
    0.0959
    0.0884
    0.0809
    0.0672
    0.0512
    0.0352
    0.0192
    0.0032
   -0.0129
   -0.0289
   -0.0449
   -0.0609
   -0.0703
   -0.0741
   -0.0778
   -0.0816
   -0.0854
   -0.0891
   -0.0929
   -0.0966
   -0.1004
   -0.1042
   -0.1079
   -0.1117
   -0.1154
   -0.1192
   -0.1215
   -0.1225
   -0.1236
   -0.1246
   -0.1256
   -0.1266
   -0.1276
   -0.1286
   -0.1296
   -0.1306
   -0.1316
   -0.1326
   -0.1337
   -0.1348
   -0.1360
   -0.1372
   -0.1384
   -0.1395
   -0.1407
   -0.1419
   -0.1430
   -0.1442
   -0.1454
   -0.1478
   -0.1527
   -0.1577
   -0.1626
   -0.1675
   -0.1724
   -0.1773
   -0.1822
   -0.1870
   -0.1914
   -0.1957
   -0.2001
   -0.2045
   -0.2089
   -0.2132
   -0.2176
   -0.2220
   -0.2264
   -0.2307
   -0.2351
   -0.2395
   -0.2439
   -0.2482
   -0.2525
   -0.2561
   -0.2597
   -0.2634
   -0.2670
   -0.2706
   -0.2742
   -0.2778
   -0.2814
   -0.2851
   -0.2887
   -0.2923
   -0.2959
   -0.2995
   -0.3031
   -0.3070
   -0.3109
   -0.3149
   -0.3188
   -0.3227
   -0.3267
   -0.3306
   -0.3346
   -0.3385
   -0.3425
   -0.3464
   -0.3504
   -0.3543
   -0.3583
   -0.3622
   -0.3661
   -0.3701
   -0.3729
   -0.3756
   -0.3783
   -0.3810
   -0.3837
   -0.3864
   -0.3891
   -0.3918
   -0.3945
   -0.3972
   -0.3999
   -0.4026
   -0.4053
   -0.4080
   -0.4107
   -0.4134
   -0.4161
   -0.4188
   -0.4215
   -0.4240
   -0.4264
   -0.4289
   -0.4313
   -0.4337
   -0.4361
   -0.4385
   -0.4410
   -0.4434
   -0.4458
   -0.4482
   -0.4484
   -0.4476
   -0.4468
   -0.4459
   -0.4451
   -0.4443
   -0.4434
   -0.4426
   -0.4418
   -0.4409
   -0.4401
   -0.4393
   -0.4384
   -0.4376
   -0.4368
   -0.4360
   -0.4351
   -0.4343
   -0.4333
   -0.4323
   -0.4313
   -0.4303
   -0.4293
   -0.4283
   -0.4273
   -0.4263
   -0.4253
   -0.4243
   -0.4233
   -0.4223
   -0.4213
   -0.4203
   -0.4182
   -0.4140
   -0.4097
   -0.4055
   -0.4013
   -0.3970
   -0.3928
   -0.3886
   -0.3843
   -0.3801
   -0.3759
   -0.3716
   -0.3674
   -0.3619
   -0.3547
   -0.3475
   -0.3403
   -0.3331
   -0.3258
   -0.3186
   -0.3114
   -0.3167
   -0.3236
   -0.3304
   -0.3372
   -0.3441
   -0.3509
   -0.3578
   -0.3646
   -0.3715
   -0.3715
   -0.3401
   -0.3087
   -0.2773
   -0.2459
   -0.2079
   -0.1690
   -0.1301
   -0.0913
   -0.0524
   -0.0135];



% Define function handles
cl  = @(alpha)interp1(alpha_i,clCoeff,alpha);
cd  = @(alpha)interp1(alpha_i,cdCoeff,alpha);
cm  = @(alpha)interp1(alpha_i,cmCoeff,alpha);

end

function [ls,us]  = getnaca64nrelGeometry
% Airfoil coordinate system is located such as that the leading edge 
% coordinates are at y_s/c = -1/4, z_s/c = 0.
% Original values from Armais and Ruiz
% ndy_ext= 0.25 - [
% 0
% 0.0085
% 0.01141
% 0.01695
% 0.03018
% 0.05583
% 0.08105
% 0.10605
% 0.15573
% 0.20514
% 0.2544
% 0.30355
% 0.35265
% 0.40173
% 0.45083
% 0.5
% 0.54929
% 0.59871
% 0.64829
% 0.69804
% 0.74797
% 0.79809
% 0.84839
% 0.89885
% 0.94944
% 1];
% 
% 
% ndz_ext=[
% 0
% 0.01344
% 0.02646
% 0.03963
% 0.0527
% 0.06544
% 0.07754
% 0.0887
% 0.0987
% 0.1073
% 0.11423
% 0.11915
% 0.12163
% 0.12065
% 0.11698
% 0.11065
% 0.10153
% 0.08937
% 0.07322
% 0.06312
% 0.05093
% 0.03518
% 0.02452
% 0.01885
% 0.01534
% 0];
% 
% 
% ndy_int= 0.25 - [
% 0
% 0.0085
% 0.01141
% 0.01695
% 0.03018
% 0.05583
% 0.08105
% 0.10605
% 0.15573
% 0.20514
% 0.2544
% 0.30355
% 0.35265
% 0.40173
% 0.45083
% 0.5
% 0.54929
% 0.59871
% 0.64829
% 0.69804
% 0.74797
% 0.79809
% 0.84839
% 0.89885
% 0.94944
% 1];
% 
% 
% 
% ndz_int=[
% 0
% -0.01234
% -0.01465
% -0.0181
% -0.02402
% -0.03197
% -0.03769
% -0.0422
% -0.04899
% -0.05377
% -0.05695
% -0.05866
% -0.05885
% -0.05737
% -0.05345
% -0.04805
% -0.0416
% -0.03444
% -0.0269
% -0.01922
% -0.01174
% -0.00494
% 0.00075
% 0.00456
% 0.00552
% 0];

% Actual data of NACA 64(3)-618 according to 
% https://m-selig.ae.illinois.edu/ads/coord/naca643618.dat

nd_upper = [
1.00000     0.00000
0.95056     0.01344
0.90115     0.02646
0.85161     0.03963
0.80191     0.05270
0.75203     0.06544
0.70196     0.07754
0.65171     0.08870
0.60129     0.09870
0.55071     0.10730
0.50000     0.11423
0.44917     0.11915
0.39827     0.12163
0.34735     0.12065
0.29645     0.11698
0.24560     0.11065
0.19486     0.10153
0.14427     0.08937
0.09395     0.07322
0.06895     0.06312
0.04417     0.05093
0.01982     0.03518
0.00805     0.02452
0.00359     0.01885
0.00150     0.01534
0.00000     0.00000
];

nd_lower = [
0.00000     0.00000    
0.00850     -0.01234
0.01141     -0.01465
0.01695     -0.01810
0.03018     -0.02402
0.05583     -0.03197
0.08105     -0.03769
0.10605     -0.04220
0.15573     -0.04899
0.20514     -0.05377
0.25440     -0.05695
0.30355     -0.05866
0.35265     -0.05885
0.40173     -0.05737
0.45083     -0.05345
0.50000     -0.04805
0.54929     -0.04160
0.59871     -0.03444
0.64829     -0.02690
0.69804     -0.01922
0.74797     -0.01174
0.79809     -0.00494
0.84839     0.00075
0.89885     0.00456
0.94944     0.00552
1.00000     0.00000
];

ndy_int  = 0.25 - nd_lower(:,1);
ndz_int  = nd_lower(:,2);
ndy_ext  = 0.25 - nd_upper(:,1);
ndz_ext  = nd_upper(:,2);

ls     = @(ndy)interp1(ndy_int,ndz_int,ndy);
us     = @(ndy)interp1(ndy_ext,ndz_ext,ndy);


end