# Evaluation Report for `TextRecognition` task as of 2025-08-10 23:44:38.146792

## Evaluation method
Evaluating Text Recognition (a.k.a OCR) results, using CER (Character 
Error Rate) metric. CER calculates the accuracy on the character level,
using edit distance algorithm. Namely, CER tells "how many edits" it 
takes to correct the predicted result into the gold standard text. That 
said, note that 

1. For CER, the lower the value, the better the performance.
1. CER can be more that 100%, although it sounds strange. 

(When this evaluator could not find any matching pairs between a gold 
and a prediction, it will return -1 for CER values.)
(When this evaluator could not find any predictions at all for a GUID, 
it will return False for CER values.)

General information on TR evaluation can be found https://en.wikipedia.org/wiki/Optical_character_recognition#Accuracy
And more details on the edit distance (Levenshtein algorithm) can be found https://en.wikipedia.org/wiki/Levenshtein_distance

## Data specs
- Groundtruth data location: /home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons/golds'
- System prediction (MMIF) location: /home/kmlynch/clams_apps/iasa-hichy/output/llava/hi-chy-revised-3'

## Pipeline specs

## Raw Results
```
GUID,mean-CER-cased,mean-CER-uncased
cpb-aacip-058a21352e3,-1.0,-1.0
cpb-aacip-225-0000006t,0.0,0.0
cpb-aacip-225-01pg4ftd,0.4540911118030664,0.05321993437394822
cpb-aacip-225-02q5746p,-1.0,-1.0
cpb-aacip-225-0322813n,0.8002645502645502,0.05489417989417989
cpb-aacip-225-04dnckn6,0.30184567684567687,0.020284895284895285
cpb-aacip-225-05fbg826,0.632674211333582,0.10069228537080795
cpb-aacip-225-05s7h4rk,0.3989010989010989,0.033516483516483515
cpb-aacip-225-06g1jxmr,0.3547383872294845,0.10985064570423902
cpb-aacip-225-07gqnm4b,0.09375,0.03125
cpb-aacip-225-07tmpgw5,0.22165697674418605,0.042877906976744186
cpb-aacip-225-085hqd9p,0.4637849309320605,0.053668385333651425
cpb-aacip-225-08v9s5s9,0.2902957451514044,0.1320117214827653
cpb-aacip-225-09j3tzbz,0.34826330374864245,0.06882279144665394
cpb-aacip-225-106wwr7x,0.03225806451612903,0.03225806451612903
cpb-aacip-225-10wpzhs0,0.41469743216120813,0.0539713503706967
cpb-aacip-225-117m0dnv,0.4768469423824673,0.09685401201838106
cpb-aacip-225-12z34w2c,0.20124668981811838,0.20124668981811838
cpb-aacip-225-12z34wcw,0.38261100326627195,0.042759337420507804
cpb-aacip-225-13mw6nw6,0.5364130434782608,0.07771739130434782
cpb-aacip-225-15bcc3x8,0.6794871794871795,0.09065934065934066
cpb-aacip-225-16c2fsn4,0.4418604651162791,0.06976744186046512
cpb-aacip-225-16pzgpgh,0.4418604651162791,0.06976744186046512
cpb-aacip-225-17crjg75,0.26782608695652177,0.2011594202898551
cpb-aacip-225-182jm7v7,0.6875,0.03125
cpb-aacip-225-20ftth6f,0.5091229793946357,0.07735418055190851
cpb-aacip-225-20sqvcsn,0.30805335968379444,0.09972002635046112
cpb-aacip-225-21tdz2bj,0.8125,0.03125
cpb-aacip-225-2259zz64,0.7287433478471214,0.03721341987851422
cpb-aacip-225-22h70v35,0.42507114488538633,0.03744879131876036
cpb-aacip-225-22v41rbt,0.44680851063829785,0.0425531914893617
cpb-aacip-225-23612mxk,0.6500258313619925,0.07724936781140386
cpb-aacip-225-24wh7333,0.28068027839369303,0.028647758068489775
cpb-aacip-225-257d801s,0.2359240214211788,0.0843037108658035
cpb-aacip-225-257d802h,0.26944141428690804,0.26944141428690804
cpb-aacip-225-2683bp5b,0.055594405594405594,0.03636363636363636
cpb-aacip-225-27mpg72s,0.1183366321237025,0.06476520355227393
cpb-aacip-225-27zkh3tm,0.12416668814325975,0.03845240242897404
cpb-aacip-225-300zpg5s,0.33014162561576355,0.03925492610837438
cpb-aacip-225-30bvqbsq,0.5545064681906787,0.03626895521632363
cpb-aacip-225-311ns4q0,0.34782608695652173,0.13043478260869565
cpb-aacip-225-311ns4wm,0.1784672843496373,0.10580661168896463
cpb-aacip-225-311ns516,0.4626443703371815,0.06895640887910769
cpb-aacip-225-31cjt1d2,0.6654858299595142,0.04554655870445344
cpb-aacip-225-31qftxh5,0.37916666666666665,0.1125
cpb-aacip-225-3331zgtf,0.6745938843764931,0.051702102245580514
cpb-aacip-225-34sj3z70,0.19944569922830793,0.03445605119518162
cpb-aacip-225-354f4tzn,0.402020202020202,0.048484848484848485
cpb-aacip-225-35t76n5v,0.3211849589001389,0.06433617388233977
cpb-aacip-225-36tx99dz,0.15098917506532286,0.028182157521463233
cpb-aacip-225-37vmd00k,0.02127659574468085,0.02127659574468085
cpb-aacip-225-37vmd093,0.31687622694613515,0.03938214242945025
cpb-aacip-225-38w9gnfz,0.265530303030303,0.03939393939393939
cpb-aacip-225-407wm6z0,0.2528161802355351,0.0623399897593446
cpb-aacip-225-418kpws1,0.3833237907014699,0.09791263452707769
cpb-aacip-225-41mgqsz7,0.3757245663610832,0.07757513859705101
cpb-aacip-225-4298sk4k,0.4207321441363994,0.026452467941829646
cpb-aacip-225-44bnzxh7,0.438252297433611,0.09189907978067091
cpb-aacip-225-45q83h0w,0.4864864864864865,0.02702702702702703
cpb-aacip-225-46qz65g2,0.4458037257655254,0.047051593787587
cpb-aacip-225-47rn8tt8,0.037037037037037035,0.037037037037037035
cpb-aacip-225-48sbchm7,0.3237816764132554,0.031189083820662766
cpb-aacip-225-49t1g691,0.0678577635814478,0.0678577635814478
cpb-aacip-225-50tqjvnn,0.4061290322580645,0.03612903225806452
cpb-aacip-225-50tqjvpc,0.7641987829614605,0.04665314401622718
cpb-aacip-225-51hhmnck,0.7425115207373272,0.06970046082949308
cpb-aacip-225-51vdnj5t,0.36862567401673496,0.060784269515733444
cpb-aacip-225-51vdnjgb,0.7297297297297297,0.02702702702702703
cpb-aacip-225-5269pfd1,0.2777668670341029,0.13738385823004146
cpb-aacip-225-5370s3m0,0.8043478260869565,0.043478260869565216
cpb-aacip-225-53wstwhr,0.35132575757575757,0.03598484848484848
cpb-aacip-225-54kkwnxg,0.28253968253968254,0.050793650793650794
cpb-aacip-225-54xgxjx2,0.6241133844842285,0.058294970161977835
cpb-aacip-225-55z617mg,0.341790874957333,0.030265104107406987
cpb-aacip-225-58pc8cvz,0.3806829844694104,0.038466250207799285
cpb-aacip-225-59c5b58c,0.2817920054200542,0.047417005420054205
cpb-aacip-225-59c5b5gq,0.4401888341543514,0.05233990147783251
cpb-aacip-225-60qrfqn9,0.6451612903225806,0.03225806451612903
cpb-aacip-225-62s4n305,0.5028071043513331,0.08252092045188948
cpb-aacip-225-62s4n31w,0.3757239001455504,0.09850348295254208
cpb-aacip-225-6341nznq,0.3162405912065868,0.036083588334002506
cpb-aacip-225-6341nzq5,0.2734133790737564,0.03704974271012007
cpb-aacip-225-644qrn7r,0.4416873449131513,0.18362282878411912
cpb-aacip-225-65h9w6jg,0.11433962264150944,0.11433962264150944
cpb-aacip-225-65v6x41w,0.5935672514619883,0.08771929824561403
cpb-aacip-225-676t1p11,0.7627118644067796,0.03389830508474576
cpb-aacip-225-676t1p2r,0.7766666666666666,0.060833333333333336
cpb-aacip-225-676t1pd0,0.5490799236737715,0.08602320684042883
cpb-aacip-225-67jq2jv9,0.2956933870726974,0.04569338707269741
cpb-aacip-225-67wm3fvw,0.746376811594203,0.17046238785369217
cpb-aacip-225-687h4bv1,0.4517911790938106,0.08886626076271383
cpb-aacip-225-687h4bwr,-1.0,-1.0
cpb-aacip-225-68kd57gn,-1.0,-1.0
cpb-aacip-225-69m37x2m,0.6512126801940288,0.03558789369406299
cpb-aacip-225-69z08szb,0.031746031746031744,0.031746031746031744
cpb-aacip-225-69z08t1g,0.23607123870281765,0.05858585858585858
cpb-aacip-225-720cg560,0.037037037037037035,0.037037037037037035
cpb-aacip-225-720cg58f,0.8301886792452831,0.03773584905660377
cpb-aacip-225-720cg5db,0.011904761904761904,0.011904761904761904
cpb-aacip-225-72p5hxtv,0.4081196581196581,0.060897435897435896
cpb-aacip-225-72p5hz3b,0.406542215950158,0.058965046783813424
cpb-aacip-225-73pvmmc5,0.4559643255295429,0.07803790412486064
cpb-aacip-225-73pvmmnz,0.4255754255720326,0.05845349186147518
cpb-aacip-225-74cnpd4t,0.14110822081836574,0.06864445270242371
cpb-aacip-225-752fr61c,0.5915818065539048,0.05052679127582073
cpb-aacip-225-75r7szj2,0.04,0.04
cpb-aacip-225-7634tvj6,0.8216690716690715,0.04493446368446368
cpb-aacip-225-76rxwn5t,0.217768785173836,0.0375362270343011
cpb-aacip-225-773txjbk,0.5497090384400771,0.044550496640279894
cpb-aacip-225-77fqzf2c,0.1891891891891892,0.013513513513513514
cpb-aacip-225-784j16nb,0.3662102282192237,0.06386140263201733
cpb-aacip-225-784j16p2,0.7840112201963534,0.08625525946704067
cpb-aacip-225-79h44s0t,0.4507042253521127,0.028169014084507043
cpb-aacip-225-79v15nz0,0.15625,0.15625
cpb-aacip-225-805x6k1p,0.06737967914438503,0.06737967914438503
cpb-aacip-225-80vq8bj1,-1.0,-1.0
cpb-aacip-225-81jhb4c4,0.46616292045273394,0.03453531005898294
cpb-aacip-225-83kwhghq,0.49547064305685,0.054339857098477794
cpb-aacip-225-83xsjc9z,0.2225559214099112,0.055889254743244556
cpb-aacip-225-83xsjcbp,-1.0,-1.0
cpb-aacip-225-83xsjcgk,0.023809523809523808,0.023809523809523808
cpb-aacip-225-848pk819,0.5715873015873015,0.0541609977324263
cpb-aacip-225-848pk821,0.35248447204968947,0.24378881987577639
cpb-aacip-225-84zgn1v5,0.73125,0.071875
cpb-aacip-225-86b2rm9c,0.34941176470588237,0.04941176470588235
cpb-aacip-225-881jx2zw,0.4040659088997111,0.10376164926482273
cpb-aacip-225-88cfxzgp,0.044444444444444446,0.044444444444444446
cpb-aacip-225-88cfz00w,0.27524419770619607,0.07988476165176818
cpb-aacip-225-89280rcv,0.4202055632251451,0.07031306353684105
cpb-aacip-225-89r22hxx,0.7196428571428571,0.04880952380952381
cpb-aacip-225-902z3dxg,0.23529411764705882,0.014705882352941176
cpb-aacip-225-902z3f8d,0.3790322580645161,0.17069892473118278
cpb-aacip-225-90dv49tw,0.45,0.1
cpb-aacip-225-913n63bg,0.7447526236881559,0.038980509745127435
cpb-aacip-225-913n63kj,0.12063492063492062,0.12063492063492062
cpb-aacip-225-91sf7w98,0.034482758620689655,0.034482758620689655
cpb-aacip-225-92t4bjr9,0.18299021741021346,0.054370800223670156
cpb-aacip-225-92t4bjs1,0.8082220986281053,0.04138758673658562
cpb-aacip-225-93gxdbd6,0.35610864745011084,0.04555986696230599
cpb-aacip-225-93gxdbgn,0.38709843903775953,0.06725941374521102
cpb-aacip-225-945qg46k,0.12975609756097561,0.12975609756097561
cpb-aacip-225-945qg479,0.7857142857142857,0.23809523809523808
cpb-aacip-225-945qg481,0.23000604047115672,0.039529849994966275
cpb-aacip-225-94vhhwww,0.7890492359932089,0.30305602716468594
cpb-aacip-225-956djsw1,0.4953594851208012,0.07162241508207531
cpb-aacip-225-95j9kphn,0.47163865546218486,0.04726890756302521
cpb-aacip-225-95w6mkcb,0.6255205730468099,0.0964795380087734
cpb-aacip-225-9673nggn,0.2604166666666667,0.04976851851851852
cpb-aacip-225-977sr4x3,0.1480103833294645,0.06157580949993271
cpb-aacip-225-977sr507,0.16176470588235295,0.058823529411764705
cpb-aacip-225-977sr51z,0.24621848739495797,0.043697478991596636
cpb-aacip-225-988gttgb,0.42424242424242425,0.030303030303030304
cpb-aacip-225-988gttpp,0.24691250982798088,0.038176243864311774
cpb-aacip-225-99n2zd03,0.4871662360034453,0.12058570198105083
cpb-aacip-2f864418e19,0.3029938790080778,0.16525416773895477
cpb-aacip-46e8446d567,0.24584613992279497,0.03530001442131233
cpb-aacip-5e99ee61039,0.37777136844751735,0.14440595075547424
cpb-aacip-c361a8d7683,0.3134407259407259,0.13683816183816183
Average,0.3934903265965649,0.06968472206334081

```

## Side-by-side view
<table border="1" class="dataframe table table-striped" id="sbs-table">
  <thead>
    <tr style="text-align: right;">
      <th>guid</th>
      <th>at</th>
      <th>gold</th>
      <th>pred</th>
      <th>cased_cer</th>
      <th>uncased_cer</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>cpb-aacip-225-0000006t (4 rows)</td>
      <td>923390</td>
      <td>KAUPENA WONG</td>
      <td>KAUPENA WONG</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>224758</td>
      <td>RENE MANSHO (D)<br><br>Honolulu City Council</td>
      <td>RENE MANSHO (D)<br>HONOLULU CITY COUNCIL</td>
      <td>0.459459</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>264264</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>275876</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>HANNIBAL TAVARES (R)<br>MAUI MAYOR</td>
      <td>0.258065</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>325392</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>HANNIBAL TAVARES (R)<br>MAUI MAYOR</td>
      <td>0.258065</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>365399</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>REP. TOM OKAMURA (D)<br>HOUSE MAJORITY LEADER</td>
      <td>0.404762</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>385519</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R)<br>SENATE MINORITY LEADER</td>
      <td>0.418605</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>420020</td>
      <td>REP. JOE SOUKI (D)<br><br>House Finance Chairman</td>
      <td>REP. JOE SOUKI (D)<br>HOUSE FINANCE CHAIRMAN</td>
      <td>0.439024</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>435269</td>
      <td>SAM SLOM<br><br>Small Business Hawaii</td>
      <td>SAM SLOM<br>SMALL BUSINESS HAWAII</td>
      <td>0.566667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>469136</td>
      <td>REP. JOE SOUKI (D)<br><br>House Finance Chairman</td>
      <td>REP. JOE SOUKI (D)<br>HOUSE FINANCE CHAIRMAN</td>
      <td>0.439024</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>528028</td>
      <td>PATSY T. MINK<br><br>Former Honolulu<br><br>City Council Chair</td>
      <td>PATSY T. MINK<br>FORMER HONOLU CITY COUNCIL CHAIR</td>
      <td>0.608696</td>
      <td>0.108696</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>576877</td>
      <td>LOWELL KALAPA<br><br>Tax Foundation of Hawaii</td>
      <td>LOWELL KALAPA<br>TAX FOUNDATION OF HAWAII</td>
      <td>0.500000</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>659526</td>
      <td>LOWELL KALAPA<br><br>Tax Foundation of Hawaii</td>
      <td>LOWELL KALAPA<br>TAX FOUNDATION OF HAWAII</td>
      <td>0.500000</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>720020</td>
      <td>PATSY T. MINK<br><br>Former Honolulu<br><br>City Council Chair</td>
      <td>PATSY T. MINK<br>FORMER HONOLU CITY COUNCIL GHAIR</td>
      <td>0.630435</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1062529</td>
      <td>EVIE BENET<br><br>Hawaii Right To Life</td>
      <td>EVIE BENET<br>HAWAII RIGHT TO LIFE</td>
      <td>0.451613</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1075008</td>
      <td>SEN. MARY-JANE McMURDO<br><br>(D) Moiliili-Waikiki</td>
      <td>SEN. MARY-JANE MCMURDO<br>(D) MOILII-WAIKI</td>
      <td>0.384615</td>
      <td>0.128205</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1158525</td>
      <td>SEN. ANN KOBAYASHI (D)<br><br>Manoa-Makiki</td>
      <td>FILE<br>SEN. ANN KOBAYASHI (D)<br>MANOA-MAKIKI</td>
      <td>0.375000</td>
      <td>0.150000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-0322813n (7 rows)</td>
      <td>270270</td>
      <td>Bobby Bunda<br><br>Senate President</td>
      <td>BOBBY BUNDA<br>SENATE PRESIDENT</td>
      <td>0.785714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-0322813n (7 rows)</td>
      <td>1384384</td>
      <td>Egen Atkinson<br><br>Iolani School</td>
      <td>EGEN ATKINSON<br>JOLANI SCHOOL</td>
      <td>0.814815</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>605138</td>
      <td>NORMAN MIZUGUCHI (D)<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI (D)<br>SENATE PRESIDENT</td>
      <td>0.378378</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>645779</td>
      <td>CATHY FOY</td>
      <td>CATHY FOY</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>922656</td>
      <td>REVEREND CHRIS ENG<br><br>United Church Of Christ</td>
      <td>REVEREND CHRIS ENG<br>UNITED CHURCH OF CHRIST</td>
      <td>0.404762</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>1161528</td>
      <td>PAUL KAWAGUCHI<br><br>Senate Chief Clerk</td>
      <td>PAUL KAWAGUCHI<br>SENATE CHIEF CLERK</td>
      <td>0.424242</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>301001</td>
      <td>Jay Chavez<br><br>Captain<br><br>Pride of America</td>
      <td>```<br>JAY CHAVEZ<br>Captain<br>Pride of America<br>```</td>
      <td>0.395349</td>
      <td>0.232558</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>376643</td>
      <td>Robert Kritzman<br><br>Executive Vice President<br><br>NCL Hawaii</td>
      <td>ROBERT KRITZMAN<br>EXECUTIVE VICE PRESIDENT<br>NCL HAWAII</td>
      <td>0.745098</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>651151</td>
      <td>John Heckathorn<br><br>Writer And Critic</td>
      <td>JOHN HECKATHORN<br>WRITER AND CRITIC</td>
      <td>0.757576</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05s7h4rk (4 rows)</td>
      <td>317885</td>
      <td>Brian Barbata<br><br>Gas Retailer</td>
      <td>BRIAN BARBATA<br>GAS RETAILER</td>
      <td>0.769231</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05s7h4rk (4 rows)</td>
      <td>753520</td>
      <td>Mike Fassiotto<br><br>Chaminade University</td>
      <td>Mike Fassiotto<br>Chaminade University</td>
      <td>0.028571</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>183016</td>
      <td>ANDREW POEPOE<br><br>Saiki in '88 Committee</td>
      <td>ANDREW POEPOE<br>SAIKI IN '88 COMMITTEE</td>
      <td>0.416667</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>238505</td>
      <td>WILLIAM DALY<br><br>Voter Contact Services Pres.</td>
      <td>WILLIAM DALY<br>VOTER CONTACT SERVICES PRES.</td>
      <td>0.512195</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>285152</td>
      <td>RICHARD JOUN<br><br>State's Chief Economist</td>
      <td>RICHARD JOUN<br>STATE'S CHIEF ECONOMIST</td>
      <td>0.500000</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>312145</td>
      <td>ALEJANDRA PAJARILLO<br><br>Maunakea Leis & Flowers</td>
      <td>ALEJANDRA PAJARILLO<br>MAUNAKEA LEIS & FLOWERS</td>
      <td>0.395349</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>337271</td>
      <td>SIU NG<br><br>Violet's Lei Stand</td>
      <td>```<br>SIU NG<br>Violet's Lei Stand<br>```</td>
      <td>0.272727</td>
      <td>0.272727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>345879</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>```<br>NINA BERGLUND<br>ELECTION LIVE<br>```</td>
      <td>0.542857</td>
      <td>0.257143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>439907</td>
      <td>GARY O. WALKER (R)</td>
      <td>GARY O. WALKER (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>478645</td>
      <td>MIKE McCARTNEY (D)</td>
      <td>```<br>MIKE MCGARNEY (D)<br>```</td>
      <td>0.440000</td>
      <td>0.400000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>554655</td>
      <td>GARY O. WALKER (R)</td>
      <td>GARY O. WALKER (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>578779</td>
      <td>MIKE McCARTNEY (D)</td>
      <td>```<br>MIKE MCGARNEY (D)<br>```</td>
      <td>0.440000</td>
      <td>0.400000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>653520</td>
      <td>GARY O. WALKER (R)</td>
      <td>GARY O. WALKER (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>684885</td>
      <td>MIKE McCARTNEY (D)</td>
      <td>```<br>MIKE MCGARNEY (D)<br>```</td>
      <td>0.440000</td>
      <td>0.400000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>857524</td>
      <td>MARK SPENGLER<br><br>Bush Campaign</td>
      <td>MARK SPENGLER<br>BUSH CAMPAIGN</td>
      <td>0.407407</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>907140</td>
      <td>EILEEN CHONG<br><br>Fasi Volunteer</td>
      <td>EILEEN CHONG<br>FASI VOLUNTEER</td>
      <td>0.444444</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>942142</td>
      <td>SUSAN ICHINOSE<br><br>Bornhorst Volunteer</td>
      <td>SUSAN ICHINOSE<br>BORNHORST VOLUNTEER</td>
      <td>0.500000</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>959893</td>
      <td>MARK SPENGLER<br><br>Bush Campaign</td>
      <td>MARK SPENGLER<br>BUSH CAMPAIGN</td>
      <td>0.407407</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1063263</td>
      <td>EILEEN CHONG<br><br>Fasi Volunteer</td>
      <td>EILEEN CHONG<br>FASI VOLUNTEER</td>
      <td>0.444444</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1198765</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1284751</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE<br>POLITICAL ANALYST</td>
      <td>0.535714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07gqnm4b (1 rows)</td>
      <td>144378</td>
      <td>CHARLES CLARK<br><br>SUPT. of EDUCATION</td>
      <td>CHARLES CLARK<br>SUPT. OF EDUCATION</td>
      <td>0.093750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07tmpgw5 (3 rows)</td>
      <td>247014</td>
      <td>Jim Tollefson<br><br>CHAMBER OF COMMERCE OF HAWAII</td>
      <td>JIM TOLLEFSON<br>CHAMBER OF COMMERCE OF HAWAII</td>
      <td>0.255814</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07tmpgw5 (3 rows)</td>
      <td>632032</td>
      <td>Joe Toy<br><br>CEO<br><br>HOSPITALITY ADVISORS</td>
      <td>JOE TOY<br>CEO<br>HOSPITALITY ADVISORS</td>
      <td>0.187500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>134635</td>
      <td>WARREN PRICE<br><br>State Attorney General</td>
      <td>WARREN PRICE<br>STATE ATTORNEY GENERAL</td>
      <td>0.514286</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>207407</td>
      <td>SEN. RON MENOR (D)<br><br>Judiciary Committee Chair</td>
      <td>SEN. RON MENOR (D)<br>JUDICIARY COMMITTEE CHAIR</td>
      <td>0.477273</td>
      <td>0.022727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>251385</td>
      <td>MAJ. MIKE CARVALHO<br><br>HPD Narcotics Division</td>
      <td>MAJ. MIKE GARVALHO<br>HPD NARCOTICS DIVISION</td>
      <td>0.414634</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>295529</td>
      <td>WARREN PRICE<br><br>State Attorney General</td>
      <td>WARREN PRICE<br>STATE ATTORNEY GENERAL</td>
      <td>0.514286</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>321255</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>360127</td>
      <td>SEN. RON MENOR (D)<br><br>Judiciary Committee Chair</td>
      <td>SEN. RON MENOR (D)<br>JUDICIARY COMMITTEE CHAIR</td>
      <td>0.477273</td>
      <td>0.022727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>387020</td>
      <td>DR. BLASE HARRIS<br><br>Psychiatrist</td>
      <td>DR. BLASE HARRIS<br>PSYCHIATRIST</td>
      <td>0.413793</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>478645</td>
      <td>AARON PEAK<br><br>Life Foundation</td>
      <td>AARON PEAK<br>LIFE FOUNDATION</td>
      <td>0.500000</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>494895</td>
      <td>DAN BENT<br><br>US Attorney</td>
      <td>DAN BENT US ATTORNEY</td>
      <td>0.450000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>510511</td>
      <td>NANCY PARTIKA<br><br>Exec. Director<br><br>Governor's Committee on AIDS</td>
      <td>NANCY PARTIKA<br>EXEC. DIRECTOR<br>GOVERNOR'S COMMITTEE ON AIDS</td>
      <td>0.526316</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>526627</td>
      <td>ANN deMEURERS<br><br>Hawaii Public Television</td>
      <td>ANN DEMEUERS<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.621622</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>536770</td>
      <td>AARON PEAK<br><br>Life Foundation</td>
      <td>AARON PEAK<br>LIFE FOUNDATION</td>
      <td>0.500000</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>561395</td>
      <td>DAN BENT<br><br>US Attorney</td>
      <td>DAN BENT US ATTORNEY</td>
      <td>0.450000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>579880</td>
      <td>NANCY PARTIKA<br><br>Exec. Director<br><br>Governor's Committee on AIDS</td>
      <td>NANCY PARTIKA<br>EXEC. DIRECTOR<br>GOVERNOR'S COMMITTEE ON AIDS</td>
      <td>0.526316</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>622389</td>
      <td>REP. JIM SHON (D)<br><br>Chair, House Health Committee</td>
      <td>REP. JIM SHON (D)<br>Chair, House Health Committee</td>
      <td>0.021277</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>673507</td>
      <td>KEITH KANESHIRO<br><br>City Prosecutor</td>
      <td>KEITH KANESHIRO<br>CITY PROSECUTOR</td>
      <td>0.419355</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>1091658</td>
      <td>CHRISTINE HALL<br><br>Guide Dog User</td>
      <td>```<br>CHRISTINE HALL<br>GUIDE DOG USER<br>```</td>
      <td>0.486486</td>
      <td>0.243243</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>101902</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>LESLIE WILCOX<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.526316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>235769</td>
      <td>MIKE O'KIEFFE (R)</td>
      <td>```<br>MIKE O'KIEFFE (R)<br>```</td>
      <td>0.320000</td>
      <td>0.320000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>285652</td>
      <td>JAMES DAHLBERG (R)</td>
      <td>JAMES DAHLBERG (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>389523</td>
      <td>MIKE O'KIEFFE (R)</td>
      <td>MIKE O'KIEFFE (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>413380</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>513780</td>
      <td>ANN KOBAYASHI (D)</td>
      <td>ANN KOBAYASHI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>573774</td>
      <td>ED CASE (D)</td>
      <td>```<br>ED CASE (D)<br>```</td>
      <td>0.421053</td>
      <td>0.421053</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>691391</td>
      <td>ED CASE (D)</td>
      <td>```<br>ED CASE (D)<br>```</td>
      <td>0.421053</td>
      <td>0.421053</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>813013</td>
      <td>ED CASE (D)</td>
      <td>ED CASE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>1011378</td>
      <td>REY GRAULTY (D)</td>
      <td>```<br>REY GRALUTY (D)<br>```</td>
      <td>0.434783</td>
      <td>0.434783</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>1040407</td>
      <td>RICHARD WONG (D)</td>
      <td>RICHARD WONG (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>1093026</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>1176009</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>POLITICS EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.625000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>99900</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>281515</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>326260</td>
      <td>GEORGE APPLEGATE<br><br>Big Island Visitors Bureau</td>
      <td>GEORGE APPLÉGATE<br>BIG ISLAND VISITORS BUREAU</td>
      <td>0.488372</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>613647</td>
      <td>NONIE TOLEDO<br><br>GM, Sprint Hawaii</td>
      <td>NONIE TOLEDO<br>GM, SPRINT HAWAII</td>
      <td>0.366667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>907407</td>
      <td>WALTER DODS<br><br>Chairman, Bancwest Corp.</td>
      <td>Walter Dods<br>Chairman, Bancwest Corp.</td>
      <td>0.250000</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>1196129</td>
      <td>CHERYLLE MORROW<br><br>Hawaii Women's Business Center</td>
      <td>Cheryle Morrow<br>Hawaii Women's Business Center</td>
      <td>0.288889</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-106wwr7x (1 rows)</td>
      <td>186386</td>
      <td>Ryan Lum<br><br>North Shore Cattle Co.</td>
      <td>Ryan Lum<br>North Shore Cattle Co.</td>
      <td>0.032258</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>346280</td>
      <td>PIERRE MOULIN<br><br>Pres., Honolulu/Bruyeres<br><br>Friendship Committee</td>
      <td>PIERRE MOULIN<br>PRES., HONOLULU/BRUYERES<br>FRIENDSHIP COMMITTEE</td>
      <td>0.610169</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>376510</td>
      <td>SANDY HOLCK<br><br>Honolulu City Councilman<br><br>Veteran, 442nd Reg. C T</td>
      <td>SANDY HOLCK<br>HONOLULU CITY COUNCILMAN<br>VETERAN, 442ND REG. C T</td>
      <td>0.516667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>525025</td>
      <td>COL. Y. O. KIM<br><br>Veteran, 100th Bn</td>
      <td>COL. Y. O. KIM<br>VETERAN, 100TH BN</td>
      <td>0.312500</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>557391</td>
      <td>FRANCIS SUGAI<br><br>Veteran, 442nd Reg. C T</td>
      <td>```<br>FRANCIS SUGUI<br>VETERAN, 442ND REG.<br>```</td>
      <td>0.487805</td>
      <td>0.243902</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>596630</td>
      <td>GERARD DESCHASEAUX<br><br>Bruyeres Councilman<br><br>Pres., Honolulu/Bruyeres Sister Cityship</td>
      <td>GERARD DESCHASEAUX<br>BRUYERES COUNCILMAN<br>PRES., HONOLULU/BRUYERES SISTER CITYSHIP</td>
      <td>0.594937</td>
      <td>0.025316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>708141</td>
      <td>ROGER BALLAND<br><br>Prof., French Language School</td>
      <td>ROGER BALLAND<br>Prof., French Language School</td>
      <td>0.023256</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>789022</td>
      <td>PIERRE SOURIER<br><br>Pres., Assoc. of Underground Forces,<br><br>WW II</td>
      <td>PIERRE SOURIER<br>Pres., Assoc. of Underground Forces,<br>WWII II</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>904905</td>
      <td>SANDY HOLCK<br><br>Honolulu City Councilman<br><br>Veteran, 442nd Reg. C T</td>
      <td>SANDY HOLCK<br>HONOLULU CITY COUNCILMAN<br>VETERAN, 442ND REG. C T</td>
      <td>0.516667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>939506</td>
      <td>JOHN TSUKANO<br><br>Veteran, 100th Bn/442nd Reg. C T</td>
      <td>JOHN TSUKANO<br>VETERAN, 100TH BN/442ND REG. O T</td>
      <td>0.333333</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>974908</td>
      <td>PIERRE MOULIN<br><br>Pres., Honolulu/Bruyeres<br><br>Friendship Committee</td>
      <td>PIERRE MOULIN<br>PRES., HONOLULU/BRUYERES<br>FRIENDSHIP COMMITTEE</td>
      <td>0.610169</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>1010777</td>
      <td>SERGE CARLESSO<br><br>Veteran/Amputee, French Army</td>
      <td>SERGE CARLESSO<br>VETERAN/AMPUTEE, FRENCH ARMY</td>
      <td>0.488372</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-117m0dnv (3 rows)</td>
      <td>233500</td>
      <td>Eric Gill<br><br>Secretary-Treasurer<br><br>Local 5 of the Unite-Here union</td>
      <td>```<br>ERIC GILL<br>Secretary-Treasurer<br>Local 5 of the Unite-Here Union<br>```</td>
      <td>0.246377</td>
      <td>0.144928</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-117m0dnv (3 rows)</td>
      <td>501768</td>
      <td>Andy Poepoe<br><br>Honolulu District Manager, SBA</td>
      <td>ANDY POEPO<br>HONOLULU DISTRICT MANAGER, SBA</td>
      <td>0.707317</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>188155</td>
      <td>GEORGE TAKANE<br><br>HOUSE CLERK</td>
      <td>GEORGE TAKANE HOUSE CLERK</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>525759</td>
      <td>JAY LARRIN</td>
      <td>```<br>JAY LARRIN<br>```</td>
      <td>0.444444</td>
      <td>0.444444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>686019</td>
      <td>LOYAL GARNER</td>
      <td>```<br>LOYAL GARNER<br>```</td>
      <td>0.400000</td>
      <td>0.400000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>701268</td>
      <td>RICHARD S. H. WONG<br><br>SENATE PRESIDENT</td>
      <td>RICHARD S. H. WONG<br>SENATE PRESIDENT</td>
      <td>0.028571</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>790390</td>
      <td>REV. WILLIAM KAINA</td>
      <td>```<br>REV. WILLIAM KAINA<br>```</td>
      <td>0.307692</td>
      <td>0.307692</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>1000400</td>
      <td>DAVID WOO<br><br>SENATE CLERK</td>
      <td>DAVID WOO<br>SENATE CLERK</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>1176009</td>
      <td>STACY SAKAMOTO<br><br>HAWAII PUBLIC<br><br>TELEVISION</td>
      <td>STACY SAKAMOTO HAWAII PUBLIC TELEVISION</td>
      <td>0.102564</td>
      <td>0.102564</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>176376</td>
      <td>AMY AGBAYANI<br><br>Campaign Strategist</td>
      <td>AMY AGBAYANI<br>CAMPAIGN STRATEGIST</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>190757</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI<br>STATE REPRESENTATIVE (D)</td>
      <td>0.473684</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>212646</td>
      <td>YAS KURODA<br><br>Political Scientist</td>
      <td>YAS KURODA<br>POLITICAL SCIENTIST</td>
      <td>0.566667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>264531</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI<br>STATE REPRESENTATIVE (D)</td>
      <td>0.473684</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>283650</td>
      <td>YAS KURODA<br><br>Political Scientist</td>
      <td>YAS KURODA<br>POLITICAL SCIENTIST</td>
      <td>0.566667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>305138</td>
      <td>HO`OIPO DeCAMBRA<br><br>Hawaiian Activist</td>
      <td>Ho'opo DeCambra<br>Hawaiian Activist</td>
      <td>0.363636</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>335502</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI<br>STATE REPRESENTATIVE (D)</td>
      <td>0.473684</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>347281</td>
      <td>AMY AGBAYANI<br><br>Campaign Strategist</td>
      <td>AMY AGBAYANI<br>CAMPAIGN STRATEGIST</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>369269</td>
      <td>HO`OIPO DeCAMBRA<br><br>Hawaiian Activist</td>
      <td>Ho'opio DeCambra<br>Hawaiian Activist</td>
      <td>0.352941</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>449783</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>510511</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE<br>POLITICAL ANALYST</td>
      <td>0.535714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>548782</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>589890</td>
      <td>LYNETTE LO TOM<br><br>ELECTION LIVE</td>
      <td>LYNETTE LO TOM<br>ELECTION LIVE</td>
      <td>0.035714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>697898</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE<br>POLITICAL ANALYST</td>
      <td>0.535714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>1045512</td>
      <td>JACK RICHARDSON<br><br>Chairman<br><br>Hawaii Democratic Party</td>
      <td>JACK RICHARDSON<br>CHAIRMAN<br>HAWAII DEMOCRATIC PARTY</td>
      <td>0.562500</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>1184017</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX<br>ELECTION LIVE</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-13mw6nw6 (3 rows)</td>
      <td>98632</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-13mw6nw6 (3 rows)</td>
      <td>620020</td>
      <td>Abe Weinstein<br><br>Hawaii Int'l Jazz Festival</td>
      <td>ABE WEINSTEIN<br>HAWAII INT'L JAZZ FESTIVAL</td>
      <td>0.725000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-15bcc3x8 (4 rows)</td>
      <td>245145</td>
      <td>Ted Liu<br><br>Director<br><br>DBEDT</td>
      <td>TED LIU<br>DIRECTOR<br>DBET</td>
      <td>0.666667</td>
      <td>0.142857</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-15bcc3x8 (4 rows)</td>
      <td>640507</td>
      <td>Mark Sasaki<br><br>Big City Diner</td>
      <td>MARK SASAKI<br>BIG CITY DINER</td>
      <td>0.692308</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16c2fsn4 (2 rows)</td>
      <td>138505</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16c2fsn4 (2 rows)</td>
      <td>370504</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16pzgpgh (2 rows)</td>
      <td>123156</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16pzgpgh (2 rows)</td>
      <td>350150</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>299266</td>
      <td>Gary Siebert<br><br>Hilton Hawaii</td>
      <td>Gary Siebert<br>Hilton Hawai</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>579279</td>
      <td>Barbara Stanton<br><br>Executive Director<br><br>AARP Hawaii</td>
      <td>Barbara Stanton<br>Executive Director<br>AARP Hawaii</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>902903</td>
      <td>Eric Tom<br><br>CEO<br><br>BBITV</td>
      <td>```<br>ERIC TOM<br>CEO BBTV<br>```</td>
      <td>0.680000</td>
      <td>0.480000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-182jm7v7 (4 rows)</td>
      <td>231031</td>
      <td>Robbie Alm<br><br>VP, Hawaiian Electric</td>
      <td>ROBBIE ALM<br>VP, HAWAIIAN ELECTRIC</td>
      <td>0.687500</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>105506</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM HAWAII EDITION</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>202135</td>
      <td>PHIL ESTERMANN<br><br>Save Sandy Beach Coalition</td>
      <td>PHIL ESTERMANN<br>SAVE SANDY BEACH COALITION</td>
      <td>0.487805</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>230764</td>
      <td>STEVE HIRANO<br><br>Good Neighbors/Good Planning</td>
      <td>STEVE HIRANO<br>GOOD NEIGHBORS / GOOD PLANNING</td>
      <td>0.558140</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>248282</td>
      <td>DONNA GOTH<br><br>Land Use Research Foundation<br><br>of Hawaii</td>
      <td>DONNA GOTH<br>LAND USE RESEARCH FOUNDATION OF HAWAII</td>
      <td>0.632653</td>
      <td>0.061224</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>301001</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>321522</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayor</td>
      <td>JOANN YUKIMURA (D)<br>KAULI MAYOR</td>
      <td>0.300000</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>360027</td>
      <td>REP. EZRA KANOHO (D)<br><br>Lihue/Kapaa</td>
      <td>```<br>REP. EZRA KANOHO (D)<br>LIHUÉ KAPAÁ<br>```</td>
      <td>0.450000</td>
      <td>0.300000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>437504</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>```<br>GOV. JOHN WAIHEE (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>494528</td>
      <td>GARY GILL<br><br>Honolulu City Council Member</td>
      <td>GARY GILL<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.578947</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>532900</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>JOHN RADCLIFFE<br>GOOD NEIGHBORS / GOOD PLANNING</td>
      <td>0.533333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>598632</td>
      <td>GARY GILL<br><br>Honolulu City Council Member</td>
      <td>GARY GILL<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.578947</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>640774</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>JOHN RADCLIFFE<br>GOOD NEIGHBORS<br>GOOD PLANNING</td>
      <td>0.534884</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>884751</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>JOHN RADGLIFFE<br>GOOD NEIGHBORS / GOOD PLANNING</td>
      <td>0.555556</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1021755</td>
      <td>MARTHA HULBERT<br><br>Adoption Circle of Hawaii</td>
      <td>MARTHA HULBERT<br>ADOPTION CIRCLE OF HAWAII</td>
      <td>0.500000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1183016</td>
      <td>VERA BENEDEK<br><br>Hawaii Public Television</td>
      <td>VERA BENEDEK<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.540541</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1308141</td>
      <td>ARTHUR ROSS<br><br>Neighborhood Board Chairman</td>
      <td>ARTHUR ROSS<br>NEIGHBORHOOD BOARD CHAIRMAN</td>
      <td>0.589744</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>137504</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA<br>HONOLU STAR-BULLETIN</td>
      <td>0.500000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>155022</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA<br>KHON TV2.</td>
      <td>0.125000</td>
      <td>0.125000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>266133</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA<br>HONOLU STAR-BULLETIN</td>
      <td>0.500000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>402135</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA<br>KHON TV2</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>696530</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA<br>HONOLU STAR-BULLETIN</td>
      <td>0.500000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>763130</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA<br>KHONTV2</td>
      <td>0.136364</td>
      <td>0.136364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-21tdz2bj (2 rows)</td>
      <td>547281</td>
      <td>Angela Britten<br><br>Mutual Publishing</td>
      <td>ANGELA BRITTEN<br>MUTUAL PUBLISHING</td>
      <td>0.812500</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>237137</td>
      <td>Steve Johnson<br><br>Kazi Foods</td>
      <td>STEVE JOHNSON<br>KAZI FOODS</td>
      <td>0.750000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>574007</td>
      <td>Virginia Easton Smith<br><br>UH Agricultural Extension Agent</td>
      <td>VIRGINIA EASTON SMITH<br>UH AGRICULTURAL EXTENSION AGENT</td>
      <td>0.754717</td>
      <td>0.018868</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>881014</td>
      <td>Mark Gilbert<br><br>VP<br><br>Commercial Data Systems</td>
      <td>MARK GILBERT<br>VP<br>COMMERCIAL DATA SYSTEMS</td>
      <td>0.743590</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>1217150</td>
      <td>Jane Sawyer<br><br>SBA of Honolulu</td>
      <td>JANE SAWYER<br>SBA OF HONOLULU</td>
      <td>0.666667</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>107774</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>242142</td>
      <td>Steve Teruya<br><br>PRESIDENT<br><br>FINANCE FACTORS</td>
      <td>STEVE TERUYA<br>PRESIDENT<br>FINANCE FACTORS</td>
      <td>0.289474</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>770771</td>
      <td>Rep. Bob Herkes<br><br>HAWAII HOSPITALITY</td>
      <td>Rep. Bob Herkes<br>Hawaii Hospitality</td>
      <td>0.470588</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22v41rbt (2 rows)</td>
      <td>92759</td>
      <td>KELLI ABE<br><br>TRIFONOVITCH<br><br>Hawaii Public Television</td>
      <td>KELLI ABE<br>TRIFONOVITCH<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.446809</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>99266</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>262896</td>
      <td>Jim Barahal<br><br>President<br><br>Honolulu Marathon</td>
      <td>JIM BARAHAL<br>PRESIDENT HONOLULU MARATHON</td>
      <td>0.846154</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>887888</td>
      <td>Lyn Flanigan<br><br>Hawaii State Bar Association</td>
      <td>LYN FLANIGAN<br>HAWAII STATE BAR ASSOCIATION</td>
      <td>0.756098</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>235903</td>
      <td>Harvey Shapiro<br><br>Honolulu Board of Realtors</td>
      <td>HARVEY SHAPIRO<br>HONOLULU BOARD OF REALTORS</td>
      <td>0.780488</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>620153</td>
      <td>Mike Ivens<br><br>MGI Aviation Services</td>
      <td>Mike Ivens<br>MGI Aviation Services</td>
      <td>0.031250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>1291391</td>
      <td>Diane Wicks<br><br>Plantation Home Decor</td>
      <td>Diane Wicks<br>Plantation Home Decor</td>
      <td>0.030303</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>185018</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>```<br>BOB HOGUE (R)<br>State Senate Dist. 24 Candidate<br>KANEOHE-ENCHANTED LAKE<br>```</td>
      <td>0.355263</td>
      <td>0.131579</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>226527</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>SOLOMON NALUA'I (D)<br>State Senate Dist. 24 Candidate<br>KANOHE-ENCHANTED LAKE</td>
      <td>0.273973</td>
      <td>0.054795</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>429129</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>```<br>BOB HOGUE (R)<br>State Senate Dist. 24 Candidate<br>KANEOHE-ENCHANTED LAKE<br>```</td>
      <td>0.355263</td>
      <td>0.131579</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>440774</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>SOLOMON NALUA'I<br>(D)<br>State Senate Dist. 24<br>Candidate<br>KANEOHE-ENCHANTED LAKE</td>
      <td>0.297297</td>
      <td>0.067568</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>707407</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>SOLOMON NALUA'I (D)<br>State Senate Dist. 24 Candidate<br>KANEOHE-ENCHANTED LAKE</td>
      <td>0.270270</td>
      <td>0.040541</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>763764</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>Bob Hogue (R)<br>State Senate Dist. 24 Candidate<br>Kanakone-Enchanted Lake</td>
      <td>0.159420</td>
      <td>0.072464</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>964898</td>
      <td>WILLIAM STONEBRAKER (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>```<br>WILLIAM STONEBRAKER (R)<br>State Rep., Dist. 15 Candidate<br>Kalanina Valley, Hawaii Kai, Porlock<br>```</td>
      <td>0.151515</td>
      <td>0.151515</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>1027761</td>
      <td>GREG KNUDSEN (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>GREG KNUDSEN (D)<br>State Rep. Dist. 15 Candidate<br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.024390</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>189256</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R)<br>State Rep., Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.043956</td>
      <td>0.043956</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>243510</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (D)<br>State Rep. Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia<br><br>Please note that this transcription is based on the visible content of the chyron graphic in the image provided.</td>
      <td>0.567961</td>
      <td>0.567961</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>453253</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (DJ)<br>State Rep. Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.043011</td>
      <td>0.043011</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>533634</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R)<br>State Rep. Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.033333</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>695028</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R)<br>State Rep. Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia<br><br>Please note that this transcription is based on the visible content of the chyron graphic in the image provided.</td>
      <td>0.573529</td>
      <td>0.573529</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>708008</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (D)<br>State Rep. Dist. 42 Candidate<br>Kunia-Makakilo-Ewa-Village Park-Kapolei-Kunia<br><br>Please note that this transcription is based on the visible content of the chyron graphic in the image provided.</td>
      <td>0.567961</td>
      <td>0.567961</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>1186653</td>
      <td>IRIS IKEDA CATALANI (D)<br><br>State Rep. Dist. 47 Candidate<br><br>Kahalu`u-Kane`ohe</td>
      <td>IRIS IKEDA CATALANI (D)<br>State Rep. Dist. 47 Candidate<br>Kahalu'u-Kane'ohe</td>
      <td>0.056338</td>
      <td>0.056338</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2683bp5b (14 rows)</td>
      <td>1156523</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>SEN. MARY-JANE MCMURDO (D)</td>
      <td>0.038462</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2683bp5b (14 rows)</td>
      <td>1289022</td>
      <td>REP. ROMY CACHOLA (D)<br><br>Chair, House Committee on<br><br>Tourism</td>
      <td>REP: ROMY CACHOLA (D)<br>Chair, House Committee on Tourism</td>
      <td>0.072727</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>99766</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN<br>NEWSMAKERS</td>
      <td>0.476190</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>177778</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>SAMAIONA (R)<br>State Rep. Dist. 24 Candidate<br>Makiki-Tantalus</td>
      <td>0.051724</td>
      <td>0.051724</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>233033</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D)<br>State Rep, Dist. 24<br>Candidate<br>Makiki-Tantalus</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>440641</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>```<br>SAMAIONA (R)<br>State Rep. Dist. 24 Candidate<br>Makiki-Tantulus<br>```</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>498532</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D)<br>State Rep. Dist. 24<br>Candidate<br>Makiki-Tantalus</td>
      <td>0.048387</td>
      <td>0.048387</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>701001</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>SAM AIONA (R)<br>State Rep. Dist. 24 Candidate<br>Makiki-Tantalus</td>
      <td>0.033898</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>791391</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D)<br>State Rep., Dist. 24<br>Candidate<br>Makiki-Tantalus</td>
      <td>0.063492</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>1081281</td>
      <td>HENRY MAKINI (R)<br><br>State Senate Dist. 20 Candidate<br><br>Ewa Beach-Makakilo-Kapolei</td>
      <td>HENRY MAKINI (R)<br>State Senate Dist. 20 Candidate<br>Ewa Beach-Makakilo-Kapolei</td>
      <td>0.026667</td>
      <td>0.026667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>96763</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN<br>NEWSMAKERS</td>
      <td>0.476190</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>149016</td>
      <td>WHITNEY ANDERSON (R)<br><br>State Senate Candidate<br><br>District 25 Kailua, Waimanalo</td>
      <td>WHITNEY ANDERSON (R)<br>State Senate Candidate<br>District 25 Kailua, Waimanalo</td>
      <td>0.027397</td>
      <td>0.027397</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>312779</td>
      <td>FRED HEMMINGS (R)<br><br>State Senate Candidate<br><br>District 25 Kailua, Waimanalo</td>
      <td>FRED HEMMINGS (R)<br>State Senate Candidate<br>District 25 Kailua, Waimanalo</td>
      <td>0.028571</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>933767</td>
      <td>ALEX SONSON (D)<br><br>State Rep. Candidate<br><br>District 36 Pearl City, Waipahu</td>
      <td>ALEX SONSON (D)<br>State Rep.<br>Candidate<br>District 36<br>Pearl City, Waipahu</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>985652</td>
      <td>ROY TAKUMI (D)<br><br>State Rep. Candidate<br><br>District 36 Pearl City, Waipahu</td>
      <td>ROY TAKUMI (D)<br>State Rep. Candidate<br>District 36 Pearl City, Waipahu</td>
      <td>0.029851</td>
      <td>0.029851</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>232399</td>
      <td>DAN BOYLAN<br><br>Hawaii Public Television</td>
      <td>DAN BOYLAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>339406</td>
      <td>Ronald T. Y. Moon<br><br>Chief Justice</td>
      <td>RONALD TY. MOON<br>CHIEF JUSTICE</td>
      <td>0.724138</td>
      <td>0.103448</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>515649</td>
      <td>Rep. Dwight Takamine (D)</td>
      <td>Rep. Dwight Takamine (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>659259</td>
      <td>Joseph M. Souki (D)<br><br>Speaker of the House</td>
      <td>Joseph M. Souki (D)<br>Speaker of the House</td>
      <td>0.025000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>200501</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>DENISE MATSUMOTO<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATES</td>
      <td>0.581818</td>
      <td>0.054545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>303270</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATE</td>
      <td>0.543860</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>443143</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>DENISE MATSUMOTO<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATE</td>
      <td>0.574074</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>526126</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATE</td>
      <td>0.543860</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>655022</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>DENISE MATSUMOTO<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATE</td>
      <td>0.574074</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>799900</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK<br>HONOLULU-BOARD OF EDUCATION<br>CANDIDATE</td>
      <td>0.543860</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>877644</td>
      <td>PAUL G. LeMAHIEU Ph.D<br><br>Superintendent of Education</td>
      <td>PAUL G. LEMAHIEU PH.D.<br>SUPERINTENDENT OF EDUCATION</td>
      <td>0.520000</td>
      <td>0.020000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4q0 (2 rows)</td>
      <td>97898</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>55522</td>
      <td>ANNE F. LEE<br><br>President, League of Women<br><br>Voters of Hawaii</td>
      <td>ANNE F. LEE<br>PRESIDENT, LEAGUE OF WOMEN VOTERS OF HAWAII</td>
      <td>0.618182</td>
      <td>0.054545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>181148</td>
      <td>RANDY MOORE<br><br>Moderator</td>
      <td>RANDY MOORE<br>MODERATOR</td>
      <td>0.428571</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>318151</td>
      <td>BART FREDO</td>
      <td>```<br>BART FREDO<br>```</td>
      <td>0.444444</td>
      <td>0.444444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>335636</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>```<br>WILLIAM K. "BILLY" KUAIAWA<br>```</td>
      <td>0.323529</td>
      <td>0.323529</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>403403</td>
      <td>PAUL H. SNIDER</td>
      <td>PAUL H. SNIDER</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>472906</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>529396</td>
      <td>PATSY T. MINK</td>
      <td>PATSY T. MINK</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>597130</td>
      <td>TONY<br><br>HODGES</td>
      <td>TONY HODGES</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>662396</td>
      <td>CEC HEFTEL</td>
      <td>CEC HEFTEL</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>724391</td>
      <td>JERRY BURRIS</td>
      <td>JERRY BURRIS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>759126</td>
      <td>PAUL H. SNIDER</td>
      <td>PAUL H. SNIDER</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>827127</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>1155155</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>```<br>WILLIAM K. "BILLY" KUAIAWA<br>```</td>
      <td>0.323529</td>
      <td>0.323529</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>172906</td>
      <td>JOHN WAIHEE<br><br>DELEGATE, DISTRICT 17B</td>
      <td>JOHN WAIHEE<br>DELEGATE, DISTRICT 17B</td>
      <td>0.029412</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>203770</td>
      <td>RICHARD KAHLE<br><br>Hawaii Tax Director</td>
      <td>RICHARD KAHLE<br>HAWAII TAX DIRECTOR</td>
      <td>0.454545</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>235269</td>
      <td>BEN CAYETANO (D)<br><br>Lieutenant Governor</td>
      <td>```<br>BEN CAYETANO (D)<br>LIEUTENANT GOVERNOR<br>```</td>
      <td>0.568182</td>
      <td>0.204545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>281148</td>
      <td>REP. MICHAEL LIU (R)<br><br>House Minority Leader</td>
      <td>REP. MICHAEL LIU (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.404762</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>333634</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Candidate for Governor</td>
      <td>```<br>REP. FRED HEMINGS (R)<br>CANDIDATE FOR GOVERNOR<br>```</td>
      <td>0.538462</td>
      <td>0.192308</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>367134</td>
      <td>SAM SLOM<br><br>Small Business Hawaii</td>
      <td>SAM SLOM<br>SMALL BUSINESS HAWAII</td>
      <td>0.566667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>404905</td>
      <td>SEN. RICHARD WONG (D)<br><br>Senate President</td>
      <td>SEN. RICHARD WONG (D)<br>SENATE PRESIDENT</td>
      <td>0.368421</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>445512</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent of Education</td>
      <td>Charles Toguchi<br>SUPERINTENDENT OF EDUCATION</td>
      <td>0.837209</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>461395</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>547781</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>JOHN WAIHEE (D) GOVERNOR</td>
      <td>0.375000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>734768</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>JOHN WAIHEE (D) GOVERNOR</td>
      <td>0.375000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31cjt1d2 (3 rows)</td>
      <td>248382</td>
      <td>Eddie Flores<br><br>CEO<br><br>L&L Hawaiian Barbecue</td>
      <td>EDDIE FLORES<br>CEO<br>L&L HAWAIIAN BARBECUE</td>
      <td>0.657895</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31cjt1d2 (3 rows)</td>
      <td>675142</td>
      <td>Gordon Bruce<br><br>I.T. Director<br><br>City & County of Honolulu</td>
      <td>GORDON BRUCE<br>I.T. DIRECTOR<br>CITY & COUNTY OF HONOLULU</td>
      <td>0.673077</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31qftxh5 (6 rows)</td>
      <td>824391</td>
      <td>Joseph M. Souki (D)<br><br>Speaker of the House</td>
      <td>Joseph M. Souki (D)<br>Speaker of the House</td>
      <td>0.025000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31qftxh5 (6 rows)</td>
      <td>993126</td>
      <td>Tom Okamura (D)<br><br>House Majority Leader</td>
      <td>```<br>TOM OKAMURA (D)<br>HOUSE MAJORITY LEADER<br>```</td>
      <td>0.733333</td>
      <td>0.200000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>91758</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>237137</td>
      <td>Frank Mento<br><br>Kewalo Ocean Activities</td>
      <td>FRANK MENTO<br>KEWALO OCEAN ACTIVITIES</td>
      <td>0.771429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>263764</td>
      <td>Daniel Dinell<br><br>Hawaii Community Development Authority</td>
      <td>DANIEL DINELL<br>HAWAII COMMUNITY DEVELOPMENT AUTHORITY</td>
      <td>0.807692</td>
      <td>0.019231</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>1052886</td>
      <td>Roy Sakuma<br><br>Ukulele Festival Founder</td>
      <td>ROY SAKUMA<br>UKULELE FESTIVAL FOUNDER</td>
      <td>0.771429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>343277</td>
      <td>Nina Kealiiwahamana</td>
      <td>Nina Kealiiwahamana</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>398765</td>
      <td>Nina Kealiiwahamana</td>
      <td>Nina Kealiiwahamana</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>423657</td>
      <td>KIMO KAHOANO<br><br>Master of Ceremonies</td>
      <td>KIMO KAHOANO<br>Master of Ceremonies</td>
      <td>0.030303</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>464531</td>
      <td>BENJAMIN J. CAYETANO<br><br>Governor</td>
      <td>BENJAMIN J. CAEYETANO<br>GOVERNOR</td>
      <td>0.300000</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>505506</td>
      <td>DONOVAN GABOYA<br><br>Kapolei Elementary<br><br>(6th Grader)</td>
      <td>DONOVAN GABOYA<br>KAPOLEI ELEMENTARY<br>(6th Grader)</td>
      <td>0.369565</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>652019</td>
      <td>KIMO KAHOANO<br><br>Master of Ceremonies</td>
      <td>KIMO KAHOANO<br>Master of Ceremonies</td>
      <td>0.030303</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>756256</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO<br>LT. GOVERNOR</td>
      <td>0.321429</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>776877</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO<br>LT. GOVERNOR</td>
      <td>0.321429</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>1143510</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO<br>LT. GOVERNOR</td>
      <td>0.321429</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>1388755</td>
      <td>BENJAMIN J. CAYETANO<br><br>Governor</td>
      <td>BENJAMIN J. CAEYETANO<br>GOVERNOR</td>
      <td>0.300000</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-354f4tzn (4 rows)</td>
      <td>104505</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-354f4tzn (4 rows)</td>
      <td>268135</td>
      <td>David Lassner<br><br>I.T. CHIEF<br><br>UNIVERSITY OF HAWAII</td>
      <td>DAVID LASSNER<br>L.T. CHIEF<br>UNIVERSITY OF HAWAII</td>
      <td>0.288889</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>50517</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX<br>ELECTION LIVE</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>260027</td>
      <td>ROBERT E. BETHEA<br><br>Chairman<br><br>People for a Better Hawaii</td>
      <td>ROBERT E. BETHEA<br>Chairman<br>People for a Better Hawaii</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>387654</td>
      <td>JERRY ROTHSTEIN<br><br>Spokesman, Save Hapuna<br><br>Initiative Petition (SHIP) Comm.</td>
      <td>JERRY ROTHSTEIN<br>SPOKESMAN, SAVE HAPUNA<br>INITIATIVE PETITION (SHIP) COMM.</td>
      <td>0.521127</td>
      <td>0.028169</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>431031</td>
      <td>ROBERT E. BETHEA<br><br>Chairman<br><br>People for a Better Hawaii</td>
      <td>ROBERT E. BETHEA<br>CHAIRMAN<br>PEOPLE FOR A BETTER HAWAII</td>
      <td>0.538462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>639006</td>
      <td>RAYMOND AKI (R)<br><br>Kauai Mayoral Candidate</td>
      <td>RAYMOND AKI (R)<br>KAUAI MAYORAL CANDIDATE</td>
      <td>0.487179</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>676009</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayoral Candidate</td>
      <td>JOANN YUKIMURA (D)<br>KAUAI MAYORAL CANDIDATE</td>
      <td>0.452381</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>752886</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayoral Candidate</td>
      <td>JOANN YUKIMURA (D)<br>KAUAI MAYORAL CANDIDATE</td>
      <td>0.452381</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>1082649</td>
      <td>DWIGHT TAKAMINE (D)</td>
      <td>DWIGHT TAKAMINE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>1258258</td>
      <td>FRANK FASI (R)</td>
      <td>```<br>FRANK FASI (R)<br>```</td>
      <td>0.363636</td>
      <td>0.363636</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-36tx99dz (3 rows)</td>
      <td>295529</td>
      <td>Dan Davidson<br><br>AFFORDABLE HOUSING TASK FORCE HEAD</td>
      <td>Dan Davidson<br>AFFORDABLE HOUSING TASK FORCE HEAD</td>
      <td>0.021277</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-36tx99dz (3 rows)</td>
      <td>808008</td>
      <td>Leonard Loventhal<br><br>LOAN MANAGER<br><br>CENTRAL PACIFIC HOME LOANS</td>
      <td>LEONARD LOVENTHAL<br>LOAN MANAGER<br>CENTRAL PACIFIC HOME LOANS</td>
      <td>0.280702</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd00k (6 rows)</td>
      <td>73774</td>
      <td>NINO J. MARTIN</td>
      <td>NINO J. MARTIN</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd00k (6 rows)</td>
      <td>235269</td>
      <td>GEORGE STAUFFER<br><br>PRES. STAUFFER & SONS<br><br>WISCONSIN</td>
      <td>GEORGE STAUFFER<br>PRES. STAUFFER & SONS<br>WISCONSIN</td>
      <td>0.042553</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>88889</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>119253</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>JOHN WAIHEE (D)<br>GOVERNOR</td>
      <td>0.333333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>174775</td>
      <td>Rep. SAMUEL LEE (D)<br><br>Vice Chairman<br><br>House Education Committee</td>
      <td>Rep. Samuel Lee (D)<br>Vice Chairman<br>House Education Committee</td>
      <td>0.152542</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>185886</td>
      <td>Sen. BERTRAND<br><br>KOBAYASHI (D)<br><br>Chairman, Senate Education Committee</td>
      <td>```<br>SEN. BERTRAND KOBAYASHI (D)<br>CHAIRMAN, SENATE EDUCATION COMMITTEE<br>```</td>
      <td>0.569444</td>
      <td>0.152778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>214281</td>
      <td>Rep. ROD TAM (D)<br><br>Chairman<br><br>House Education Committee</td>
      <td>Rep. ROD TAM (D)<br>Chairman<br>House Education Committee</td>
      <td>0.039216</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>255255</td>
      <td>Rep. BOB McEACHERN<br><br>Minnesota Legislator</td>
      <td>Rep. Bob McEachern<br>Minnesota Legislator</td>
      <td>0.230769</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>295529</td>
      <td>Sen. MIKE McCARTNEY (D)<br><br>Vice Chairman<br><br>Senate Education Committee</td>
      <td>Sen. Mike McCartney (D)<br>Vice Chairman<br>Senate Education Committee</td>
      <td>0.171875</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>414281</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>447648</td>
      <td>EVAN THOMAS<br><br>Common Cause</td>
      <td>EVAN THOMAS<br>COMMON CAUSE</td>
      <td>0.416667</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>461128</td>
      <td>PATSY T. MINK<br><br>The Public Reporter</td>
      <td>PATSY T. MINK<br>THE PUBLIC REPORTER</td>
      <td>0.454545</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>520521</td>
      <td>Sen. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R)<br>SENATE MINORITY LEADER</td>
      <td>0.465116</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>546380</td>
      <td>Rep. PETER APO (D)<br><br>House Majority Floor Leader</td>
      <td>Rep. Peter Apo (D)<br>House Majority Floor Leader</td>
      <td>0.152174</td>
      <td>0.021739</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>607007</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>JOHN WAIHEE (D) GOVERNOR</td>
      <td>0.375000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>647014</td>
      <td>Rep. ROLAND KOTANI (D)<br><br>Pearl City/Pacific Palisades</td>
      <td>Rep. Roland Kotani (D)<br>Pearl City/Pacific Palisades</td>
      <td>0.215686</td>
      <td>0.019608</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>677010</td>
      <td>Sen. ELOISE TUNGPALAN (D)<br><br>Chairman, Senate Culture<br><br>& Arts Committee</td>
      <td>Sen. Eloise Tungpalan (D)<br>Chairman, Senate Culture & Arts Committee</td>
      <td>0.238806</td>
      <td>0.044776</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>778779</td>
      <td>Sen. RICK REED (R)<br><br>Senate Minority Floor Leader</td>
      <td>Sen. Rick Reed (R)<br>Senate Minority Floor Leader</td>
      <td>0.148936</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>800400</td>
      <td>Sen. GERALD HAGINO (D)<br><br>Senate Majority Leader</td>
      <td>SEN. GERALD HAGINO (D)<br>SENATE MAJORITY LEADER</td>
      <td>0.444444</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>849516</td>
      <td>Sen. RUSSELL BLAIR (D)<br><br>Senate Majority Floor Leader</td>
      <td>SEN. RUSSELL BLAIR (D)<br>SENATE MAJORITY FLOOR LEADER</td>
      <td>0.470588</td>
      <td>0.019608</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>948782</td>
      <td>Rep. DWIGHT TAKAMINE (D)<br><br>North Hilo/Hamakua</td>
      <td>Rep. DWIGHT TAKAMINE (D)<br>NORTH HILO/HAMAKUA</td>
      <td>0.325581</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>1080013</td>
      <td>Rep. DAVID IGE (D)<br><br>Chairman, Economic Dev.<br><br>& Hawaiian Affairs Com.</td>
      <td>Rep. David Ige (D)<br>Chairman, Economic Dev. & Hawaiian Affairs Com.</td>
      <td>0.136364</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>1295028</td>
      <td>Sen. LEHUA FERNANDES<br><br>SALLING (D)<br><br>Chairman<br><br>Senate Transportation Committee</td>
      <td>Sen. Lehua Fernandes<br>Sailing (D)<br>Chairman<br>Senate Transportation Committee</td>
      <td>0.287671</td>
      <td>0.054795</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>110511</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>250250</td>
      <td>Peter Rosegg<br><br>HAWAIIAN ELECTRIC</td>
      <td>Peter Rosegg<br>HAWAIIAN ELECTRIC</td>
      <td>0.033333</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>622155</td>
      <td>Pat Onishi<br><br>AMERICAN INSTITUTE OF ARCHITECTS<br><br>HONOLULU CHAPTER</td>
      <td>PAT ONISHI<br>AMERICAN INSTITUTE OF ARCHITECTS<br>HONOLULU CHAPTER</td>
      <td>0.150000</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>958258</td>
      <td>Stuart W. H. Ching<br><br>`IOLANI PALACE</td>
      <td>Stuart W. H. Ching<br>'Iolani Palace</td>
      <td>0.363636</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>452019</td>
      <td>Bruce Smith<br><br>CEO<br><br>Tesoro Corp.</td>
      <td>BRUCE SMITH<br>CEO TESORO CORP.</td>
      <td>0.678571</td>
      <td>0.107143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>675142</td>
      <td>Ed Kubo<br><br>U.S. Attorney</td>
      <td>Ed Kubo<br>U.S. Attorney</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>800901</td>
      <td>Debbie Goodwin<br><br>Keck Observatory</td>
      <td>Debbie Goodwin<br>Keck Observatory</td>
      <td>0.032258</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>126126</td>
      <td>PETER CARLISLE<br><br>Deputy Prosecutor</td>
      <td>```<br>PETER CARLISLE<br>Deputy Prosecutor<br>```</td>
      <td>0.225000</td>
      <td>0.225000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>180013</td>
      <td>CAPT. WILLIAM ORNELLAS<br><br>Honolulu Police Dept.</td>
      <td>CAPT. WILLIAM ORNELLAS<br>HONOLULU POLICE DEPT.</td>
      <td>0.363636</td>
      <td>0.022727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>194628</td>
      <td>TIMOTHY WALES<br><br>John Howard Association</td>
      <td>TIMOTHY WALES<br>JOHN HOWARD ASSOCIATION</td>
      <td>0.513514</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>227761</td>
      <td>ALFRED SUGA<br><br>Deputy Director, DSSH</td>
      <td>```<br>ALFRED SUGA<br>Deputy Director, DSSH<br>```</td>
      <td>0.219512</td>
      <td>0.219512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>241141</td>
      <td>JAMES MAY<br><br>Nat. Assoc. Social Workers</td>
      <td>JAMES MAY<br>NAT. ASSOC. SOCIAL WORKERS</td>
      <td>0.500000</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>597631</td>
      <td>LYNNE WATERS</td>
      <td>LYNNE WATERS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>657524</td>
      <td>HERBERT DIAS<br><br>State Director of Taxation</td>
      <td>```<br>HERBERT DIAS<br>STATE DIRECTOR OF TAXATION<br>```</td>
      <td>0.617021</td>
      <td>0.191489</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>790157</td>
      <td>TIM SOGGIN<br><br>Hawn. Sugar Planters<br><br>Association</td>
      <td>TIM SOGGIN<br>HAWN. SUGAR PLANTERS ASSOCIATION</td>
      <td>0.627907</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>67901</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>84251</td>
      <td>CHUCK FREEDMAN<br><br>Governor's Director of<br><br>Communication</td>
      <td>CHUCK FREEDMAN<br>GOVERNOR'S DIRECTOR OF COMMUNICATION</td>
      <td>0.627451</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>181515</td>
      <td>SEN. CLAYTON HEE (D)<br><br>Chair, Senate Judiciary<br><br>Committee</td>
      <td>SEN. CLAYTON HEE (D)<br>Chair, Senate Judiciary Committee</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>235502</td>
      <td>SEN. MAMORU YAMASAKI (D)<br><br>Chair, Senate Ways and means<br><br>Committee</td>
      <td>SEN. MAMORU YAMASAKI (D)<br>Chair, Senate Ways and Means Committee</td>
      <td>0.063492</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>273907</td>
      <td>SEN. RICK REED (R)</td>
      <td>```<br>SEN. RICK REED (R)<br>```</td>
      <td>0.307692</td>
      <td>0.307692</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>295262</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>352152</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>393894</td>
      <td>WARREN PRICE<br><br>Attorney General</td>
      <td>WARREN PRICE<br>ATTORNEY GENERAL</td>
      <td>0.482759</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>448015</td>
      <td>REP. ANDREW LEVIN (D)<br><br>Chair, House Committee on<br><br>Hawaiian Affairs</td>
      <td>```<br>REP ANDREW LEVIN (D)<br>Chair, House Committee on Hawaiian Affairs<br>```</td>
      <td>0.169014</td>
      <td>0.169014</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>534768</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>105138</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>259893</td>
      <td>Irene Bowie<br><br>MAUI TOMORROW FOUNDATION</td>
      <td>Irene Bowie<br>Maui Tomorrow Foundation</td>
      <td>0.555556</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>827127</td>
      <td>Mark Yamane<br><br>HAWAII PACIFIC FEDERAL CREDIT UNION</td>
      <td>MARK YAMANE<br>HAWAII PACIFIC FEDERAL CREDIT UNION</td>
      <td>0.191489</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>108275</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX<br>ELECTION LIVE</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>270904</td>
      <td>JOHN RADCLIFFE<br><br>Former Congressional Candidate</td>
      <td>JOHN RADCLIFFE<br>FORMER CONGRESSIONAL CANDIDATE</td>
      <td>0.577778</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>347514</td>
      <td>GERRY KEIR<br><br>Managing Editor<br><br>Honolulu Advertiser</td>
      <td>GERRY KEIR<br>MANAGING EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.652174</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>422756</td>
      <td>JOHN RADCLIFFE<br><br>Former Congressional Candidate</td>
      <td>JOHN RADCLIFFE<br>FORMER CONGRESSIONAL CANDIDATE</td>
      <td>0.577778</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>488522</td>
      <td>GERRY KEIR<br><br>Managing Editor<br><br>Honolulu Advertiser</td>
      <td>GERRY KEIR<br>MANAGING EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.652174</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>784151</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>215<br>Campaign Spending Commission<br>Office of the Lieutenant Governor<br>NINA BERGLUND<br>ELECTION LIVE</td>
      <td>0.829787</td>
      <td>0.723404</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>801635</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE<br>POLITICAL ANALYST</td>
      <td>0.535714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>830030</td>
      <td>ANDREW POEPOE<br><br>Co-Chairman<br><br>Saiki in '88 Committee</td>
      <td>ANDREW POEPOE<br>Co-Chairman<br>SAIKI IN '88 COMMITTEE</td>
      <td>0.333333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>1068902</td>
      <td>STAN KOKI (R)</td>
      <td>STAN KOKI (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>1183016</td>
      <td>CLAYTON HEE (D)</td>
      <td>CLAYTON HEE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>1417150</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>POLITICS EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.625000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-45q83h0w (7 rows)</td>
      <td>410644</td>
      <td>ANDREW K. POEPOE<br><br>State Representative</td>
      <td>ANDREW K. POEPOE<br>STATE REPRESENTATIVE</td>
      <td>0.486486</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>98765</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>LESLIE WILCOX<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.526316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>221755</td>
      <td>PAM JAASKO<br><br>The Parent Line</td>
      <td>PAM JAASKO<br>THE PARENT LINE</td>
      <td>0.423077</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>243777</td>
      <td>FRED<br><br>Parent</td>
      <td>FRED PARENT</td>
      <td>0.636364</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>264631</td>
      <td>JONATHAN RIETA<br><br>Parent</td>
      <td>JONATHAN RIETA<br>PARENT</td>
      <td>0.285714</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>381782</td>
      <td>MEREDITH MAEDA<br><br>Kailua High Principal</td>
      <td>MEREDITH MAEDA<br>KAILUA HIGH PRINCIPAL</td>
      <td>0.472222</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>405272</td>
      <td>PAM JAASKO<br><br>The Parent Line</td>
      <td>PAM JAASKO<br>THE PARENT LINE</td>
      <td>0.423077</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>448282</td>
      <td>STEPHEN CHOY, PhD<br><br>Psychologist</td>
      <td>STEPHEN CHOY, PHD<br>PSYCHOLOGIST</td>
      <td>0.433333</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>575776</td>
      <td>KEN YAMAMOTO<br><br>Dept. of Education</td>
      <td>KEN YAMAMOTO<br>DEPT. OF EDUCATION</td>
      <td>0.451613</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>727127</td>
      <td>ROBERTA LORENZO<br><br>Toughlove</td>
      <td>ROBERTA LORENZO<br>TOUGHLOVE</td>
      <td>0.360000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1267000</td>
      <td>KEN YAMAMOTO<br><br>Dept. of Education</td>
      <td>KEN YAMAMOTO<br>DEPT. OF EDUCATION</td>
      <td>0.451613</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1377377</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>LESLIE WILCOX<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.526316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1405405</td>
      <td>ROBERTA LORENZO<br><br>Toughlove</td>
      <td>ROBERTA LORENZO<br>TOUGHLOVE</td>
      <td>0.360000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-47rn8tt8 (1 rows)</td>
      <td>241775</td>
      <td>Steve Van Ribbink<br><br>CFO, HMSA</td>
      <td>Steve Van Ribbink<br>CFO, HMSA</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>97397</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>LESLIE WILCOX<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.526316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>175876</td>
      <td>JONATHAN DENNIS<br><br>Director, The New Zealand<br><br>Film Archive</td>
      <td>JONATHAN DENNIS<br>DIRECTOR, THE NEW ZEALAND FILM ARCHIVE</td>
      <td>0.537037</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>581381</td>
      <td>WITARINA HARRIS</td>
      <td>WITARINA HARRIS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>955255</td>
      <td>WITARINA HARRIS</td>
      <td>WITARINA HARRIS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>1404404</td>
      <td>JONATHAN DENNIS<br><br>Director, The New Zealand<br><br>Film Archive</td>
      <td>JONATHAN DENNIS<br>DIRECTOR, THE NEW ZEALAND FILM/ARCHIVE</td>
      <td>0.555556</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>85886</td>
      <td>JOE MOOR<br><br>CHANNEL 2 NEWS</td>
      <td>JOE MOORE<br>CHANNEL 2 NEWS</td>
      <td>0.041667</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>155022</td>
      <td>GERRY KEIR<br><br>HONOLULU ADVERTISER<br><br>MANAGING EDITOR</td>
      <td>GERRY KEIR<br>HONOLU ADVERTISER<br>MANAGING EDITOR</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>237004</td>
      <td>MARY BITTERMAN<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>MARY BITTERMAN<br>CONGRESSIONAL CANDIDATE</td>
      <td>0.026316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>296129</td>
      <td>BLASE HARRIS<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>BLASE HARRIS<br>CONGRESSIONAL CANDIDATE</td>
      <td>0.027778</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>358158</td>
      <td>PATRICIA SAIKI<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>PATRICIA SAIKI<br>CONGRESSIONAL CANDIDATE</td>
      <td>0.026316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>440007</td>
      <td>ANNE HARPHAM<br><br>HONOLULU ADVERTISER</td>
      <td>ANNE HARPHAM<br>HONOLULU ADVERTISER</td>
      <td>0.031250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>1032766</td>
      <td>BARBARA MARSHALL<br><br>CHANNEL 2 NEWS</td>
      <td>```<br>BARBARA MARSHALL<br>CHANNEL 2 NEWS<br>```</td>
      <td>0.230769</td>
      <td>0.230769</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvnn (3 rows)</td>
      <td>272639</td>
      <td>Calvin Say<br><br>Speaker of the House</td>
      <td>Calvin Say<br>Speaker of the House</td>
      <td>0.032258</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvnn (3 rows)</td>
      <td>865532</td>
      <td>Joe Davis<br><br>General Manager<br><br>Hawaii Convention Center</td>
      <td>JOE DAVIS<br>GENERAL MANAGER<br>HAWAII CONVENTION CENTER</td>
      <td>0.780000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvpc (3 rows)</td>
      <td>284885</td>
      <td>Bill Chee<br><br>CEO<br><br>Prudential Locations</td>
      <td>BILL CHEE<br>CEO<br>PRUDENTIAL LOCATIONS</td>
      <td>0.735294</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvpc (3 rows)</td>
      <td>1024157</td>
      <td>Gunner Hartner<br><br>Honda Windward</td>
      <td>GUNNER HARTNER<br>HONDA WINDWARD</td>
      <td>0.793103</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51hhmnck (3 rows)</td>
      <td>250150</td>
      <td>Bruce Smith<br><br>CEO<br><br>Tesoro Corp.</td>
      <td>BRUCE SMITH<br>CEO TESORO CORP.</td>
      <td>0.678571</td>
      <td>0.107143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51hhmnck (3 rows)</td>
      <td>622389</td>
      <td>Darren Kimura<br><br>Energy Industries</td>
      <td>DARREN KIMURA<br>ENERGY INDUSTRIES</td>
      <td>0.806452</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>99766</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>286753</td>
      <td>Connie Lau<br><br>CEO<br><br>American Savings Bank</td>
      <td>CONNIE LAU<br>CEO<br>AMERICAN SAVINGS BANK</td>
      <td>0.694444</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>644878</td>
      <td>Sterling Paulos<br><br>Hotel Director<br><br>NCL Hawaii</td>
      <td>STERLING PAULOS<br>HOTEL DIRECTOR<br>NCL HAWAII</td>
      <td>0.731707</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>954521</td>
      <td>Susan Todani<br><br>Director of Investments<br><br>Kamehameha Schools</td>
      <td>Susan Todani<br>Director of Investments<br>Kamehameha Schools</td>
      <td>0.036364</td>
      <td>0.036364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>1032032</td>
      <td>Rosalind Schurgin<br><br>Executive Vice President<br><br>Festival Companies</td>
      <td>Rosalind Schurgin<br>Executive Vice President<br>Festival Companies</td>
      <td>0.032787</td>
      <td>0.032787</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnjgb (15 rows)</td>
      <td>792125</td>
      <td>Norman Mizuguchi (D)<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI (D)<br>SENATE PRESIDENT</td>
      <td>0.729730</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnjgb (15 rows)</td>
      <td>1162896</td>
      <td>Norman Mizuguchi (D)<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI (D)<br>SENATE PRESIDENT</td>
      <td>0.729730</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>101902</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>172406</td>
      <td>SEN. ROBERT HERKES (R)</td>
      <td>SEN. ROBERT HERKES (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>196129</td>
      <td>SEN. RON MENOR (D)</td>
      <td>```<br>SEN. RON MENOR (D)<br>```</td>
      <td>0.307692</td>
      <td>0.307692</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>256890</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>SEN. MARY-JANE MCMURDO (D)</td>
      <td>0.038462</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>277778</td>
      <td>SEN. JAMES AKI (D)</td>
      <td>SEN. JAMES AKI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>297764</td>
      <td>SEN. RICHARD WONG (D)</td>
      <td>SEN. RICHARD WONG (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>318652</td>
      <td>TOM SELLECK</td>
      <td>```<br>TOM SELLECK<br>```</td>
      <td>0.421053</td>
      <td>0.421053</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>365032</td>
      <td>TOM SELLECK</td>
      <td>```<br>TOM SELLECK<br>```</td>
      <td>0.421053</td>
      <td>0.421053</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>415516</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>466767</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>481515</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br><br>Chair, Senate Education<br><br>Committee</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br>Chair, Senate Education Committee</td>
      <td>0.050847</td>
      <td>0.050847</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>516283</td>
      <td>REP. ROD TAM (D)<br><br>Chair, House Education<br><br>Committee</td>
      <td>```<br>REP ROD TAM (D)<br>Chair, House Education Committee<br>```</td>
      <td>0.214286</td>
      <td>0.214286</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>609276</td>
      <td>REP. ROD TAM (D)<br><br>Chair, House Education<br><br>Committee</td>
      <td>```<br>REP ROD TAM (D)<br>Chair, House Education Committee<br>```</td>
      <td>0.214286</td>
      <td>0.214286</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>638505</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br><br>Chair, Senate Education<br><br>Committee</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br>Chair, Senate Education Committee</td>
      <td>0.050847</td>
      <td>0.050847</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>671505</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>759259</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>```<br>GOV. JOHN WAIHEE<br>```</td>
      <td>0.333333</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>823657</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>```<br>GOVS. JOHN WAIHEE<br>```</td>
      <td>0.360000</td>
      <td>0.360000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>908275</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>```<br>GOV. JOHN WAIHEE<br>```</td>
      <td>0.333333</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>939506</td>
      <td>DONNIS THOMPSON<br><br>Chair, YWCA Leaderluncheon</td>
      <td>DONNIS THOMPSON<br>Chair, YWCA Leaderluncheon</td>
      <td>0.023810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>1152152</td>
      <td>BRUCE ANDERSON<br><br>State Health Department</td>
      <td>BRUCE ANDERSON<br>STATE HEALTH DEPARTMENT</td>
      <td>0.500000</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>1296129</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5370s3m0 (2 rows)</td>
      <td>487020</td>
      <td>Vicki Harris<br><br>Executive Director<br><br>Vanpool Hawaii</td>
      <td>VICKI HARRIS<br>EXECUTIVE DIRECTOR<br>VANPOOL HAWAII</td>
      <td>0.804348</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-53wstwhr (3 rows)</td>
      <td>102903</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-53wstwhr (3 rows)</td>
      <td>1203403</td>
      <td>Mary Flood<br><br>VICE PRESIDENT OF SALES<br><br>SCHULER HOMES</td>
      <td>MARY FLOOD<br>VICE PRESIDENT OF SALES<br>SCHULER HOMES</td>
      <td>0.187500</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54kkwnxg (3 rows)</td>
      <td>612145</td>
      <td>Janice Mizuno<br><br>OWNER<br><br>ANIMATION MAGIC</td>
      <td>JANICE MIZUNO<br>OWNER<br>ANIMATION MAGIC</td>
      <td>0.342857</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54kkwnxg (3 rows)</td>
      <td>946880</td>
      <td>Lavina Wong<br><br>DIRECTOR OF SPECIAL EVENTS<br><br>MACY'S</td>
      <td>LAVINA WONG<br>DIRECTOR OF SPECIAL EVENTS<br>MACY'S</td>
      <td>0.222222</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>94027</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>240908</td>
      <td>Wendy Goodenow<br><br>HNL Travel</td>
      <td>WENDY GOODENOW<br>HNL TRAVEL</td>
      <td>0.680000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>599266</td>
      <td>Jeff Berger<br><br>Kapalua Bay Resort</td>
      <td>JEFF BERGER<br>KAPALUA BAY RESORT</td>
      <td>0.733333</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>896396</td>
      <td>Rex Kim<br><br>Korean Chamber of Commerce</td>
      <td>REX KIM<br>KOREAN CHAMBER OF COMMERCE</td>
      <td>0.735294</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>102402</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus<br>Everybody's Business</td>
      <td>0.515152</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>237271</td>
      <td>Harvey Shapiro<br><br>ECONOMIST<br><br>HONOLULU BOARD OF REALTORS</td>
      <td>HARVEY SHAPIRO<br>ECONOMIST<br>HONOLULU BOARD OF REALTORS</td>
      <td>0.254902</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>594027</td>
      <td>Michael Kramer<br><br>NATURAL INVESTMENT SERVICES, LLC</td>
      <td>MICHAEL KRAMER<br>NATURAL INVESTMENT SERVICES, LLC</td>
      <td>0.255319</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>89890</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>LESLIE WILCOX<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.526316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>156523</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>241642</td>
      <td>GERALD KATO<br><br>Assignment Editor<br><br>KITV News 4</td>
      <td>GERALD KATO<br>ASSIGNMENT EDITOR<br>KITV NEWS 4</td>
      <td>0.463415</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>318018</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>POLITICS EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.625000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>500033</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>560027</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>POLITICS EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.625000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>604271</td>
      <td>RICHARD BORRECA<br><br>Political Bureau Chief<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA<br>POLITICAL BUREAU CHIEF<br>HONOLU STAR-BULLETIN</td>
      <td>0.610169</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>972639</td>
      <td>RICHARD BORRECA<br><br>Political Bureau Chief<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA<br>POLITICAL BUREAU CHIEF<br>HONOLULU STAR-BULLETIN</td>
      <td>0.590164</td>
      <td>0.032787</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>1013146</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>POLITICS EDITOR<br>HONOLULU ADVERTISER</td>
      <td>0.625000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>1087654</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>DAN BOYLAN<br>Professor of History<br>West Oahu College</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>1291391</td>
      <td>LYNNE WATERS</td>
      <td>LYNNE WATERS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>222890</td>
      <td>Peter Young<br><br>Chairman, Dept. of Land & Natural Resources</td>
      <td>Peter Young<br>Chairman, Department of Land & Natural Resources</td>
      <td>0.116667</td>
      <td>0.116667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>242142</td>
      <td>Judith Fogarty<br><br>NOAA Fisheries Enforcement</td>
      <td>Judith Fogarty<br>NOAA Fisheries Enforcement</td>
      <td>0.024390</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>503003</td>
      <td>Bill Chee<br><br>CEO, Prudential Properties</td>
      <td>BILL CHEE<br>CEO, PRUDENTIAL PROPERTIES</td>
      <td>0.694444</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>1255255</td>
      <td>Michelle Kennedy<br><br>Customer Communications, TheBus</td>
      <td>MICHELLE KENNEDY<br>Customer Communications, TheBus</td>
      <td>0.291667</td>
      <td>0.020833</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>220254</td>
      <td>DAN BOYLAN<br><br>Hawaii Public Television</td>
      <td>DAN BOYLAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>327528</td>
      <td>Ronald T. Y. Moon<br><br>Chief Justice</td>
      <td>RONALD TY. MOON<br>CHIEF JUSTICE</td>
      <td>0.724138</td>
      <td>0.103448</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>645779</td>
      <td>Joseph M. Souki (D)<br><br>Speaker of the House</td>
      <td>Joseph M. Souki (D)<br>Speaker of the House</td>
      <td>0.025000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-60qrfqn9 (3 rows)</td>
      <td>243277</td>
      <td>Jonathan Ornstein<br><br>CEO, Mesa Air</td>
      <td>JONATHAN ORNSTEIN<br>CEO, MESA AIR</td>
      <td>0.645161</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>96129</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM HAWAII EDITION</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>137504</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD<br>PRESIDENT<br>KAULI CHAMBER OF COMMERCE</td>
      <td>0.604167</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>173774</td>
      <td>TOM SHIGEMOTO<br><br>Kauai Planning Director</td>
      <td>```<br>TOM SHIGEMOTO<br>KAULI PLANNING DIRECTOR<br>```</td>
      <td>0.600000</td>
      <td>0.222222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>228028</td>
      <td>TOM CONTRADES<br><br>Kauai Planning Commission</td>
      <td>```<br>TOM CONTRADES<br>KAULI PLANNING COMMISSION<br>```</td>
      <td>0.617021</td>
      <td>0.212766</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>238505</td>
      <td>ANNETTE CASSIDY<br><br>President<br><br>Thousand Friends of Kauai</td>
      <td>```<br>ANNETTE CASSIDY<br>PRESIDENT<br>THOUSAND FRIENDS OF KAULA<br>```</td>
      <td>0.627119</td>
      <td>0.186441</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>267267</td>
      <td>TOM CONTRADES<br><br>Kauai Planning Commission</td>
      <td>```<br>TOM CONTRADES<br>KAULI PLANNING COMMISSION<br>```</td>
      <td>0.617021</td>
      <td>0.212766</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>275008</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD<br>PRESIDENT<br>KAUAL CHAMBER OF COMMERCE</td>
      <td>0.604167</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>327895</td>
      <td>TONY KUNIMURA<br><br>Former Kauai Mayor</td>
      <td>TONY KUNIMURA<br>FORMER KAUAI MAYOR</td>
      <td>0.437500</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>353387</td>
      <td>ANNETTE CASSIDY<br><br>President<br><br>Thousand Friends of Kauai</td>
      <td>```<br>ANNETTE CASSIDY<br>PRESIDENT<br>THOUSAND FRIENDS OF KAULA<br>```</td>
      <td>0.627119</td>
      <td>0.186441</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>368001</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD<br>PRESIDENT<br>KAUAL CHAMBER OF COMMERCE</td>
      <td>0.604167</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>380380</td>
      <td>TONY KUNIMURA<br><br>Former Kauai Mayor</td>
      <td>TONY KUNIMURA<br>FORMER KAUAI MAYOR</td>
      <td>0.437500</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>416383</td>
      <td>MAXINE CORREA (D)<br><br>Kauai Council Chair</td>
      <td>MAXINE CORREA (D)<br>KAUAI COUNCIL CHAIR</td>
      <td>0.405405</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>452653</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>JOANN YUKIMURA (D)<br>MAYOR OF KAUAI</td>
      <td>0.333333</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>588021</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>JOANN YUKIMURA (D)<br>MAYOR OF KAUAI</td>
      <td>0.333333</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>723023</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>JOANN YUKIMURA (D)<br>MAYOR OF KAUAI</td>
      <td>0.333333</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1002402</td>
      <td>ELIZABETH FUJIWARA<br><br>Civil Rights Attorney</td>
      <td>ELIZABETH FUJIWARA<br>CIVIL RIGHTS ATTORNEY</td>
      <td>0.425000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1046146</td>
      <td>JOHN KNOREK<br><br>Corporate Attorney</td>
      <td>JOHN KNOREK<br>CORPORATE ATTORNEY</td>
      <td>0.533333</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1072272</td>
      <td>ELIZABETH FUJIWARA<br><br>Civil Rights Attorney</td>
      <td>ELIZABETH FUJIWARA<br>CIVIL RIGHTS ATTORNEY</td>
      <td>0.425000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1156890</td>
      <td>VERA BENEDEK<br><br>Hawaii Public Television</td>
      <td>VERA BENEDEK<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.540541</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>62629</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>83383</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>```<br>REP. BRIAN TANIGUCHI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>137137</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>```<br>REP. BRIAN TANIGUCHI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>169770</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>```<br>SEN. MAMORU YAMASAKI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>233267</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>```<br>SEN. MAMORU YAMASAKI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>253520</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>```<br>REP. BRIAN TANIGUCHI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>297631</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>```<br>SEN. MAMORU YAMASAKI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>315015</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>379012</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>390257</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Chair, Government Operations<br><br>Committee</td>
      <td>SEN. RUSSELL BLAIR (D)<br>Chair, Government Operations Committee</td>
      <td>0.049180</td>
      <td>0.049180</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>435769</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Chair, Government Operations<br><br>Committee</td>
      <td>SEN. RUSSELL BLAIR (D)<br>Chair, Government Operations Committee</td>
      <td>0.049180</td>
      <td>0.049180</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>477377</td>
      <td>REBECCA SENUTOVITCH<br><br>American Association of<br><br>University Women</td>
      <td>REBECCA SENUTOVITCH<br>AMERICAN ASSOCIATION OF UNIVERSITY WOMEN</td>
      <td>0.583333</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>505138</td>
      <td>BUCK BUCHWACH<br><br>Honolulu Advertiser</td>
      <td>BUCK BUCHWACH<br>HONOLU ADVERTISER</td>
      <td>0.548387</td>
      <td>0.096774</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>529530</td>
      <td>G. A. "RED" MORRIS</td>
      <td>G.A. "Red" Morris</td>
      <td>0.470588</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>547781</td>
      <td>JANICE WOLF<br><br>Admin. Director State Judiciary</td>
      <td>JANICE WOLF<br>Admin. Director<br>State Judiciary</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>578278</td>
      <td>JAY SCHARF<br><br>Common Cause Hawaii</td>
      <td>JAY SCHARF<br>COMMON CAUSE HAWAII</td>
      <td>0.500000</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>603003</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>654021</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>675008</td>
      <td>DANTE CARPENTER<br><br>Hawaii County Mayor</td>
      <td>DANTE CARPENTER<br>HAWAII COUNTY MAYOR</td>
      <td>0.428571</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>697264</td>
      <td>HANNIBAL TAVARES<br><br>Maui County Mayor</td>
      <td>HANNIBAL TAVARES<br>MAUI COUNTY MAYOR</td>
      <td>0.382353</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>706006</td>
      <td>SPENCER KALANI SCHUTTE<br><br>Hawaii County Councilmember</td>
      <td>SPENCER KALANI SCHUTTE<br>HAWAII COUNTY COUNCILMEMBER</td>
      <td>0.460000</td>
      <td>0.020000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>742876</td>
      <td>JOSEPH CONANT<br><br>Dir., State Housing Finance<br><br>& Development Corp.</td>
      <td>JOSEPH CONANT<br>DIR, STATE HOUSING FINANCE<br>&-DEVELOPMENT CORP.</td>
      <td>0.583333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>782282</td>
      <td>STANLEY KAWAGUCHI<br><br>Consulting Engineers Council</td>
      <td>STANLEY KAWAGUCHI<br>CONSULTING ENGINEERS COUNCIL</td>
      <td>0.521739</td>
      <td>0.021739</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>797631</td>
      <td>DONNA MERCADO KIM<br><br>Honolulu City Councilmember</td>
      <td>DONNA MERCADO KIM<br>HONOLULU CITY COUNCILMEMBER</td>
      <td>0.511111</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>907641</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>922022</td>
      <td>SEN. RUSSELL BLAIR (D)</td>
      <td>```<br>SEN. RUSSELL BLAIR (D)<br>```</td>
      <td>0.266667</td>
      <td>0.266667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>942776</td>
      <td>REP. DWIGHT TAKAMINE (D)<br><br>Chair, House Labor Committee</td>
      <td>```<br>REP DWIGHT TAKAMINE (D)<br>Chair, House Labor Committee<br>```</td>
      <td>0.166667</td>
      <td>0.166667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>104771</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN<br>NEWSMAKERS</td>
      <td>0.476190</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>160027</td>
      <td>KELLY ZANE (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>KELLYZANE (D)<br>State Rep., Dist. 15 Candidate<br>KALAMA VALLEY, HAWAII KAI, PORTLOCK</td>
      <td>0.350000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>215649</td>
      <td>GREG KNUDSEN (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>GREG KNUDSEN (D)<br>State Rep. Dist. 15 Candidate<br>Kalama Valley, Hawaii Kai, Ponlock</td>
      <td>0.049383</td>
      <td>0.049383</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>308275</td>
      <td>ROY BENHAM (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>ROY BENHAM (D)<br>State Rep., Dist. 15 Candidate<br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>865532</td>
      <td>KERRIE (Lane) WOODALL (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>KERRIE (LANE) WOODALL (R)<br>State Rep. DIST. 15 CANDIDATE<br>KALAMA VALLEY, HAWAII KAI, PORTLOCK</td>
      <td>0.439560</td>
      <td>0.021978</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>914281</td>
      <td>WILLIAM STONEBRAKER (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>WILLIAM STONEBRAKER (R)<br>State Rep. DIST. 15 CANDIDATE<br>KALAMA VALLEY, HAWAII KAI, PORTLOCK</td>
      <td>0.415730</td>
      <td>0.022472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>1062529</td>
      <td>ADRIENNE KING (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>ADRIENNE KING (R)<br>State Rep. DIST. 15 CANDIDATE<br>KALAMA VALLEY, HAWAII KAI, PORTLOCK</td>
      <td>0.445783</td>
      <td>0.024096</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nzq5 (2 rows)</td>
      <td>693527</td>
      <td>Nola Nahulu<br><br>Artistic Director<br><br>Hawaii Youth Opera Chorus</td>
      <td>NOLA NAHULU<br>Artistic Director<br>HAWAII YOUTH OPERA CHORUS</td>
      <td>0.509091</td>
      <td>0.036364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nzq5 (2 rows)</td>
      <td>733033</td>
      <td>Selena Ching<br><br>Executive Director<br><br>Hawaii Youth Symphony</td>
      <td>Selena Ching<br>Executive Director<br>Hawaii Youth Symphony</td>
      <td>0.037736</td>
      <td>0.037736</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-644qrn7r (2 rows)</td>
      <td>353153</td>
      <td>Judith Kalbrener<br><br>President<br><br>Honolulu Board of Realtors</td>
      <td>Judith Kalberer<br>President<br>Honolulu Board of Realtors</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-644qrn7r (2 rows)</td>
      <td>621655</td>
      <td>Brian Black<br><br>Pasha Hawaii</td>
      <td>```<br>BRIAN BLACK<br>PASHA HAWAI<br>```</td>
      <td>0.806452</td>
      <td>0.290323</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65h9w6jg (7 rows)</td>
      <td>301502</td>
      <td>GEORGE TAKANE<br><br>HOUSE CLERK</td>
      <td>GEORGE TAKANE<br>HOUSE CLERK</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65h9w6jg (7 rows)</td>
      <td>410511</td>
      <td>HERMAN LUM<br><br>CHIEF JUSTICE<br><br>HAWAII SUPREME COURT</td>
      <td>```<br>HERMAN LUM<br>CHIEF JUSTICE<br>HAWAII SUPREME COURT<br>```</td>
      <td>0.188679</td>
      <td>0.188679</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65v6x41w (18 rows)</td>
      <td>250150</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent<br><br>Dept. of Education</td>
      <td>```<br>CHARLES TOGUCHI<br>SUPERINTENDENT<br>DEPT. OF EDUCATION<br>```</td>
      <td>0.631579</td>
      <td>0.175439</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65v6x41w (18 rows)</td>
      <td>1179646</td>
      <td>Rep. DANIEL KIHANO</td>
      <td>Rep. Daniel Kihano</td>
      <td>0.555556</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p11 (1 rows)</td>
      <td>590023</td>
      <td>Mona Abadir<br><br>Hawaii State Foundation<br><br>on Culture and the Arts</td>
      <td>MONA ABADIR<br>HAWAII STATE FOUNDATION<br>ON CULTURE AND THE ARTS</td>
      <td>0.762712</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p2r (4 rows)</td>
      <td>233634</td>
      <td>David Carey<br><br>CEO<br><br>Outrigger</td>
      <td>DAVID CAREY<br>CEO<br>OUTRIGGER</td>
      <td>0.720000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p2r (4 rows)</td>
      <td>571138</td>
      <td>Harvey Shapiro<br><br>Economist</td>
      <td>HARVEY SHAPIRO<br>ECONOMIST</td>
      <td>0.833333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>252886</td>
      <td>CHRIS COOK<br><br>Kauai County Economic<br><br>Development Coordinator</td>
      <td>```<br>CHRIS COOK<br>KAUI COUNTY ECONOMIC<br>DEVELOPMENT COORDINATOR<br>```</td>
      <td>0.730159</td>
      <td>0.174603</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>267134</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>292392</td>
      <td>REP. DAVID IGE (D)<br><br>House Economic<br><br>Development Chair</td>
      <td>REP. DAVID IGE (D)<br>HOUSE ECONOMIC DEVELOPMENT CHAIR</td>
      <td>0.549020</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>401001</td>
      <td>JIM MANKE<br><br>State Information Service Dir.</td>
      <td>```<br>JIM MANKE<br>STATE INFORMATION SERVICE DIR.<br>```</td>
      <td>0.645833</td>
      <td>0.187500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>481281</td>
      <td>REP. CAROL FUKUNAGA (D)<br><br>House Legislative<br><br>Management Chair</td>
      <td>REP., CAROL FUKUNAGA (D)<br>HOUSE LEGISLATIVE MANAGEMENT CHAIR</td>
      <td>0.525424</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>556256</td>
      <td>DESMOND BYRNE<br><br>Citizen Advocate</td>
      <td>DESMOND BYRNE<br>CITIZEN ADVOCATE</td>
      <td>0.466667</td>
      <td>0.033333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>664765</td>
      <td>REP. CAROL FUKUNAGA (D)<br><br>House Legislative<br><br>Management Chair</td>
      <td>REP. CAROL FUKUNAGA (D)<br>HOUSE LEGISLATIVE MANAGEMENT CHAIR</td>
      <td>0.517241</td>
      <td>0.051724</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>926760</td>
      <td>JESSE OLANOLAN<br><br>Kapaa High School Student</td>
      <td>```<br>JESSE OLANOLAN<br>KAPA'A HIGH SCHOOL STUDENT<br>```</td>
      <td>0.571429</td>
      <td>0.204082</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>979012</td>
      <td>CLARENCE KAONA<br><br>Bus Driver</td>
      <td>CLARENGE KAONA<br>BUS DRIVER</td>
      <td>0.360000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>1032766</td>
      <td>EUGENE IMAI<br><br>Department of Education</td>
      <td>EUGENE IMAI<br>DEPARTMENT OF EDUCATION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>1406139</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>283750</td>
      <td>Ricky Cassiday<br><br>Home Price Researcher</td>
      <td>Ricky Cassidy<br>Home Price Researcher</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>964531</td>
      <td>Chris van Bergeijk<br><br>VP Programs<br><br>Hawaii Community Foundation</td>
      <td>Chris van Bergeijk<br>VP Programs<br>Hawaii Community Foundation</td>
      <td>0.034483</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>1289656</td>
      <td>Melanie Okazaki<br><br>Marketing Manager<br><br>McDonald's</td>
      <td>MELANIE OKAZAKI<br>MARKETING MANAGER<br>MCDONALD'S</td>
      <td>0.795455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>102002</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>HOWARD DICUS<br>PNB FRIDAY</td>
      <td>0.739130</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>274007</td>
      <td>Ted Liu<br><br>Director<br><br>DBEDT</td>
      <td>TED LIU<br>DIRECTOR<br>DBET</td>
      <td>0.666667</td>
      <td>0.142857</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>697631</td>
      <td>Chuck Sted<br><br>Kapiolani Medical Center</td>
      <td>```<br>CHUCK STED<br>KAPOLANI MEDICAL CENTER<br>```</td>
      <td>0.833333</td>
      <td>0.238095</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>68268</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX<br>ELECTION LIVE</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>122256</td>
      <td>FRED HEMMINGS<br><br>Republican</td>
      <td>FRED HEMINGS REPUBLICAN</td>
      <td>0.521739</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>185752</td>
      <td>PATSY T. MINK<br><br>Democrat</td>
      <td>PATSY T. MINK DEMOCRAT</td>
      <td>0.409091</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>289022</td>
      <td>FRED HEMMINGS<br><br>Republican</td>
      <td>FRED HEMINGS<br>REPUBLICAN</td>
      <td>0.478261</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>423757</td>
      <td>PATSY T. MINK<br><br>Democrat</td>
      <td>PATSY T. MINK DEMOCRAT</td>
      <td>0.409091</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>580514</td>
      <td>MARIA HUSTACE (R)<br><br>Senatorial Candidate</td>
      <td>MARIA HUSTACE (R)<br>SENATORIAL CANDIDATE</td>
      <td>0.473684</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>585018</td>
      <td>KEN SCHOOLLAND (L)<br><br>Senatorial Candidate</td>
      <td>KEN SCHOOLAND (L)<br>SENATORIAL CANDIDATE</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>629396</td>
      <td>SPARK MATSUNAGA (D)<br><br>U.S. Senator</td>
      <td>SPARK MATSUNAGA (D)<br>U.S. SENATOR</td>
      <td>0.218750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>660761</td>
      <td>MARIA HUSTACE (R)<br><br>Senatorial Candidate</td>
      <td>MARIA HUSTACE (R)<br>SENATORIAL CANDIDATE</td>
      <td>0.473684</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>679379</td>
      <td>KEN SCHOOLLAND (L)<br><br>Senatorial Candidate</td>
      <td>KEN SCHOOLAND (L)<br>SENATORIAL CANDIDATE</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>801134</td>
      <td>BERNARD AKANA (R)<br><br>Mayoral Candidate<br><br>Hawaii County</td>
      <td>```<br>BERNARD AKANA (R)<br>MAYOR CANDIDATE<br>HAWAII COUNTY<br>```</td>
      <td>0.618182</td>
      <td>0.218182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>1052519</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>```<br>NINA BERGLUND<br>ELECTION LIVE<br>```</td>
      <td>0.542857</td>
      <td>0.257143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>1066900</td>
      <td>BETTE TATUM<br><br>National Federation of <br><br>Independent Business</td>
      <td>BETTE TATUM<br>NATIONAL FEDERATION OF INDEPENDENT BUSINESS</td>
      <td>0.690909</td>
      <td>0.054545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>334134</td>
      <td>Michael Kosmin<br><br>Centex Destinations</td>
      <td>MICHAEL KOSMIN<br>Centex Destinations</td>
      <td>0.352941</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>1191758</td>
      <td>Dave Plaskett<br><br>Hawaii Coffee Company</td>
      <td>DAVE PLASKETT<br>HAWAII COFFEE COMPANY</td>
      <td>0.771429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>1273006</td>
      <td>Allen Kaufman<br><br>President<br><br>Seasoned Citizens</td>
      <td>ALLEN KAUFMAN<br>PRESIDENT<br>SEASONED CITIZENS</td>
      <td>0.829268</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08szb (5 rows)</td>
      <td>815649</td>
      <td>Valerie Love, Director<br><br>Gain Awareness Through Education<br><br>Atlanta</td>
      <td>Valerie Love, Director<br>Gain Awareness Through Education<br>Atlanta</td>
      <td>0.031746</td>
      <td>0.031746</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>695896</td>
      <td>Richard Onishi (D)<br><br>House of Representatives, District 2</td>
      <td>Richard Onishi (D)<br>House of Representatives, District 2</td>
      <td>0.018182</td>
      <td>0.018182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>813780</td>
      <td>Governor John Waihee</td>
      <td>Governor John Waihee</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1002135</td>
      <td>Russell Kokubun (D)</td>
      <td>RUSSELL KOKUBUN (D)</td>
      <td>0.631579</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1040407</td>
      <td>Stephen Yamashiro (D)</td>
      <td>Stephen Yamashiro (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1167267</td>
      <td>Wendell Kaehuaea (R)</td>
      <td>```<br>WENDELL KAEHAUAEEA (R)<br>```</td>
      <td>0.766667</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1194394</td>
      <td>Lorraine Inouye (D)</td>
      <td>Lorraine Inouye (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-720cg560 (2 rows)</td>
      <td>273006</td>
      <td>Marcus Oshiro<br><br>House Majority Leader<br><br>Hawaii Legislature</td>
      <td>Marcus Oshiro<br>House Majority Leader<br>Hawaii Legislature</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-720cg58f (1 rows)</td>
      <td>638639</td>
      <td>Michael Kliks<br><br>President<br><br>Hawaii Beekeepers Association</td>
      <td>MICHAEL KLIKS<br>PRESIDENT<br>HAWAII BEEKEEPERS ASSOCIATION</td>
      <td>0.830189</td>
      <td>0.037736</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-720cg5db (15 rows)</td>
      <td>867000</td>
      <td>Sen. Malama Solomon</td>
      <td>Sen. Malama Solomon</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-720cg5db (15 rows)</td>
      <td>1013780</td>
      <td>Reverend Chris Eng<br><br>United Church of Christ</td>
      <td>Reverend Chris Eng<br>United Church of Christ</td>
      <td>0.023810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hxtv (4 rows)</td>
      <td>252386</td>
      <td>John Garibaldi<br><br>CEO<br><br>Hawaii Superferry</td>
      <td>JOHN GARIBALDI<br>CEO HAWAII SUPERFERRY</td>
      <td>0.777778</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hxtv (4 rows)</td>
      <td>676009</td>
      <td>Edgy Lee<br><br>PacificNetwork.tv</td>
      <td>Edgy Lee<br>PacificNetwork.tv</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>223023</td>
      <td>FRANK FASI (R)<br><br>Honolulu Mayor</td>
      <td>FRANK FASI (R)<br>HONOLULU MAYOR</td>
      <td>0.413793</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>319152</td>
      <td>CHRIS HART<br><br>Maui Planning Director</td>
      <td>CHRIS HART<br>MAUI PLANNING DIRECTOR</td>
      <td>0.545455</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>364765</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>```<br>HANNIBAL TAVARES (R)<br>MAUI MAYOR<br>```</td>
      <td>0.410256</td>
      <td>0.230769</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>417150</td>
      <td>CHRIS HART<br><br>Maui Planning Director</td>
      <td>CHRIS HART<br>MAUI PLANNING DIRECTOR</td>
      <td>0.545455</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>452019</td>
      <td>COLIN CAMERON<br><br>President<br><br>Maui Land and Pineapple Co.</td>
      <td>GOLIN CAMERON<br>PRESIDENT<br>MAUL LAND AND PINEAPPLE CO.</td>
      <td>0.568627</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>554521</td>
      <td>ARNOLD MORGADO, JR. (D)<br><br>Chair, Honolulu City Council</td>
      <td>ARNOLD MORGADO, JR. (D)<br>Chair, Honolulu City Council</td>
      <td>0.019231</td>
      <td>0.019231</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>878879</td>
      <td>ARNOLD MORGADO, JR. (D)<br><br>Chair, Honolulu City Council</td>
      <td>ARNOLD MORGADO, JR. (D)<br>Chair, Honolulu City Council</td>
      <td>0.019231</td>
      <td>0.019231</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1050517</td>
      <td>JOANNE KAPOLOLA<br><br>Welfare Recipient</td>
      <td>JOANNE KAPOLA<br>WELFARE RECIPIENT</td>
      <td>0.548387</td>
      <td>0.096774</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1150250</td>
      <td>MARALYN KURSHALS<br><br>Human Rights Advocate</td>
      <td>MARALYN KURSHALS<br>HUMAN RIGHTS ADVOCATE</td>
      <td>0.447368</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1183383</td>
      <td>WINONA RUBIN<br><br>State Human Services Director</td>
      <td>WINONA RUBIN<br>STATE HUMAN SERVICES DIRECTOR</td>
      <td>0.547619</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmc5 (3 rows)</td>
      <td>96763</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmc5 (3 rows)</td>
      <td>350017</td>
      <td>Jim Wright<br><br>CEO, Century 21, All Islands</td>
      <td>JIM WRIGHT<br>CEO, CENTURY 21, ALL ISLANDS</td>
      <td>0.564103</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>145879</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM HAWAII EDITION</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>242009</td>
      <td>JEREMY HARRIS<br><br>Honolulu Managing Director</td>
      <td>JEREMY HARRIS<br>HONOLULU MANAGING DIRECTOR</td>
      <td>0.550000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>255255</td>
      <td>Rep. PAUL OSHIRO (D)<br><br>Transportation Comm. Chair</td>
      <td>Rep. Paul Oshiro (D)<br>Transportation Comm. Chair</td>
      <td>0.191489</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>310143</td>
      <td>JEREMY HARRIS<br><br>Honolulu Managing Director</td>
      <td>JEREMY HARRIS<br>HONOLU MANAGING DIRECTOR</td>
      <td>0.578947</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>349516</td>
      <td>DAVID KAHANU (D)<br><br>Honolulu City<br><br>Council Member</td>
      <td>DAVID KAHANU (D)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.533333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>393260</td>
      <td>DAVID KAHANU (D)<br><br>Honolulu City<br><br>Council Member</td>
      <td>DAVID KAHANU (D)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.533333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>407274</td>
      <td>Rep. PAUL OSHIRO (D)<br><br>Transportation Comm. Chair</td>
      <td>Rep. Paul Oshiro (D)<br>Transportation Comm. Chair</td>
      <td>0.191489</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>441642</td>
      <td>Sen. MARY-JANE McMURDO<br><br>(D) Waikiki-Moiliili</td>
      <td>SEN. MARY - JANE MCMURDO<br>(D) WAINKI-MOILII</td>
      <td>0.452381</td>
      <td>0.166667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>454888</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>608642</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>650517</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA<br>HONOLU STAR-BULLETIN</td>
      <td>0.527778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>696263</td>
      <td>BARBARA MARSHALL<br><br>TV-2 News</td>
      <td>BARBARA MARSHALL<br>TV-2 NEWS</td>
      <td>0.153846</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>730397</td>
      <td>GERALD KATO<br><br>KGMB News</td>
      <td>GERALD KATO<br>KGMB NEWS</td>
      <td>0.190476</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>811278</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA<br>HONOLU STAR-BULLETIN</td>
      <td>0.527778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>838505</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>1168001</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>1254254</td>
      <td>GERALD KATO<br><br>KGMB News</td>
      <td>GERALD KATO<br>KGMB NEWS</td>
      <td>0.190476</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>100400</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>281515</td>
      <td>Peter Schall<br><br>Senior Vice President<br><br>Hilton Hotels Corp.</td>
      <td>Peter Schall<br>Senior Vice President<br>Hilton Hotels Corp.</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>565632</td>
      <td>Karen Tiller<br><br>Executive Director<br><br>Hawaii Opera Theatre</td>
      <td>Karen Tiller<br>Executive Director<br>Hawaii Opera Theatre</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>154755</td>
      <td>RICHARD KELLEY<br><br>Outrigger Hotels</td>
      <td>RICHARD KELLEY<br>OUTRIGGER HOTELS</td>
      <td>0.451613</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>167401</td>
      <td>DUDLEY PRATT<br><br>Hawaiian Electric Industries</td>
      <td>DUDLEY PRATT<br>HAWAIIAN ELECTRIC INDUSTRIES</td>
      <td>0.585366</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>205772</td>
      <td>JOSEPH MAGALDI<br><br>Honolulu Deputy<br><br>Transportation Director</td>
      <td>JOSEPH MAGALDI<br>HONOLULU DEPUTY<br>TRANSPORTATION DIRECTOR</td>
      <td>0.629630</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>217518</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council<br><br>Transportation Chairman</td>
      <td>GARY GILL (D)<br>HONOLULU CITY COUNCIL<br>TRANSPORTATION CHAIRMAN</td>
      <td>0.644068</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>257758</td>
      <td>CLIFF SLATER<br><br>Committee on<br><br>Sensible Transit (C.O.S.T.)</td>
      <td>CLIFF SLATER<br>COMMITTEE ON SENSIBLE TRANSIT<br>(COST)</td>
      <td>0.632653</td>
      <td>0.163265</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>297531</td>
      <td>AMAR SAPPAL<br><br>Honolulu Rapid Transit <br><br>Administrator</td>
      <td>AMAR SAPPAL<br>HONOLULU RAPID TRANSIT ADMINISTRATOR</td>
      <td>0.666667</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>305772</td>
      <td>JOSEPH MAGALDI<br><br>Honolulu Deputy<br><br>Transportation Director</td>
      <td>JOSEPH MAGALDI<br>HONOLULU DEPUTY<br>TRANSPORTATION DIRECTOR</td>
      <td>0.629630</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>322256</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council<br><br>Transportation Chairman</td>
      <td>GARY GILL (D)<br>HONOLULU CITY COUNCIL<br>TRANSPORTATION CHAIRMAN</td>
      <td>0.644068</td>
      <td>0.033898</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>351151</td>
      <td>CLIFF SLATER<br><br>Committee on<br><br>Sensible Transit (C.O.S.T.)</td>
      <td>CLIFF SLATER<br>COMMITTEE ON SENSIBLE TRANSIT<br>(G.O.S.T.)</td>
      <td>0.528302</td>
      <td>0.094340</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>457391</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>JEREMY HARRIS<br>MANAGING DIRECTOR<br>CITY & COUNTY OF HONOLULU</td>
      <td>0.578947</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>486386</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA<br>STATE TRANSPORTATION DIRECTOR</td>
      <td>0.641026</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>581014</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>JEREMY HARRIS<br>MANAGING DIRECTOR<br>CITY & COUNTY OF HONOLULU</td>
      <td>0.578947</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>636136</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA<br>STATE TRANSPORTATION DIRECTOR</td>
      <td>0.641026</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>773907</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>JEREMY HARRIS<br>MANAGING DIRECTOR<br>CITY & COUNTY OF HONOLULU</td>
      <td>0.578947</td>
      <td>0.035088</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>805405</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA<br>STATE TRANSPORTATION DIRECTOR</td>
      <td>0.641026</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1112779</td>
      <td>MAJ. JAMES FEMIA<br><br>Honolulu Police Department</td>
      <td>MAJ. JAMES FEMIA<br>HONOLU POLICE DEPARTMENT</td>
      <td>0.536585</td>
      <td>0.073171</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1131131</td>
      <td>MYLES SHINSATO<br><br>Hunting Supplies of Hawaii</td>
      <td>MYLES SHINSATO<br>HUNTING SUPPLIES OF HAWAII</td>
      <td>0.512195</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1304404</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA<br>HONOLU STAR-BULLETIN</td>
      <td>0.527778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-75r7szj2 (2 rows)</td>
      <td>556390</td>
      <td>Lisa Gibson<br><br>President<br><br>Hawaii Life Sciences Council</td>
      <td>Lisa Gibson<br>President<br>Hawaii Life Sciences Council</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>284017</td>
      <td>John Cummings<br><br>Oahu Civil Defense</td>
      <td>JOHN CUMMINGS<br>OAHU CIVIL DEFENSE</td>
      <td>0.750000</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>307407</td>
      <td>Courtney Brown<br><br>Government Efficiency Teams</td>
      <td>COURTNEY BROWN<br>GOVERNMENT EFFICIENCY TEAMS</td>
      <td>0.809524</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>966633</td>
      <td>Barry Weinman<br><br>Benefactor</td>
      <td>BARRY WEINMAN<br>BENEFACTOR</td>
      <td>0.833333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>1000767</td>
      <td>Virginia Weinman<br><br>Benefactor</td>
      <td>VIRGINIA WEINMAN<br>BENEFACTOR</td>
      <td>0.851852</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>1028128</td>
      <td>Joshua Hvidding<br><br>Student</td>
      <td>JOSHUA HVDDING<br>STUDENT</td>
      <td>0.863636</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>220254</td>
      <td>Bill Tobin<br><br>Tiki's Grill & Bar</td>
      <td>Bill Tobin<br>Tiki's Grill & Bar</td>
      <td>0.034483</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>650150</td>
      <td>Susan Todani<br><br>Director of Investments<br><br>Kamehameha Schools</td>
      <td>Susan Todani<br>Director of Investments<br>Kamehameha Schools</td>
      <td>0.036364</td>
      <td>0.036364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>728028</td>
      <td>Rosalind Schurgin<br><br>Executive Vice President<br><br>Festival Companies</td>
      <td>Rosalind Schurgin<br>Executive Vice President<br>Festival Companies</td>
      <td>0.032787</td>
      <td>0.032787</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>831131</td>
      <td>Scott Williams<br><br>General Manager<br><br>Lex Brodie's</td>
      <td>SCOTT WILLIAMS<br>GENERAL MANAGER<br>LEX BRODIE'S</td>
      <td>0.767442</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>203770</td>
      <td>HOALIKU DRAKE<br><br>Dept. of Hawaiian Homelands<br><br>Director</td>
      <td>HOALIKU DRAKE<br>DEPT. OF HAWAIIAN HOMELANDS<br>DIRECTOR</td>
      <td>0.580000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>217885</td>
      <td>NORMA WONG<br><br>Governor's Administrative<br><br>Assistant</td>
      <td>NORMA WONG<br>GOVERNOR'S ADMINISTRATIVE ASSISTANT</td>
      <td>0.695652</td>
      <td>0.065217</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>229396</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>238772</td>
      <td>NORMA WONG<br><br>Governor's Administrative<br><br>Assistant</td>
      <td>NORMA WONG<br>GOVERNOR'S ADMINISTRATIVE ASSISTANT</td>
      <td>0.695652</td>
      <td>0.065217</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>281782</td>
      <td>HOALIKU DRAKE<br><br>Dept. of Hawaiian Homelands<br><br>Director</td>
      <td>HOALIKU DRAKE<br>DEPT. OF HAWAIIAN HOMELANDS DIRECTOR</td>
      <td>0.600000</td>
      <td>0.060000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>306773</td>
      <td>BILLIE BEAMER<br><br>Former Dept. of Hawaiian <br><br>Homelands Director</td>
      <td>BILLIE BEAMER<br>FORMER DEPT. OF HAWAIIAN HOMELANDS DIRECTOR</td>
      <td>0.614035</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>369002</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI<br>TRASK<br>GOVERNOR, KA LAHUI</td>
      <td>0.424242</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>417751</td>
      <td>FRENCHY DeSOTO<br><br>Trustee<br><br>Office of Hawaiian Affairs</td>
      <td>FRENCHY DESOTO<br>TRUSTEE<br>OFFICE OF HAWAIIAN AFFAIRS</td>
      <td>0.591837</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>454888</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI<br>TRASK<br>GOVERNOR, KA LAHUAI</td>
      <td>0.441176</td>
      <td>0.088235</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>533901</td>
      <td>FRENCHY DeSOTO<br><br>Trustee<br><br>Office of Hawaiian Affairs</td>
      <td>FRENCHY DESOTO<br>TRUSTEE<br>OFFICE OF HAWAIIAN AFFAIRS</td>
      <td>0.591837</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>612145</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI<br>TRASK<br>GOVERNOR, KA LAHUI</td>
      <td>0.424242</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>826760</td>
      <td>EARL ARRUDA<br><br>President<br><br>Hawaii State Teachers Assn.</td>
      <td>EARL ARRUDA<br>PRESIDENT<br>HAWAII STATE TEACHERS ASSN.</td>
      <td>0.591837</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>881882</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent of Schools</td>
      <td>Charles Toguchi<br>SUPERINTENDENT OF SCHOOLS</td>
      <td>0.829268</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>950250</td>
      <td>DEBBI BOLTZ<br><br>Castle High Teacher</td>
      <td>DEBBI BOLTZ<br>CASTLE HIGH TEACHER</td>
      <td>0.483871</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>967267</td>
      <td>JOHN DOLLY<br><br>Dean, UH College of Education</td>
      <td>JOHN DOLLY<br>DEAN, UH COLLEGE OF EDUCATION</td>
      <td>0.500000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1053253</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary <br><br>Committee Chair</td>
      <td>SEN. RON MENOR (D)<br>SENATE JUDICIARY COMMITTEE CHAIR</td>
      <td>0.549020</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1090657</td>
      <td>SEN. RICK REED (R)<br><br>Senate Minority Floor Leader</td>
      <td>SEN. RICK REED (R)<br>SENATE MINORITY FLOOR LEADER</td>
      <td>0.468085</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1116149</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R)<br>SENATE MINORITY LEADER</td>
      <td>0.418605</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1132132</td>
      <td>REP. WHITNEY ANDERSON (R)<br><br>Maunawili-Enchanted Lake</td>
      <td>REP. WHITNEY ANDERSON (R)<br>MAUNAWILI-ENCHANTED LAKES</td>
      <td>0.411765</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1196129</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors-Good Planning</td>
      <td>JOHN RADCLIFFE<br>GOOD NEIGHBORS-GOOD PLANNING</td>
      <td>0.511628</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-77fqzf2c (14 rows)</td>
      <td>578278</td>
      <td>NORMAN MIZUGUCHI (D)<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI (D)<br>SENATE PRESIDENT</td>
      <td>0.378378</td>
      <td>0.027027</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-77fqzf2c (14 rows)</td>
      <td>619653</td>
      <td>CATHY FOY</td>
      <td>CATHY FOY</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>99132</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>632633</td>
      <td>Rick Page<br><br>Director<br><br>Eastern Region of the Military Defense Commissary System</td>
      <td>Rick Page<br>Director<br>Eastern Region of the Military Defense Commissary System</td>
      <td>0.026667</td>
      <td>0.026667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>1300400</td>
      <td>Don Robbs<br><br>Easter Seals Hawaii</td>
      <td>DON ROBBS<br>EASTER SEALS HAWAII</td>
      <td>0.724138</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16p2 (2 rows)</td>
      <td>236136</td>
      <td>Mike Ruley<br><br>CEO<br><br>Hawaiian Telcom</td>
      <td>MIKE RULEY<br>CEO HAWAIIAN TELECOM</td>
      <td>0.741935</td>
      <td>0.129032</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16p2 (2 rows)</td>
      <td>887020</td>
      <td>Michael Kliks<br><br>Beekeeper</td>
      <td>MICHAEL KLIKS<br>BEEKEEPER</td>
      <td>0.826087</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79h44s0t (6 rows)</td>
      <td>648015</td>
      <td>Joshua Beil<br><br>President & CEO, Skywave Broadband<br><br>www.skywavebroadband.net</td>
      <td>JOSHUA BEIL<br>PRESIDENT & CEO, SKYWAVE BROADBAND<br>www.skywavebroadband.net</td>
      <td>0.450704</td>
      <td>0.028169</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79v15nz0 (5 rows)</td>
      <td>424157</td>
      <td>JAMES WAKATSUKI<br><br>SPEAKER OF THE HOUSE</td>
      <td>JAMES WAKATSUKI<br>SPEAKER OF HOUSE</td>
      <td>0.156250</td>
      <td>0.156250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79v15nz0 (5 rows)</td>
      <td>930764</td>
      <td>JAMES WAKATSUKI<br><br>SPEAKER OF THE HOUSE</td>
      <td>JAMES WAKATSUKI<br>SPEAKER OF HOUSE</td>
      <td>0.156250</td>
      <td>0.156250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>53654</td>
      <td>CEC HEFTEL</td>
      <td>CEC HEFTEL</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>117885</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>192392</td>
      <td>PAUL H. SNIDER</td>
      <td>PAUL H. SNIDER</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>257024</td>
      <td>TONY<br><br>HODGES</td>
      <td>TONY HODGES</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>322256</td>
      <td>PATSY T. MINK</td>
      <td>PATSY T. MINK</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>387154</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>```<br>WILLIAM K. "BILLY" KUAIAWA<br>```</td>
      <td>0.323529</td>
      <td>0.323529</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>451518</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>514281</td>
      <td>CEC HEFTEL</td>
      <td>CEC HEFTEL</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>570404</td>
      <td>JERRY BURRIS</td>
      <td>JERRY BURRIS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>679880</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>713647</td>
      <td>PATSY T. MINK</td>
      <td>PATSY T. MINK</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>782282</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>```<br>WILLIAM K. "BILLY" KUAIAWA<br>```</td>
      <td>0.323529</td>
      <td>0.323529</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>1068635</td>
      <td>TONY<br><br>HODGES</td>
      <td>TONY HODGES</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>1193760</td>
      <td>PAUL H. SNIDER</td>
      <td>PAUL H. SNIDER</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>1312779</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>254388</td>
      <td>Clint Arnoldus<br><br>PRESIDENT & CEO<br><br>CENTRAL PACIFIC BANK</td>
      <td>Clint Arnoldus<br>President & CEO<br>Central Pacific Bank</td>
      <td>0.490196</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>811144</td>
      <td>Michael Drace<br><br>YOUNG LAUNDRY & DRYCLEANING</td>
      <td>MICHAEL DRACE<br>YOUNG LAUNDRY & DRYCLEANING</td>
      <td>0.268293</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>1150250</td>
      <td>Andres Delfs<br><br>PRINCIPAL CONDUCTOR<br><br>HONOLULU SYMPHONY</td>
      <td>Andres Delfs<br>Principal Conductor<br>Honolulu Symphony</td>
      <td>0.640000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>281782</td>
      <td>Glenn Hong<br><br>CEO<br><br>Young Brothers</td>
      <td>GLENN HONG<br>CEO<br>YOUNG BROTHERS</td>
      <td>0.689655</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>558258</td>
      <td>Neil Anthony Sims<br><br>President<br><br>Kona Blue</td>
      <td>NEIL ANTHONY SIMS<br>PRESIDENT<br>KONA BLUE</td>
      <td>0.756757</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>852252</td>
      <td>Chris Scanlan<br><br>Investor<br><br>Trinity Restaurant Partners</td>
      <td>Chris Scanlan<br>Investor<br>Trinity Restaurant Partners</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>255255</td>
      <td>Debbie Goodwin<br><br>Keck Observatory</td>
      <td>Debbie Goodwin<br>Keck Observatory</td>
      <td>0.032258</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>499032</td>
      <td>Peter Shaindlin<br><br>Halekulani Corporation</td>
      <td>Peter Shaindlin<br>Halekulani Corporation</td>
      <td>0.026316</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>768001</td>
      <td>Mike Wright<br><br>A&B Properties</td>
      <td>Mike Wright<br>AB&B Properties</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>1030397</td>
      <td>Dustin Shindo<br><br>CEO<br><br>Hoku Scientific</td>
      <td>DUSTIN SHINDO<br>CEO HOKU SCIENTIFIC</td>
      <td>0.757576</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjcgk (13 rows)</td>
      <td>892259</td>
      <td>Reverend Chris Eng<br><br>United Church of Christ</td>
      <td>Reverend Chris Eng<br>United Church of Christ</td>
      <td>0.023810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjcgk (13 rows)</td>
      <td>982015</td>
      <td>Reverend Chris Eng<br><br>United Church of Christ</td>
      <td>Reverend Chris Eng<br>United Church of Christ</td>
      <td>0.023810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>242643</td>
      <td>FRED HOLSCHUH (D)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>FRED HOLSCHUH (D)<br>MAYOR CANDIDATE<br>COUNTY OF HAWAII</td>
      <td>0.560000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>360394</td>
      <td>KEIKO BONK (G)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>KEIKO BONK (G)<br>MAYORAL CANDIDATE<br>COUNTY OF HAWAII</td>
      <td>0.571429</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>562029</td>
      <td>HARRY KIM (R)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>HARRY KIM (R)<br>MAYORAL CANDIDATE<br>COUNTY OF HAWAII</td>
      <td>0.583333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk821 (4 rows)</td>
      <td>96396</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk821 (4 rows)</td>
      <td>619386</td>
      <td>Jenny Strand<br><br>Visitor</td>
      <td>```<br>Jenny Strand Visitor<br>```</td>
      <td>0.357143</td>
      <td>0.357143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-84zgn1v5 (3 rows)</td>
      <td>582149</td>
      <td>Greg O'Donnell<br><br>CEO<br><br>Damien School</td>
      <td>GREG O'DONNELL<br>CEO DAMIEN SCHOOL</td>
      <td>0.687500</td>
      <td>0.093750</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-84zgn1v5 (3 rows)</td>
      <td>966266</td>
      <td>Marsha Bemko<br><br>Producer<br><br>Antiques Road Show</td>
      <td>MARSHA BEMKO<br>PRODUCER<br>ANTIQUES ROAD SHOW</td>
      <td>0.775000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-86b2rm9c (4 rows)</td>
      <td>247881</td>
      <td>Nate Smith<br><br>CEO<br><br>Oceanic Cablevision</td>
      <td>Nate Smith<br>CEO<br>Oceanic Cablevision</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-86b2rm9c (4 rows)</td>
      <td>616149</td>
      <td>Mark Hudson<br><br>USDA Honolulu</td>
      <td>MARK HUDSON<br>USDA HONOLULU</td>
      <td>0.640000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>437638</td>
      <td>WARREN PRICE<br><br>Attorney General</td>
      <td>WARREN PRICE<br>ATTORNEY GENERAL</td>
      <td>0.482759</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>559626</td>
      <td>DANTE CARPENTER<br><br>Hawaii County Mayor</td>
      <td>DANTE CARPENTER<br>HAWAII COUNTY MAYOR</td>
      <td>0.428571</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>576777</td>
      <td>HANNIBAL TAVARES<br><br>Maui County Mayor</td>
      <td>HANNIBAL TAVARES<br>MAUI COUNTY MAYOR</td>
      <td>0.382353</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>1171905</td>
      <td>REP. ROLAND KOTANI (D)</td>
      <td>```<br>REP - ROLAND KOTANI (D)<br>```</td>
      <td>0.322581</td>
      <td>0.322581</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfxzgp (2 rows)</td>
      <td>331031</td>
      <td>Paul Brewbaker<br><br>Chief Economist<br><br>Bank of Hawaii</td>
      <td>Paul Brewbaker<br>Chief Economist<br>Bank of Hawaii</td>
      <td>0.044444</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>92125</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>152019</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>181515</td>
      <td>SEN. RICHARD WONG (D)<br><br>Senate President</td>
      <td>SEN. RICHARD WONG (D)<br>SENATE PRESIDENT</td>
      <td>0.368421</td>
      <td>0.026316</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>204638</td>
      <td>REP. DANIEL KIHANO (D)<br><br>House Speaker</td>
      <td>REP. DANIEL KIHANO (D)<br>HOUSE SPEAKER</td>
      <td>0.305556</td>
      <td>0.027778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>235636</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R)<br>SENATE MINORITY LEADER</td>
      <td>0.418605</td>
      <td>0.023256</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>302903</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>375375</td>
      <td>REP. ROMY CACHOLA (D)<br><br>Chair, House Committee on<br><br>Tourism</td>
      <td>REP ROMY CACHOLA (D)<br>Chair, House Committee on Tourism</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>398131</td>
      <td>RAY MALLOY<br><br>Ala Moana/Kakaako<br><br>Neighborhood Board</td>
      <td>RAY MALLOY<br>ALA MOANA / KAKAAKO<br>NEIGHBORHOOD BOARD</td>
      <td>0.632653</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>435769</td>
      <td>ROGER ULVELING<br><br>Director, Dept. of Business &<br><br>Economic Development</td>
      <td>ROGER ULVELING<br>DIRECTOR, DEPT. OF BUSINESS & ECONOMIC DEVELOPMENT</td>
      <td>0.600000</td>
      <td>0.046154</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>518385</td>
      <td>MARY SHIN<br><br>Merchants' Association</td>
      <td>MARY SHIN<br>MERCHANTS' ASSOCIATION</td>
      <td>0.593750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>558025</td>
      <td>SEN. MILTON HOLT (D)<br><br>Chair, Senate Tourism Committee</td>
      <td>SEN. MILTON HOLT (D)<br>Chair, Senate Tourism Committee</td>
      <td>0.019231</td>
      <td>0.019231</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>572639</td>
      <td>REP. WHITNEY ANDERSON (R)</td>
      <td>```<br>REP WHITNEY ANDERSON (R)<br>```</td>
      <td>0.281250</td>
      <td>0.281250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>591258</td>
      <td>SEN. CLAYTON HEE (D)</td>
      <td>SEN. CLAYTON HEE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>618385</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>757257</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>```<br>SEN. MALAMA SOLOMON (D)<br>```</td>
      <td>0.258065</td>
      <td>0.258065</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>796263</td>
      <td>SEN. CLAYTON HEE (D)</td>
      <td>SEN. CLAYTON HEE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>903136</td>
      <td>SEN. MAMORU YAMASAKI (D)<br><br>Chair, Senate Ways and means<br><br>Committee</td>
      <td>```<br>SEN. MAMORU YAMASAKI (D)<br>Chair, Senate Ways and Means Committee<br>```</td>
      <td>0.169014</td>
      <td>0.154930</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>944144</td>
      <td>REP. HARVEY TAJIRI (D)</td>
      <td>```<br>REP HARVEY TAJIRI (D)<br>```</td>
      <td>0.310345</td>
      <td>0.310345</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1067901</td>
      <td>JOSEPH CONANT<br><br>Director, Housing Finance and<br><br>Development Corporation</td>
      <td>JOSEPH CONANT<br>DIRECTOR, HOUSING FINANCE AND<br>DEVELOPMENT CORPORATION</td>
      <td>0.656716</td>
      <td>0.029851</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1093126</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>```<br>GOVERNOR JOHN WAIHEE<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1189756</td>
      <td>REP. BRIAN TANIGUCHI (D)<br><br>Chairman - House Committee<br><br>on Higher Education</td>
      <td>REP. BRIAN-TANIGUCHI (D)<br>Chairman - House Committee on Higher Education</td>
      <td>0.056338</td>
      <td>0.056338</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1403136</td>
      <td>SEN. RUSSELL BLAIR (D)</td>
      <td>SEN. RUSSELL BLAIR (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>240407</td>
      <td>REP. JOSEPH SOUKI (D)<br><br>House Finance Comm. Chair</td>
      <td>```<br>REP. JOSEPH SOUKI (D)<br>HOUSE FINANCE COMM. CHAIR<br>```</td>
      <td>0.472727</td>
      <td>0.163636</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>341642</td>
      <td>SEN. LEHUA FERNANDES<br><br>SALLING (D)<br><br>Senate Transportation<br><br>Committee Chair</td>
      <td>SEN. LEHUA FERNANDES<br>SALLING (D)<br>SENATE TRANSPORTATION COMMITTEE CHAIR</td>
      <td>0.485714</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>396029</td>
      <td>REP. ED BYBEE (D)<br><br>Mokapu-Kailua</td>
      <td>REP. ED BYBEE (D)<br>MOKAPU-KAILUA</td>
      <td>0.354839</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>406640</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Makiki-Ala Moana</td>
      <td>SEN. RUSSELL BLAIR (D)<br>MAKIKI - ALA MOANA</td>
      <td>0.341463</td>
      <td>0.073171</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>425626</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>451251</td>
      <td>SEN. MIKE COZIER (D)<br><br>Senate Housing<br><br>Committee Chair</td>
      <td>SEN. MIKE COZIER (D)<br>SENATE HOUSING COMMITTEE CHAIR</td>
      <td>0.509804</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>472139</td>
      <td>SEN. STEVE COBB (D)<br><br>Waialae-Palolo</td>
      <td>SEN. STEVE COBB (D)<br>WAIALAE-PALO</td>
      <td>0.375000</td>
      <td>0.093750</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>557257</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>607007</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA<br>HONOLU STAR-BULLETIN</td>
      <td>0.527778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>692759</td>
      <td>DAN BOYLAN<br><br>Honolulu Magazine</td>
      <td>DAN BOYLAN<br>HONOLU MAGAZINE</td>
      <td>0.576923</td>
      <td>0.115385</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>772773</td>
      <td>BARBARA MARSHALL<br><br>KHON TV-2</td>
      <td>BARBARA MARSHALL<br>KHON TV-2</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>933400</td>
      <td>BARBARA MARSHALL<br><br>KHON TV-2</td>
      <td>BARBARA MARSHALL<br>KHON TV-2</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>1002002</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA<br>HONOLU STAR-BULLETIN</td>
      <td>0.527778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>1413146</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS<br>HONOLULU ADVERTISER</td>
      <td>0.531250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89r22hxx (3 rows)</td>
      <td>243877</td>
      <td>Rex Johnson<br><br>CEO<br><br>Hawaii Tourism Authority</td>
      <td>REX JOHNSON<br>CEO<br>HAWAII TOURISM AUTHORITY</td>
      <td>0.725000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89r22hxx (3 rows)</td>
      <td>645512</td>
      <td>Jim Ueno<br><br>Aloha Street</td>
      <td>JIM UENO<br>ALOHA STREET</td>
      <td>0.714286</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3dxg (6 rows)</td>
      <td>759760</td>
      <td>AL HARRINGTON</td>
      <td>AL HARRINGTON</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3dxg (6 rows)</td>
      <td>1156890</td>
      <td>DANIEL KIHANO<br><br>Speaker of the House</td>
      <td>DANIEL KIHANO<br>SPEAKER OF THE HOUSE</td>
      <td>0.470588</td>
      <td>0.029412</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3f8d (2 rows)</td>
      <td>506773</td>
      <td>REP. ANDREW LEVIN (D)<br><br>Chair, Water, Land Use<br><br>Dev., & Hawaiian Affairs Com.</td>
      <td>REP ANDREW LEVIN<br>(D) CHAIR, WATER, LAND USE<br>DEV, & HAWAIIAN AFFAIRS COM.</td>
      <td>0.500000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3f8d (2 rows)</td>
      <td>628629</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>```<br>SEN. MALAMA SOLOMON (D)<br>```</td>
      <td>0.258065</td>
      <td>0.258065</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-90dv49tw (1 rows)</td>
      <td>268268</td>
      <td>JOHN WAIHEE<br><br>Governor</td>
      <td>JOHN WAIHEE GOVERNOR</td>
      <td>0.450000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63bg (2 rows)</td>
      <td>281281</td>
      <td>Sam Shomaker<br><br>Interim Dean<br><br>John A. Burns School of Medicine</td>
      <td>SAM SHOMAKER<br>INTERIM DEAN<br>JOHN A. BURNS SCHOOL OF MEDICINE</td>
      <td>0.706897</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63bg (2 rows)</td>
      <td>559126</td>
      <td>Steve Little<br><br>Director<br><br>Honolulu Academy of Arts</td>
      <td>STEVE LITTLE<br>DIRECTOR<br>HONOLULU ACADEMY OF ARTS</td>
      <td>0.782609</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>198131</td>
      <td>MAURICE SAPIENZA</td>
      <td>MAURICE SAPIENZA</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>270270</td>
      <td>KEITH KANESHIRO</td>
      <td>KEITH KANESHIRO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>327027</td>
      <td>CHARLES MARSLAND</td>
      <td>CHARLES MARSLAND</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>423023</td>
      <td>RICHARD BORRECA</td>
      <td>RICHARD BORREGA</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>446013</td>
      <td>MAURICE SAPIENZA</td>
      <td>MAURICE SAPIENZA</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>537771</td>
      <td>BART FREDO</td>
      <td>```<br>BART FREDO<br>```</td>
      <td>0.444444</td>
      <td>0.444444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>563130</td>
      <td>KEITH KANESHIRO</td>
      <td>KEITH KANESHIRO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>654888</td>
      <td>CHARLES MARSLAND</td>
      <td>CHARLES MARSLAND</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>787387</td>
      <td>MAURICE SAPIENZA</td>
      <td>MAURICE SAPIENZA</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>835135</td>
      <td>CHARLES MARSLAND</td>
      <td>```<br>CHARLES MARSLAND<br>```</td>
      <td>0.333333</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>899132</td>
      <td>KEITH KANESHIRO</td>
      <td>KEITH KANESHIRO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>971004</td>
      <td>BART FREDO</td>
      <td>```<br>BART FREDO<br>```</td>
      <td>0.444444</td>
      <td>0.444444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>998031</td>
      <td>CHARLES MARSLAND</td>
      <td>```<br>CHARLES MARSLAND<br>```</td>
      <td>0.333333</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>1291391</td>
      <td>RICHARD BORRECA</td>
      <td>RICHARD BORREGA</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-91sf7w98 (2 rows)</td>
      <td>648515</td>
      <td>RICHARD WONG<br><br>SENATE PRESIDENT</td>
      <td>RICHARD WONG<br>SENATE PRESIDENT</td>
      <td>0.034483</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>98632</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN<br>NEWSMAKERS</td>
      <td>0.476190</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>177644</td>
      <td>RANDALL KUSAKA (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>RANDALL KUSAKA<br>(D)<br>State Rep.<br>Dist. 33 Candidate<br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.043956</td>
      <td>0.043956</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>196129</td>
      <td>BLAKE OSHIRO (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>```<br>BLAKE OSHIRO (D)<br>State Rep. DIST. 33 CANDIDATE<br>Red Hill, Halawa Heights, Pearlridge, Aiea<br>```</td>
      <td>0.216495</td>
      <td>0.103093</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>452886</td>
      <td>RANDALL KUSAKA (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>RANDALL KUSAKA (D)<br>State Rep., Dist. 33 Candidate<br>Red Hill, Halawa Heights, Pearlridge, Aica</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>509510</td>
      <td>BLAKE OSHIRO (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>Blake Oshiro (D)<br>State Rep.<br>Dist. 33 Candidate<br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.134831</td>
      <td>0.033708</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>206640</td>
      <td>Glenn Hong<br><br>President<br><br>Young Brothers</td>
      <td>GLENN HONG<br>PRESIDENT<br>YOUNG BROTHERS</td>
      <td>0.800000</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>476643</td>
      <td>Russell Kokubun<br><br>State Senator</td>
      <td>RUSSELL KOKUBUN<br>STATE SENATOR</td>
      <td>0.793103</td>
      <td>0.034483</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>851151</td>
      <td>Mark Schiebe<br><br>Parson Brinkerhoff</td>
      <td>MARK SCHIEBE<br>PARSON BRINKERHOFF</td>
      <td>0.806452</td>
      <td>0.032258</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>1204404</td>
      <td>Maile Meyer<br><br>Entrepreneur</td>
      <td>MAILE MEYER<br>ENTREPRENEUR</td>
      <td>0.833333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>99132</td>
      <td>LYNETTE LO TOM<br><br>Capitol Spotlight</td>
      <td>LYNETTE LO TOM<br>CAPITOL SPOTLIGHT</td>
      <td>0.468750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>142776</td>
      <td>JOHN WAIHEE<br><br>Governor</td>
      <td>JOHN WAIHEE<br>GOVERNOR</td>
      <td>0.400000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>339406</td>
      <td>JOHN LEWIN<br><br>Dir., Dept. of Health</td>
      <td>JOHN LEWIN<br>DIR., DEPT. OF HEALTH</td>
      <td>0.406250</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>476777</td>
      <td>ILIMA PIIANAIA<br><br>Chair<br><br>Hawaiian Homes Commission</td>
      <td>ILIMA PIANIA<br>Chair<br>Hawaiian Homes Commission</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>618385</td>
      <td>CHARLES TOGUCHI<br><br>Supt., Dept. of Education</td>
      <td>CHARLES TOGUCHI<br>SUPT., DEPT. OF EDUCATION</td>
      <td>0.414634</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>106907</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM HAWAII EDITION</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>150751</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>LT. GOV. BEN CAEYETANO (D)</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>155522</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council Member</td>
      <td>GARY GILL (D)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.523810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>175509</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>LT. GOV. BEN CAEYETANO (D)</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>199399</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Republican Candidate<br><br>for Governor</td>
      <td>REP. FRED HEMMINGS (R)<br>Republican Candidate for Governor</td>
      <td>0.053571</td>
      <td>0.053571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>228896</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council Member</td>
      <td>GARY GILL (D)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.523810</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>251652</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>265265</td>
      <td>D. G. "ANDY" ANDERSON<br><br>Republican Party Chairman</td>
      <td>D.G. "ANDY" ANDERSON<br>REPUBLICAN PARTY CHAIRMAN</td>
      <td>0.478261</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>304771</td>
      <td>JOHN HENRY FELIX (R)<br><br>Honolulu City Council Member</td>
      <td>JOHN HENRY FELIX (R)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.448980</td>
      <td>0.020408</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>315382</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Republican Candidate<br><br>for Governor</td>
      <td>REP. FRED HEMINGS (R)<br>REPUBLICAN CANDIDATE FOR GOVERNOR</td>
      <td>0.563636</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>361528</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>```<br>GOV. JOHN WAIHEE (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>401268</td>
      <td>ARNOLD MORGADO (D)<br><br>Honolulu City Council Chair</td>
      <td>ARNOLD MORGADO (D)<br>HONOLULU CITY COUNCIL CHAIR</td>
      <td>0.456522</td>
      <td>0.021739</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>429630</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>447014</td>
      <td>JOHN HENRY FELIX (R)<br><br>Honolulu City Council Member</td>
      <td>JOHN HENRY FELIX (R)<br>HONOLULU CITY COUNCIL MEMBER</td>
      <td>0.448980</td>
      <td>0.020408</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>453387</td>
      <td>ARNOLD MORGADO (D)<br><br>Honolulu City Council Chair</td>
      <td>ARNOLD MORGADO (D)<br>HONOLULU CITY COUNCIL CHAIR</td>
      <td>0.456522</td>
      <td>0.021739</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>501134</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>```<br>GOV. JOHN WAIHEE (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg46k (3 rows)</td>
      <td>275642</td>
      <td>Thom Nulty<br><br>Aloha Airlines</td>
      <td>Thom Nulty<br>Aloha Airlines</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg46k (3 rows)</td>
      <td>570137</td>
      <td>Emy Yamauchi-Wong<br><br>Altres Staffing</td>
      <td>```<br>Emy Yamauchi-Wong<br>Altres Staffing<br>```</td>
      <td>0.219512</td>
      <td>0.219512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg479 (2 rows)</td>
      <td>861628</td>
      <td>Peter Vincent<br><br>President<br><br>AIA Hawaii</td>
      <td>```<br>PETER VINCENT<br>PRESIDENT<br>AIA HAWAII<br>```</td>
      <td>0.785714</td>
      <td>0.238095</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>242509</td>
      <td>Bill Boyer<br><br>CEO, Mokulele Air</td>
      <td>BILL BOYER<br>CEO, MOKULELE AIR</td>
      <td>0.607143</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>689156</td>
      <td>Robin Puanani Danner<br><br>Native Hawaiian Economic Alliance</td>
      <td>Robin Puuanani Danner<br>Native Hawaiian Economic Alliance</td>
      <td>0.036364</td>
      <td>0.036364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>995128</td>
      <td>Chuck Steilen<br><br>Dean of the College of Business Administration<br><br>Hawaiian Pacific University</td>
      <td>Chuck Steilen<br>Dean of the College of Business Administration<br>Hawaii Pacific University</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-94vhhwww (3 rows)</td>
      <td>279780</td>
      <td>Chad Jensen<br><br>ARDA Hawaii</td>
      <td>```<br>CHAD JENSEN<br>ARDA HAWAII<br>```</td>
      <td>0.709677</td>
      <td>0.290323</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-94vhhwww (3 rows)</td>
      <td>1313780</td>
      <td>Barbara Campbell<br><br>VP<br><br>Outrigger</td>
      <td>```<br>BARBARA CAMPBELL<br>VP OUTTRIGGER<br>```</td>
      <td>0.868421</td>
      <td>0.315789</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>148148</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM HAWAII EDITION</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>195262</td>
      <td>HENRY FOLEY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>HENRY FOLEY, PH.D.<br>STATE DEPARTMENT HEALTH DIRECTOR</td>
      <td>0.529412</td>
      <td>0.137255</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>255756</td>
      <td>MARK DILLEN STITHAM, M.D.<br><br>President, Hawaii<br><br>Psychiatric Society</td>
      <td>MARK DILLEN<br>STITHAM, M.D.<br>PRESIDENT, HAWAII PSYCHIATRIC SOCIETY</td>
      <td>0.523810</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>288889</td>
      <td>HENRY FOLEY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>HENRY FOLEY, PH.D.<br>STATE DEPUTY HEALTH DIRECTOR</td>
      <td>0.489362</td>
      <td>0.021277</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>318385</td>
      <td>MARK DILLEN STITHAM, M.D.<br><br>President, Hawaii<br><br>Psychiatric Society</td>
      <td>MARK DILLEN<br>STITHAM, M.D.<br>PRESIDENT, HAWAII PSYCHIATRIC SOCIETY</td>
      <td>0.523810</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>350017</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>KELLY DEAN<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.571429</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>362629</td>
      <td>PETER SYBINSKY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>```<br>PETER SYBINSKY, PH.D.<br>STATE DEPARTY HEALTH DIRECTOR<br>```</td>
      <td>0.542373</td>
      <td>0.186441</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>388255</td>
      <td>REP. MICHAEL LIU (R)<br><br>House Minority Leader</td>
      <td>REP. MICHAEL LIU (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.404762</td>
      <td>0.023810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>452386</td>
      <td>JOHN HENRY FELIX (R)<br><br>City Council Member</td>
      <td>JOHN HENRY FELIX (R)<br>CITY COUNCIL MEMBER</td>
      <td>0.375000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>488655</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>JOHN LEWIN, MD<br>DIRECTOR STATE DEPT. OF HEALTH</td>
      <td>0.488889</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>531765</td>
      <td>AH QUON McELRATH<br><br>Welfare Advocate</td>
      <td>AH QUON MCELRATH<br>WELFARE ADVOCATE</td>
      <td>0.454545</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>559626</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>JOHN LEWIN, MD<br>DIRECTOR STATE DEPT. OF HEALTH</td>
      <td>0.488889</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>620654</td>
      <td>AH QUON McELRATH<br><br>Welfare Advocate</td>
      <td>AH QUON MCELRATH<br>WELFARE ADVOCATE</td>
      <td>0.454545</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>766767</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>JOHN LEWIN, MD<br>DIRECTOR STATE DEPT. OF HEALTH</td>
      <td>0.488889</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>985018</td>
      <td>CHRIS JONES<br><br>Aloha Greens Co-chairman</td>
      <td>CHRIS JONES<br>ALOHA GREENS GO-CHAIRMAN</td>
      <td>0.555556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>1042876</td>
      <td>ALAN BURDICK<br><br>Attorney</td>
      <td>```<br>ALAN BURDICK ATTORNEY<br>```</td>
      <td>0.586207</td>
      <td>0.344828</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95j9kphn (4 rows)</td>
      <td>246513</td>
      <td>Roger Kaiwi<br><br>Captain Cook Coffee Co.</td>
      <td>ROGER KAWI<br>Captain Cook Coffee Co.</td>
      <td>0.264706</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95j9kphn (4 rows)</td>
      <td>348782</td>
      <td>Jim Wayman<br><br>Hawaii Coffee Co.</td>
      <td>JIM WAYMAN<br>HAWAII COFFEE CO.</td>
      <td>0.678571</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>99266</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus<br>PNB FRIDAY</td>
      <td>0.347826</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>245012</td>
      <td>Nick Buchanan<br><br>Waikiki Watermark</td>
      <td>NICK BUCHANAN<br>WAIKI WATERMARK</td>
      <td>0.862069</td>
      <td>0.103448</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>541775</td>
      <td>Pat Bustamente<br><br>CEO, Pacific LightNet</td>
      <td>PAT BUSTAMANTE<br>CEO, PACIFIC LIGHTNET</td>
      <td>0.666667</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>265399</td>
      <td>Joe Toy<br><br>CEO<br><br>HOSPITALITY ADVISORS</td>
      <td>JOE TOY<br>CEO<br>HOSPITALITY ADVISORS</td>
      <td>0.187500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>583650</td>
      <td>Bernard Ho<br><br>INTERIM CEO<br><br>DAMIEN SCHOOL</td>
      <td>BERNARD HO<br>INTERIM CEO<br>DAMIEN SCHOOL</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>915015</td>
      <td>Kippen de Alba Chu<br><br>IOLANI PALACE</td>
      <td>Kippen de Alba Chu<br>Iolani Palace</td>
      <td>0.343750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>90390</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN<br>NEWSMAKERS</td>
      <td>0.476190</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>235002</td>
      <td>CHARLOTTE NEKOTA (D)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>CHARLOTTE NEKOTA (D)<br>State Rep. Dist. 39 Candidate<br>Wheeler-Mililani</td>
      <td>0.044776</td>
      <td>0.044776</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>319253</td>
      <td>GUY ONTAI (R)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>GUY ONTAI (R)<br>State Rep, Dist. 39 Candidate<br>Wheeler-Mifflani</td>
      <td>0.100000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>501768</td>
      <td>CHARLOTTE NEKOTA (D)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>CHARLOTTE NEKOTA (D)<br>State Rep. Dist. 39 Candidate<br>WHEELER-MILLILANI</td>
      <td>0.235294</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>637004</td>
      <td>GUY ONTAI (R)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>GUY ONTAI (R)<br>State Rep., Dist. 39 Candidate<br>Wheeler-Mifflani</td>
      <td>0.098361</td>
      <td>0.098361</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>993393</td>
      <td>JOE GOMES (R)<br><br>State Rep. Dist. 51 Candidate<br><br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>JOE GOMES (R)<br>State Rep., Dist. 51<br>Candidate<br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>1168635</td>
      <td>JOE GOMES (R)<br><br>State Rep. Dist. 51 Candidate<br><br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>JOE GOMES (R)<br>State Rep. Dist. 51 Candidate<br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>0.027397</td>
      <td>0.027397</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr507 (3 rows)</td>
      <td>278512</td>
      <td>Roger Kaiwi<br><br>Captain Cook Coffee Co.</td>
      <td>ROGER KAWI<br>Captain Cook Coffee Co.</td>
      <td>0.264706</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr507 (3 rows)</td>
      <td>697631</td>
      <td>Cary Tagawa<br><br>Actor</td>
      <td>Cary Tagawa<br>Actor</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr51z (3 rows)</td>
      <td>262896</td>
      <td>Ron Baird<br><br>EXECUTIVE DIRECTOR<br><br>NELHA</td>
      <td>RON BAIRD<br>EXECUTIVE DIRECTOR<br>NELHA</td>
      <td>0.235294</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr51z (3 rows)</td>
      <td>578645</td>
      <td>Amy Hammond<br><br>MADE IN HAWAII FESTIVAL</td>
      <td>AMY HAMMOND<br>MADE IN HAWAII FESTIVAL</td>
      <td>0.257143</td>
      <td>0.028571</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttgb (10 rows)</td>
      <td>103136</td>
      <td>NORMAN MIZUGUCHI<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI<br>SENATE PRESIDENT</td>
      <td>0.424242</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttgb (10 rows)</td>
      <td>559026</td>
      <td>NORMAN MIZUGUCHI<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI<br>SENATE PRESIDENT</td>
      <td>0.424242</td>
      <td>0.030303</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>81148</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX<br>ELECTION LIVE</td>
      <td>0.037037</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>169269</td>
      <td>PENNY NAKAMURA<br><br>ELECTION LIVE</td>
      <td>PENNY NAKAMURA<br>ELECTION LIVE</td>
      <td>0.035714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>189523</td>
      <td>JERRY ROTHSTEIN<br><br>Hapuna Beach Spokesman</td>
      <td>JERRY ROTHSTEIN<br>HAPUA BEACH SPOKESMAN</td>
      <td>0.486486</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>308375</td>
      <td>WILLIAM MIELCKE<br><br>Vice-President<br><br>Mauna Kea Properties</td>
      <td>WILLIAM MIELCKE<br>VICE-PRESIDENT<br>MAUNA KEA PROPERTIES</td>
      <td>0.549020</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>321655</td>
      <td>RUDY LEGASPI<br><br>Hawaii County Clerk</td>
      <td>RUDY LEGASPI<br>HAWAII COUNTY CLERK</td>
      <td>0.468750</td>
      <td>0.031250</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>349650</td>
      <td>JERRY ROTHSTEIN<br><br>Hapuna Beach Spokesman</td>
      <td>JERRY ROTHSTEIN<br>HAUPUNA BEACH SPOKESMAN</td>
      <td>0.487179</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>423156</td>
      <td>LYNETTE LO TOM<br><br>ELECTION LIVE</td>
      <td>LYNETTE LO TOM<br>ELECTION LIVE</td>
      <td>0.035714</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>434134</td>
      <td>ANDREW LEVIN (D)</td>
      <td>ANDREW LEVIN (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>499633</td>
      <td>ROBERT N. HERKES (R)</td>
      <td>ROBERT N. HERKES (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>606640</td>
      <td>ANDREW LEVIN (D)</td>
      <td>ANDREW LEVIN (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>712012</td>
      <td>ROBERT N. HERKES (R)</td>
      <td>ROBERT N. HERKES (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>986386</td>
      <td>JACKIE YOUNG<br><br>Hawaii Women's<br><br>Political Caucus</td>
      <td>JACKIE YOUNG<br>HAWAII WOMEN'S POLITICAL CAUCUS</td>
      <td>0.590909</td>
      <td>0.068182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1023156</td>
      <td>EILEEN ANDERSON (D)<br><br>Former Honolulu Mayor</td>
      <td>Eileen Anderson (D)<br>Former Honolulu Mayor</td>
      <td>0.317073</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1064264</td>
      <td>SENA GATES (D)<br><br>Former City Council Candidate</td>
      <td>SENA GATES (D)<br>FORMER CITY COUNCIL CANDIDATE</td>
      <td>0.522727</td>
      <td>0.022727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1186019</td>
      <td>JUDY SOBIN (D)<br><br>Former City Council Candidate</td>
      <td>```<br>JUDY SOBIN (D)<br>Former City Council Candidate<br>```</td>
      <td>0.173077</td>
      <td>0.173077</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>199266</td>
      <td>TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>```<br>TOM OKAMURA (D) HOUSE MAJORITY LEADER<br>```</td>
      <td>0.577778</td>
      <td>0.222222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>638005</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>866266</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKOA (R)<br>HOUSE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>68902</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>```<br>GOV. JOHN WAIHEE (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>126026</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>```<br>GOV. JOHN WAIHEE (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>165766</td>
      <td>REP. MIKE CROZIER (D)</td>
      <td>```<br>REP MIKE CROZIER (D)<br>```</td>
      <td>0.321429</td>
      <td>0.321429</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>202503</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>521889</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>552252</td>
      <td>REP. ANDREW LEVIN (D)</td>
      <td>REP ANDREW LEVIN (D)</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>567501</td>
      <td>SEN. PATSY YOUNG (D)</td>
      <td>```<br>SEN. PATSY YOUNG (D)<br>```</td>
      <td>0.285714</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>596029</td>
      <td>REP. WAYNE METCALF (D)</td>
      <td>```<br>REP WAYNE METCALF (D)<br>```</td>
      <td>0.310345</td>
      <td>0.310345</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>614381</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>```<br>REP. BRIAN TANIGUCHI (D)<br>```</td>
      <td>0.250000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>643010</td>
      <td>SEN. ELOISE YAMASHITA-<br><br>TUNGPALAN (D)</td>
      <td>```<br>SEN. ELOISE YAMASHITA- TUNGPALAN (D)<br>```</td>
      <td>0.227273</td>
      <td>0.227273</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>686386</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>875876</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>REP MIKE O'KIEFFE (R)</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>938772</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>REP MIKE O'KIEFFE (R)</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1015015</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1096396</td>
      <td>REP. MAZIE HIRONO (D)<br><br>Chair, Consumer Protection<br><br>Committee</td>
      <td>```<br>REP MAZIE HIRONO (D)<br>Chair, Consumer Protection Committee<br>```</td>
      <td>0.184615</td>
      <td>0.184615</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1172906</td>
      <td>REP. MIKE CROZIER (D)</td>
      <td>```<br>REP MIKE CROZIER (D)<br>```</td>
      <td>0.321429</td>
      <td>0.321429</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1388755</td>
      <td>SEN. MAMORU YAMASAKI (D)<br><br>Chair, Ways and Means<br><br>Committee</td>
      <td>SEN. MAMORU YAMASAKI<br>(D) CHAIR, WAYS AND MEANS COMMITTEE</td>
      <td>0.482143</td>
      <td>0.089286</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>73907</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE: LO TOM HAWAII PUBLIC TELEVISION</td>
      <td>0.550000</td>
      <td>0.075000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>97130</td>
      <td>Rep. Joseph Souki (D)<br><br>House Finance Chairman</td>
      <td>Rep. Joseph Souki (D)<br>House Finance Chairman</td>
      <td>0.022727</td>
      <td>0.022727</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>132132</td>
      <td>SEN. ANN KOBAYASHI (D)<br><br>Ways & Means Vice Chairman</td>
      <td>SEN. ANN KOBAYASHI (D)<br>WAYS & MEANS VICE CHAIRMAN</td>
      <td>0.367347</td>
      <td>0.020408</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>252152</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>375008</td>
      <td>Rep. Rod Tam (D)<br><br>House Education Chairman</td>
      <td>Rep. Rod Tam (D)<br>House Education Chairman</td>
      <td>0.024390</td>
      <td>0.024390</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>404271</td>
      <td>Rep. David Stegmaier (D)</td>
      <td>Rep. David Stegmaier (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>437638</td>
      <td>Rep. Ed Bybee (D)</td>
      <td>Rep. Ed Bybee (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>453654</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>464264</td>
      <td>Rep. Whitney Anderson (R)</td>
      <td>Rep. Whitney Anderson (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>491525</td>
      <td>Rep. Henry Peters (D0</td>
      <td>Rep. Henry Peters (D)</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>507274</td>
      <td>Rep. Sam Lee (D)</td>
      <td>Rep. Sam Lee (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>537404</td>
      <td>Rep. David Hagino (D)</td>
      <td>Rep. David Hagino (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>578512</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>680514</td>
      <td>SEN. GERALD HAGINO (D)<br><br>Senate Majority Leader</td>
      <td>SEN. GERALD HAGINO (D)<br>SENATE MAJORITY LEADER</td>
      <td>0.400000</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>723657</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>REP. TOM OKAMURA<br>(D) HOUSE MAJORITY LEADER</td>
      <td>0.452381</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>836503</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>```<br>REP TOM OKAMURA (D)<br>HOUSE MAJORITY LEADER<br>```</td>
      <td>0.530612</td>
      <td>0.204082</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>67401</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>88755</td>
      <td>REP. MAZIE HIRONO (D)</td>
      <td>```<br>REP MAZIE HIRONO (D)<br>```</td>
      <td>0.321429</td>
      <td>0.321429</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>99399</td>
      <td>REP. VIRGINIA ISBELL (D)</td>
      <td>```<br>REP VIRGINIA ISBELL (D)<br>```</td>
      <td>0.290323</td>
      <td>0.290323</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>123023</td>
      <td>REP. MAZIE HIRONO (D)</td>
      <td>```<br>REP MAZIE HIRONO (D)<br>```</td>
      <td>0.321429</td>
      <td>0.321429</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>157758</td>
      <td>REP. ANNELLE AMARAL (D)</td>
      <td>```<br>REP ANNELLE AMARAL (D)<br>```</td>
      <td>0.300000</td>
      <td>0.300000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>193527</td>
      <td>REP. BARBARA MARUMOTO (R)</td>
      <td>```<br>REP BARBARA MARUMOOTO (R)<br>```</td>
      <td>0.303030</td>
      <td>0.303030</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>239506</td>
      <td>REP. CLARICE HASHIMOTO (D)</td>
      <td>```<br>REP CLARICE HASHIMOTO (D)<br>```</td>
      <td>0.272727</td>
      <td>0.272727</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>265265</td>
      <td>REP. ROSALYN BAKER (D)</td>
      <td>```<br>REP ROSALYN BAKER (D)<br>```</td>
      <td>0.310345</td>
      <td>0.310345</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>299399</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>618385</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>628629</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary, Chairman</td>
      <td>SEN. RON MENOR (D)<br>SENATE JUDICIARY, CHAIRMAN</td>
      <td>0.466667</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>663530</td>
      <td>MAJOR DAVID BENSON<br><br>Honolulu Police Dept.</td>
      <td>MAJOR DAVID BENSON<br>HONOLU POLICE DEPT.</td>
      <td>0.421053</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>687154</td>
      <td>EARL MATSUOKA<br><br>Chairman, State Offender Project</td>
      <td>EARL MATSUOKA<br>Chairman, Status Offender Project</td>
      <td>0.063830</td>
      <td>0.063830</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>774641</td>
      <td>SERGEANT DAVID DEL ROSARIO<br><br>Honolulu Police Dept.</td>
      <td>SERGEANT DAVID DEL ROSARIO<br>HONOLULU POLICE DEPT.</td>
      <td>0.333333</td>
      <td>0.020833</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>789890</td>
      <td>KEITH KANESHIRO<br><br>Honolulu City Prosecutor</td>
      <td>KEITH KANESHIRO<br>HONOLULU CITY PROSECUTOR</td>
      <td>0.500000</td>
      <td>0.025000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>805906</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary, Chairman</td>
      <td>SEN. RON MENOR (D)<br>SENATE JUDICIARY, CHAIRMAN</td>
      <td>0.466667</td>
      <td>0.022222</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>843877</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>367401</td>
      <td>REP. DWIGHT TAKAMINE (D)<br><br>No. Hilo Hamakua</td>
      <td>```<br>REP DWIGHT TAKAMINE (D)<br>No. Hilo Hamakua<br>```</td>
      <td>0.208333</td>
      <td>0.208333</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>416884</td>
      <td>SEN. MIKE McCARTNEY (D)</td>
      <td>SEN. MIKE MCARTNEY (D)</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>457157</td>
      <td>REP. FRED HEMMINGS (R)<br><br>House Minority Floor Leader</td>
      <td>```<br>REP FRED HEMINGS (R)<br>House Minority Floor Leader<br>```</td>
      <td>0.196429</td>
      <td>0.196429</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>502269</td>
      <td>REP. ROD TAM (D)<br><br>House Education Chairman</td>
      <td>```<br>REP ROD TAM (D)<br>HOUSE EDUCATION CHAIRMAN<br>```</td>
      <td>0.604167</td>
      <td>0.208333</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>583150</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM<br>HAWAII PUBLIC TELEVISION</td>
      <td>0.512821</td>
      <td>0.025641</td>
    </tr>
  </tbody>
</table>