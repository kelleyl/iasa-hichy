# Evaluation Report for `TextRecognition` task as of 2025-08-10 23:55:27.737548

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
- System prediction (MMIF) location: /home/kmlynch/clams_apps/iasa-hichy/output/smol-vlm2/hi-chy-annotator_instructions-3'

## Pipeline specs

## Raw Results
```
GUID,mean-CER-cased,mean-CER-uncased
cpb-aacip-058a21352e3,-1.0,-1.0
cpb-aacip-225-0000006t,0.9529411764705882,0.9529411764705882
cpb-aacip-225-01pg4ftd,0.3031166807711227,0.06265185195924522
cpb-aacip-225-02q5746p,-1.0,-1.0
cpb-aacip-225-0322813n,0.44189016602809705,0.07151979565772669
cpb-aacip-225-04dnckn6,0.12840762840762843,0.04056979056979057
cpb-aacip-225-05fbg826,0.5422453530111687,0.08981012088670247
cpb-aacip-225-05s7h4rk,0.06481481481481481,0.06481481481481481
cpb-aacip-225-06g1jxmr,0.21743831445626846,0.09200646540530509
cpb-aacip-225-07gqnm4b,0.1875,0.125
cpb-aacip-225-07tmpgw5,0.5815508021390374,0.08155080213903743
cpb-aacip-225-085hqd9p,0.3298287404058303,0.18629776501726983
cpb-aacip-225-08v9s5s9,0.0855966469428008,0.022795857988165684
cpb-aacip-225-09j3tzbz,0.31442771310650514,0.062207431116147655
cpb-aacip-225-106wwr7x,0.0625,0.0625
cpb-aacip-225-10wpzhs0,0.10774313157743685,0.08317310700741229
cpb-aacip-225-117m0dnv,0.7218530823181986,0.055001845699520116
cpb-aacip-225-12z34w2c,0.7896418982137968,0.5680778031183019
cpb-aacip-225-12z34wcw,0.1705075932552713,0.08920599366806797
cpb-aacip-225-13mw6nw6,0.40752032520325204,0.06605691056910569
cpb-aacip-225-15bcc3x8,0.4740802675585284,0.14715719063545152
cpb-aacip-225-16c2fsn4,0.11627906976744186,0.11627906976744186
cpb-aacip-225-16pzgpgh,0.06818181818181818,0.06818181818181818
cpb-aacip-225-17crjg75,0.20246913580246914,0.1191358024691358
cpb-aacip-225-182jm7v7,0.71875,0.0625
cpb-aacip-225-20ftth6f,0.2514001394671962,0.14849611696766885
cpb-aacip-225-20sqvcsn,0.08439659755449229,0.08439659755449229
cpb-aacip-225-21tdz2bj,0.06060606060606061,0.06060606060606061
cpb-aacip-225-2259zz64,0.5216963479158602,0.07233997935217448
cpb-aacip-225-22h70v35,0.2961418698260803,0.07433735854788485
cpb-aacip-225-22v41rbt,0.0851063829787234,0.0851063829787234
cpb-aacip-225-23612mxk,0.5785386700020846,0.07822597456743798
cpb-aacip-225-24wh7333,0.756854256854257,0.05627705627705628
cpb-aacip-225-257d801s,0.14676923977893808,0.08018633336768217
cpb-aacip-225-257d802h,0.09071601325122451,0.09071601325122451
cpb-aacip-225-2683bp5b,0.13636363636363635,0.03636363636363636
cpb-aacip-225-27mpg72s,0.06818870577208466,0.06818870577208466
cpb-aacip-225-27zkh3tm,0.14859668258007908,0.08962423284068965
cpb-aacip-225-300zpg5s,0.05178571428571428,0.05178571428571428
cpb-aacip-225-30bvqbsq,0.19890635680109364,0.07475051264524948
cpb-aacip-225-311ns4q0,0.08333333333333333,0.08333333333333333
cpb-aacip-225-311ns4wm,0.08704449396757089,0.045624375624375615
cpb-aacip-225-311ns516,0.2202348019940752,0.0595527939436461
cpb-aacip-225-31cjt1d2,0.40576923076923077,0.08846153846153847
cpb-aacip-225-31qftxh5,0.05202702702702703,0.05202702702702703
cpb-aacip-225-3331zgtf,0.3018381251871818,0.05844189877208745
cpb-aacip-225-34sj3z70,0.26217297195558065,0.16883963862224732
cpb-aacip-225-354f4tzn,0.28473091364205255,0.07196495619524405
cpb-aacip-225-35t76n5v,0.22894689583616248,0.14958181647108312
cpb-aacip-225-36tx99dz,0.1787280701754386,0.05592105263157894
cpb-aacip-225-37vmd00k,0.0425531914893617,0.0425531914893617
cpb-aacip-225-37vmd093,0.30014463578408135,0.19878039427244096
cpb-aacip-225-38w9gnfz,0.28332147375079064,0.07093908127767236
cpb-aacip-225-407wm6z0,0.27335858585858586,0.09558080808080809
cpb-aacip-225-418kpws1,0.26263398240716174,0.06399526732107821
cpb-aacip-225-41mgqsz7,0.12005118644127266,0.054980088557674764
cpb-aacip-225-4298sk4k,0.4032414767708885,0.05151475004416181
cpb-aacip-225-44bnzxh7,0.40587131844135005,0.2580444453996433
cpb-aacip-225-45q83h0w,0.5135135135135135,0.05405405405405406
cpb-aacip-225-46qz65g2,0.12281132154646586,0.08333763733593956
cpb-aacip-225-47rn8tt8,0.5185185185185185,0.07407407407407407
cpb-aacip-225-48sbchm7,0.3395215311004785,0.050143540669856455
cpb-aacip-225-49t1g691,0.16666869870531195,0.06845441299102625
cpb-aacip-225-50tqjvnn,0.41346153846153844,0.06971153846153846
cpb-aacip-225-50tqjvpc,0.36666666666666664,0.08888888888888888
cpb-aacip-225-51hhmnck,0.4860215053763441,0.0989247311827957
cpb-aacip-225-51vdnj5t,0.16212721726797613,0.08305744982611567
cpb-aacip-225-51vdnjgb,0.0945945945945946,0.0945945945945946
cpb-aacip-225-5269pfd1,0.1526201004620369,0.12408347942162498
cpb-aacip-225-5370s3m0,0.08333333333333333,0.08333333333333333
cpb-aacip-225-53wstwhr,0.33941176470588236,0.06941176470588235
cpb-aacip-225-54kkwnxg,0.39792984473835535,0.09660724554341577
cpb-aacip-225-54xgxjx2,0.2949882989694439,0.2945970626627146
cpb-aacip-225-55z617mg,0.3875323714391417,0.0586539647305463
cpb-aacip-225-58pc8cvz,0.36607607015267757,0.06931423341820059
cpb-aacip-225-59c5b58c,0.3516213917999632,0.0445509284794999
cpb-aacip-225-59c5b5gq,0.06797235023041474,0.06797235023041474
cpb-aacip-225-60qrfqn9,0.0625,0.0625
cpb-aacip-225-62s4n305,0.24785417316974298,0.07091032629680392
cpb-aacip-225-62s4n31w,0.2425280394815312,0.0776842567612042
cpb-aacip-225-6341nznq,0.08262390226700704,0.05444445975829624
cpb-aacip-225-6341nzq5,0.7859649122807018,0.07145135566188197
cpb-aacip-225-644qrn7r,0.46452830188679245,0.07773584905660377
cpb-aacip-225-65h9w6jg,0.43333333333333335,0.1
cpb-aacip-225-65v6x41w,0.23863636363636365,0.11363636363636363
cpb-aacip-225-676t1p11,0.7833333333333333,0.06666666666666667
cpb-aacip-225-676t1p2r,0.5115740740740741,0.11574074074074073
cpb-aacip-225-676t1pd0,0.24942287496427823,0.10007812742218726
cpb-aacip-225-67jq2jv9,0.5676189682936309,0.07049253151202177
cpb-aacip-225-67wm3fvw,0.5520202020202021,0.13773448773448774
cpb-aacip-225-687h4bv1,0.3681749379073794,0.08260100155044456
cpb-aacip-225-687h4bwr,-1.0,-1.0
cpb-aacip-225-68kd57gn,-1.0,-1.0
cpb-aacip-225-69m37x2m,0.07809769902793158,0.06857388950412206
cpb-aacip-225-69z08szb,0.06153846153846154,0.06153846153846154
cpb-aacip-225-69z08t1g,0.055103668261562995,0.055103668261562995
cpb-aacip-225-720cg560,0.07142857142857142,0.07142857142857142
cpb-aacip-225-720cg58f,0.07272727272727272,0.07272727272727272
cpb-aacip-225-720cg5db,0.023255813953488372,0.023255813953488372
cpb-aacip-225-72p5hxtv,0.785425101214575,0.09109311740890688
cpb-aacip-225-72p5hz3b,0.1851295483445493,0.05993763614236084
cpb-aacip-225-73pvmmc5,0.32916666666666666,0.06666666666666667
cpb-aacip-225-73pvmmnz,0.3354647389691983,0.06627001630017938
cpb-aacip-225-74cnpd4t,0.07627865961199294,0.07627865961199294
cpb-aacip-225-752fr61c,0.33296414455848233,0.06549620942847499
cpb-aacip-225-75r7szj2,0.07692307692307693,0.07692307692307693
cpb-aacip-225-7634tvj6,0.2318679821470519,0.06890501918408895
cpb-aacip-225-76rxwn5t,0.07230576441102757,0.07230576441102757
cpb-aacip-225-773txjbk,0.19838636519153238,0.06779927362451257
cpb-aacip-225-77fqzf2c,0.6772789738891434,0.5016032982134677
cpb-aacip-225-784j16nb,0.06731601731601732,0.06731601731601732
cpb-aacip-225-784j16p2,0.44363636363636366,0.13575757575757574
cpb-aacip-225-79h44s0t,0.0547945205479452,0.0547945205479452
cpb-aacip-225-79v15nz0,0.1875,0.1875
cpb-aacip-225-805x6k1p,0.1178150738150738,0.046020202020202024
cpb-aacip-225-80vq8bj1,-1.0,-1.0
cpb-aacip-225-81jhb4c4,0.43108116202455826,0.06769691524408505
cpb-aacip-225-83kwhghq,0.5463881996140061,0.10283981251723188
cpb-aacip-225-83xsjc9z,0.27982021024784187,0.07587284182678919
cpb-aacip-225-83xsjcbp,-1.0,-1.0
cpb-aacip-225-83xsjcgk,0.046511627906976744,0.046511627906976744
cpb-aacip-225-848pk819,0.4278519099947671,0.08062968777254491
cpb-aacip-225-848pk821,0.4666666666666667,0.09166666666666667
cpb-aacip-225-84zgn1v5,0.10644257703081232,0.10644257703081232
cpb-aacip-225-86b2rm9c,0.39555555555555555,0.09555555555555556
cpb-aacip-225-881jx2zw,0.24533783528403863,0.057102541166391595
cpb-aacip-225-88cfxzgp,0.0851063829787234,0.0851063829787234
cpb-aacip-225-88cfz00w,0.21267102310663608,0.10291450929005194
cpb-aacip-225-89280rcv,0.44868072622000227,0.07125953677550231
cpb-aacip-225-89r22hxx,0.42857142857142855,0.09523809523809523
cpb-aacip-225-902z3dxg,0.5177838577291382,0.5177838577291382
cpb-aacip-225-902z3f8d,0.06521739130434782,0.06521739130434782
cpb-aacip-225-90dv49tw,0.7105263157894737,0.5
cpb-aacip-225-913n63bg,0.075,0.075
cpb-aacip-225-913n63kj,0.06666666666666667,0.0
cpb-aacip-225-91sf7w98,0.06896551724137931,0.06896551724137931
cpb-aacip-225-92t4bjr9,0.09505700292217145,0.05460756471992427
cpb-aacip-225-92t4bjs1,0.7170589318461955,0.08123077192876971
cpb-aacip-225-93gxdbd6,0.3145932893546891,0.12022099498239477
cpb-aacip-225-93gxdbgn,0.11298653841715017,0.04403812571873748
cpb-aacip-225-945qg46k,0.43240093240093236,0.06876456876456877
cpb-aacip-225-945qg479,0.75,0.1111111111111111
cpb-aacip-225-945qg481,0.06910759133989623,0.06910759133989623
cpb-aacip-225-94vhhwww,0.17083333333333334,0.10833333333333334
cpb-aacip-225-956djsw1,0.1459050424647214,0.05473654126066284
cpb-aacip-225-95j9kphn,0.06226053639846743,0.06226053639846743
cpb-aacip-225-95w6mkcb,0.2738363363363363,0.06662912912912912
cpb-aacip-225-9673nggn,0.5271542827657378,0.09513673890608876
cpb-aacip-225-977sr4x3,0.19122440472582594,0.1475391045187866
cpb-aacip-225-977sr507,0.4395424836601307,0.08660130718954248
cpb-aacip-225-977sr51z,0.5833333333333333,0.08333333333333333
cpb-aacip-225-988gttgb,0.2508912655971479,0.059714795008912656
cpb-aacip-225-988gttpp,0.15792970764390338,0.04691624649238426
cpb-aacip-225-99n2zd03,0.09646024762303833,0.09646024762303833
cpb-aacip-2f864418e19,0.13905994055794654,0.048150849648855625
cpb-aacip-46e8446d567,0.12914509788395617,0.03733868539648055
cpb-aacip-5e99ee61039,0.14726490379943064,0.04533935096960307
cpb-aacip-c361a8d7683,0.22583829178951134,0.04229822210310015
Average,0.28334203834104366,0.0992012012883274

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
      <td>A man in a suit and tie is standing at a podium, speaking into a microphone. He is wearing a flower in his hair and is surrounded by other people who are also wearing flowers in their hair. The text "KAUPENA WONG" is displayed at the bottom of the screen.</td>
      <td>0.952941</td>
      <td>0.952941</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>224758</td>
      <td>RENE MANSHO (D)<br><br>Honolulu City Council</td>
      <td>RENE MANSHO (D) Honolulu City Council</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>264264</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television.</td>
      <td>0.270270</td>
      <td>0.081081</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>275876</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>HANNIBAL TAVARES (R) MAUI MAYOR</td>
      <td>0.290323</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>325392</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>HANNIBAL TAVARES (R) MAUI MAYOR</td>
      <td>0.290323</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>365399</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>Rep. Tom Okamura (D) House Majority Leader</td>
      <td>0.285714</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>385519</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R) SENATE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>420020</td>
      <td>REP. JOE SOUKI (D)<br><br>House Finance Chairman</td>
      <td>REP. JOE SOUKI (D) HOUSE FINANCE CHAIRMAN</td>
      <td>0.463415</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>435269</td>
      <td>SAM SLOM<br><br>Small Business Hawaii</td>
      <td>sam slom small business hawaii</td>
      <td>0.400000</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>469136</td>
      <td>REP. JOE SOUKI (D)<br><br>House Finance Chairman</td>
      <td>REPR. JOE SOUKI (D) HOUSE FINANCE CHAIRMAN</td>
      <td>0.476190</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>528028</td>
      <td>PATSY T. MINK<br><br>Former Honolulu<br><br>City Council Chair</td>
      <td>Patsy T. Mink, Former Honolulu City Council Chair</td>
      <td>0.224490</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>576877</td>
      <td>LOWELL KALAPA<br><br>Tax Foundation of Hawaii</td>
      <td>Lowell Kalapa, Tax Foundation of Hawaii</td>
      <td>0.307692</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>659526</td>
      <td>LOWELL KALAPA<br><br>Tax Foundation of Hawaii</td>
      <td>Lowell Kalapa, Tax Foundation of Hawaii</td>
      <td>0.307692</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>720020</td>
      <td>PATSY T. MINK<br><br>Former Honolulu<br><br>City Council Chair</td>
      <td>Patsy T. Mink, Former Honolulu City Council Chair</td>
      <td>0.224490</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1062529</td>
      <td>EVIE BENET<br><br>Hawaii Right To Life</td>
      <td>EVIE BENET Hawaii Right To Life</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1075008</td>
      <td>SEN. MARY-JANE McMURDO<br><br>(D) Moiliili-Waikiki</td>
      <td>SEN. MARY-JANE McMURDO (D) MOILIIII-WAIKIKI</td>
      <td>0.348837</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-01pg4ftd (35 rows)</td>
      <td>1158525</td>
      <td>SEN. ANN KOBAYASHI (D)<br><br>Manoa-Makiki</td>
      <td>Sen. Ann Kobayashi (D) Manoa-Makiki</td>
      <td>0.400000</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-0322813n (7 rows)</td>
      <td>270270</td>
      <td>Bobby Bunda<br><br>Senate President</td>
      <td>Bobby Bunda, Senate President</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-0322813n (7 rows)</td>
      <td>1384384</td>
      <td>Egen Atkinson<br><br>Iolani School</td>
      <td>EGEN ATKINSON IOLANI SCHOOL</td>
      <td>0.814815</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>605138</td>
      <td>NORMAN MIZUGUCHI (D)<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI (D) SENATE PRESIDENT</td>
      <td>0.405405</td>
      <td>0.054054</td>
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
      <td>REVEREND CHRIS ENG United Church Of Christ</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-04dnckn6 (13 rows)</td>
      <td>1161528</td>
      <td>PAUL KAWAGUCHI<br><br>Senate Chief Clerk</td>
      <td>PAUL KAWAGUCHI Senate Chief Clerk</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>301001</td>
      <td>Jay Chavez<br><br>Captain<br><br>Pride of America</td>
      <td>JAY CHAZEZ, CAPTAIN, PRIDE OF AMERICA</td>
      <td>0.783784</td>
      <td>0.135135</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>376643</td>
      <td>Robert Kritzman<br><br>Executive Vice President<br><br>NCL Hawaii</td>
      <td>ROBERT KRITZMAN, EXECUTIVE VICE PRESIDENT, NCL HAWAII</td>
      <td>0.754717</td>
      <td>0.075472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05fbg826 (5 rows)</td>
      <td>651151</td>
      <td>John Heckathorn<br><br>Writer And Critic</td>
      <td>John Heckathorn, Writer and Critic</td>
      <td>0.088235</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05s7h4rk (4 rows)</td>
      <td>317885</td>
      <td>Brian Barbata<br><br>Gas Retailer</td>
      <td>Brian Barbata, Gas Retailer</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-05s7h4rk (4 rows)</td>
      <td>753520</td>
      <td>Mike Fassiotto<br><br>Chaminade University</td>
      <td>Mike Fassiotto, Chaminade University</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>183016</td>
      <td>ANDREW POEPOE<br><br>Saiki in '88 Committee</td>
      <td>ANDREW POEPOE SAKI in 88 Committee</td>
      <td>0.205882</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>238505</td>
      <td>WILLIAM DALY<br><br>Voter Contact Services Pres.</td>
      <td>WILLIAM DALY VOTER CONTACT SERVICES PRES.</td>
      <td>0.536585</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>285152</td>
      <td>RICHARD JOUN<br><br>State's Chief Economist</td>
      <td>RICHARD JOUN STATE'S CHIEF ECONOMIST</td>
      <td>0.527778</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>312145</td>
      <td>ALEJANDRA PAJARILLO<br><br>Maunakea Leis & Flowers</td>
      <td>ALEJANDRA PAJARILLO Maunakea Leis & Flowers</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>337271</td>
      <td>SIU NG<br><br>Violet's Lei Stand</td>
      <td>SIU NG Violet's Lei Stand</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>345879</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>A woman with blonde hair, wearing a white sweater, is standing on a city street. She is speaking to the camera.</td>
      <td>0.918919</td>
      <td>0.846847</td>
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
      <td>MIKE McCARTNEY (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>MIKE McGARTNEY (D)</td>
      <td>0.055556</td>
      <td>0.055556</td>
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
      <td>MIKE McCARTNEY (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>857524</td>
      <td>MARK SPENGLER<br><br>Bush Campaign</td>
      <td>MARK SPENGLER Bush Campaign</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>907140</td>
      <td>EILEEN CHONG<br><br>Fasi Volunteer</td>
      <td>Eileen Chong, Fasi Volunteer</td>
      <td>0.392857</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>942142</td>
      <td>SUSAN ICHINOSE<br><br>Bornhorst Volunteer</td>
      <td>SUSAN ICHINOSE Bornhorst Volunteer</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>959893</td>
      <td>MARK SPENGLER<br><br>Bush Campaign</td>
      <td>MARK SPENGLER Bush Campaign</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1063263</td>
      <td>EILEEN CHONG<br><br>Fasi Volunteer</td>
      <td>Eileen Chong, Fasi Volunteer</td>
      <td>0.392857</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1198765</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-06g1jxmr (24 rows)</td>
      <td>1284751</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE, POLITICAL ANALYST</td>
      <td>0.551724</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07gqnm4b (1 rows)</td>
      <td>144378</td>
      <td>CHARLES CLARK<br><br>SUPT. of EDUCATION</td>
      <td>CHARLES CLARK SUP'T OF EDUCATION</td>
      <td>0.187500</td>
      <td>0.125000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07tmpgw5 (3 rows)</td>
      <td>247014</td>
      <td>Jim Tollefson<br><br>CHAMBER OF COMMERCE OF HAWAII</td>
      <td>Jim Tollefson, Chamber of Commerce of Hawaii</td>
      <td>0.545455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-07tmpgw5 (3 rows)</td>
      <td>632032</td>
      <td>Joe Toy<br><br>CEO<br><br>HOSPITALITY ADVISORS</td>
      <td>Joe Toy, CEO, Hospitality Advisors</td>
      <td>0.617647</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>134635</td>
      <td>WARREN PRICE<br><br>State Attorney General</td>
      <td>WARREN PRICE State Attorney General</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>207407</td>
      <td>SEN. RON MENOR (D)<br><br>Judiciary Committee Chair</td>
      <td>SEN. RON MENOR (D) JUDICIARY COMMITTEE CHAIR</td>
      <td>0.500000</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>251385</td>
      <td>MAJ. MIKE CARVALHO<br><br>HPD Narcotics Division</td>
      <td>MAJ. MIKE GARVALHO HPD Narcotics Division</td>
      <td>0.073171</td>
      <td>0.073171</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>295529</td>
      <td>WARREN PRICE<br><br>State Attorney General</td>
      <td>WARREN PRICE State Attorney General</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>321255</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>360127</td>
      <td>SEN. RON MENOR (D)<br><br>Judiciary Committee Chair</td>
      <td>SEN. RON MENOR (D) JUDICIARY COMMITTEE CHAIR</td>
      <td>0.500000</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>387020</td>
      <td>DR. BLASE HARRIS<br><br>Psychiatrist</td>
      <td>Dr. Blase Harris, Psychiatrist</td>
      <td>0.400000</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>478645</td>
      <td>AARON PEAK<br><br>Life Foundation</td>
      <td>A bearded man with curly hair, wearing a light-colored shirt with a colorful pattern, is sitting in front of a wooden background. The text "AARON PEAK Life Foundation" is displayed in yellow at the bottom of the screen.</td>
      <td>0.890411</td>
      <td>0.890411</td>
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
      <td>Nancy Partika is the Executive Director of the Governor's Committee on AIDS.</td>
      <td>0.421053</td>
      <td>0.289474</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>526627</td>
      <td>ANN deMEURERS<br><br>Hawaii Public Television</td>
      <td>ANN deMEUERS Hawaii Public Television</td>
      <td>0.081081</td>
      <td>0.081081</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>536770</td>
      <td>AARON PEAK<br><br>Life Foundation</td>
      <td>A man with curly hair and a beard, wearing a colorful shirt, is speaking into a microphone. The text on the screen reads "Aaron Peak Life Foundation".</td>
      <td>0.880000</td>
      <td>0.840000</td>
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
      <td>Nancy Partika is the Executive Director of the Governor's Committee on AIDS.</td>
      <td>0.421053</td>
      <td>0.289474</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>622389</td>
      <td>REP. JIM SHON (D)<br><br>Chair, House Health Committee</td>
      <td>REP. JIM SHON (D) Chair, House Health Committee</td>
      <td>0.042553</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>673507</td>
      <td>KEITH KANESHIRO<br><br>City Prosecutor</td>
      <td>KEITH KANESHIRO City Prosecutor</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-085hqd9p (28 rows)</td>
      <td>1091658</td>
      <td>CHRISTINE HALL<br><br>Guide Dog User</td>
      <td>CHRISTINE HALL Guide Dog User</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>101902</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>Leslie Wilcox, Hawaii Public Television</td>
      <td>0.307692</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>235769</td>
      <td>MIKE O'KIEFFE (R)</td>
      <td>MIKE O'KIEFF (R)</td>
      <td>0.062500</td>
      <td>0.062500</td>
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
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
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
      <td>ED CASE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>691391</td>
      <td>ED CASE (D)</td>
      <td>ED CASE (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>REY GRAULTY (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-08v9s5s9 (24 rows)</td>
      <td>1176009</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, POLITICS EDITOR, HONOLULU ADVERTISER</td>
      <td>0.640000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>99900</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>281515</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>326260</td>
      <td>GEORGE APPLEGATE<br><br>Big Island Visitors Bureau</td>
      <td>George Applegate, Big Island Visitors Bureau</td>
      <td>0.340909</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>613647</td>
      <td>NONIE TOLEDO<br><br>GM, Sprint Hawaii</td>
      <td>Nonie Toledo, GM, Sprint Hawaii</td>
      <td>0.354839</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>907407</td>
      <td>WALTER DODS<br><br>Chairman, Bancwest Corp.</td>
      <td>WALTER DODS, CHAIRMAN, BANCWEST CORP.</td>
      <td>0.513514</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-09j3tzbz (7 rows)</td>
      <td>1196129</td>
      <td>CHERYLLE MORROW<br><br>Hawaii Women's Business Center</td>
      <td>CHERYLLE MORROW, HAWAII WOMEN'S BUSINESS CENTER</td>
      <td>0.510638</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-106wwr7x (1 rows)</td>
      <td>186386</td>
      <td>Ryan Lum<br><br>North Shore Cattle Co.</td>
      <td>Ryan Lum, North Shore Cattle Co.</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>346280</td>
      <td>PIERRE MOULIN<br><br>Pres., Honolulu/Bruyeres<br><br>Friendship Committee</td>
      <td>PIERRE MOULIN Pres., Honolulu/Bruyere Friendship Committee</td>
      <td>0.086207</td>
      <td>0.086207</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>376510</td>
      <td>SANDY HOLCK<br><br>Honolulu City Councilman<br><br>Veteran, 442nd Reg. C T</td>
      <td>SANDY HOLCK Honolulu City Councilman Veteran, 442nd Reg. C T</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>525025</td>
      <td>COL. Y. O. KIM<br><br>Veteran, 100th Bn</td>
      <td>COL. Y. O. KIM Veteran, 100th Bn</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>557391</td>
      <td>FRANCIS SUGAI<br><br>Veteran, 442nd Reg. C T</td>
      <td>Francis Sugai, Veteran, 442nd Hq, 5th</td>
      <td>0.513514</td>
      <td>0.243243</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>596630</td>
      <td>GERARD DESCHASEAUX<br><br>Bruyeres Councilman<br><br>Pres., Honolulu/Bruyeres Sister Cityship</td>
      <td>GERARD DESCHASEAUX Bruyerees Councilman Pres., Honolulu/Bruyerees Sister Cityship</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>708141</td>
      <td>ROGER BALLAND<br><br>Prof., French Language School</td>
      <td>ROGER BALLAND Prof., French Language School</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>789022</td>
      <td>PIERRE SOURIER<br><br>Pres., Assoc. of Underground Forces,<br><br>WW II</td>
      <td>PIERRE SOURIER Pres., Assoc. of Underground Forces, WW II</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>904905</td>
      <td>SANDY HOLCK<br><br>Honolulu City Councilman<br><br>Veteran, 442nd Reg. C T</td>
      <td>SANDY HOLCK, Honolulu City Councilman, Veteran, 442nd Reg. C T</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>939506</td>
      <td>JOHN TSUKANO<br><br>Veteran, 100th Bn/442nd Reg. C T</td>
      <td>JOHN TSUKANO Veteran, 100th Br/442nd Reg. O T</td>
      <td>0.088889</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>974908</td>
      <td>PIERRE MOULIN<br><br>Pres., Honolulu/Bruyeres<br><br>Friendship Committee</td>
      <td>PIERRE MOULIN Pres., Honolulu/Bruyerese Friendship Committee</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-10wpzhs0 (15 rows)</td>
      <td>1010777</td>
      <td>SERGE CARLESSO<br><br>Veteran/Amputee, French Army</td>
      <td>SERGE CARLESSO, Veteran/Amputee, French Army</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-117m0dnv (3 rows)</td>
      <td>233500</td>
      <td>Eric Gill<br><br>Secretary-Treasurer<br><br>Local 5 of the Unite-Here union</td>
      <td>ERIC GILL, SECRETARY-TREASURER, LOCAL 5 OF THE UNITE-HERE UNION</td>
      <td>0.746032</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-117m0dnv (3 rows)</td>
      <td>501768</td>
      <td>Andy Poepoe<br><br>Honolulu District Manager, SBA</td>
      <td>ANDY POEPOE, HONOLULU DISTRICT MANAGER, SBA</td>
      <td>0.697674</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>188155</td>
      <td>GEORGE TAKANE<br><br>HOUSE CLERK</td>
      <td>George Takane, House Clerk, is speaking into a microphone.</td>
      <td>0.896552</td>
      <td>0.586207</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>525759</td>
      <td>JAY LARRIN</td>
      <td>Jay Larrin is standing in front of a microphone, wearing a plaid shirt.</td>
      <td>0.957746</td>
      <td>0.859155</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>686019</td>
      <td>LOYAL GARNER</td>
      <td>LOYAL GARNER</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>701268</td>
      <td>RICHARD S. H. WONG<br><br>SENATE PRESIDENT</td>
      <td>Richard S.H. Wong, Senate President, is standing at a podium with a microphone, wearing a lei and a suit.</td>
      <td>0.904762</td>
      <td>0.695238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>790390</td>
      <td>REV. WILLIAM KAINA</td>
      <td>Rev. William Kaina is standing at a podium, wearing a white robe and a garland of flowers around his neck. He is speaking into a microphone.</td>
      <td>0.957143</td>
      <td>0.871429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>1000400</td>
      <td>DAVID WOO<br><br>SENATE CLERK</td>
      <td>David Woo, Senate Clerk, is seated at a desk in a room with a wooden panel wall. In front of him is a microphone, and behind him are several potted plants.</td>
      <td>0.961290</td>
      <td>0.864516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34w2c (13 rows)</td>
      <td>1176009</td>
      <td>STACY SAKAMOTO<br><br>HAWAII PUBLIC<br><br>TELEVISION</td>
      <td>Stacy Sakamoto, Hawaii Public Television</td>
      <td>0.850000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>176376</td>
      <td>AMY AGBAYANI<br><br>Campaign Strategist</td>
      <td>Amy Agbayani is a campaign strategist.</td>
      <td>0.473684</td>
      <td>0.184211</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>190757</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI State Representative (D)</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>212646</td>
      <td>YAS KURODA<br><br>Political Scientist</td>
      <td>YAS KURODA Political Scientist</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>264531</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI State Representative (D)</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>283650</td>
      <td>YAS KURODA<br><br>Political Scientist</td>
      <td>YAS KURODA Political Scientist</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>305138</td>
      <td>HO`OIPO DeCAMBRA<br><br>Hawaiian Activist</td>
      <td>HO'OPO DeCAMBRA Hawaiian Activist</td>
      <td>0.121212</td>
      <td>0.121212</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>335502</td>
      <td>ROLAND KOTANI<br><br>State Representative (D)</td>
      <td>ROLAND KOTANI STATE REPRESENTATIVE (D)</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>347281</td>
      <td>AMY AGBAYANI<br><br>Campaign Strategist</td>
      <td>Amy Agbayani is a campaign strategist.</td>
      <td>0.473684</td>
      <td>0.184211</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>369269</td>
      <td>HO`OIPO DeCAMBRA<br><br>Hawaiian Activist</td>
      <td>HO'OPO DeCAMBRA Hawaiian Activist</td>
      <td>0.121212</td>
      <td>0.121212</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>449783</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>510511</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE Political Analyst</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>548782</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>589890</td>
      <td>LYNETTE LO TOM<br><br>ELECTION LIVE</td>
      <td>LYNETTE LO TOM ELECTION LIVE</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>697898</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>DAN TUTTLE Political Analyst</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>1045512</td>
      <td>JACK RICHARDSON<br><br>Chairman<br><br>Hawaii Democratic Party</td>
      <td>JACK RICHARDSON, Chairman, Hawaii Democratic Party</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-12z34wcw (27 rows)</td>
      <td>1184017</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>LESLIE WILCOX ELECTION LIVE</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-13mw6nw6 (3 rows)</td>
      <td>98632</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-13mw6nw6 (3 rows)</td>
      <td>620020</td>
      <td>Abe Weinstein<br><br>Hawaii Int'l Jazz Festival</td>
      <td>ABE WEINSTEIN, HAWAII INT'L JAZZ FESTIVAL</td>
      <td>0.731707</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-15bcc3x8 (4 rows)</td>
      <td>245145</td>
      <td>Ted Liu<br><br>Director<br><br>DBEDT</td>
      <td>Ted Liu, Director, DBDT</td>
      <td>0.217391</td>
      <td>0.217391</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-15bcc3x8 (4 rows)</td>
      <td>640507</td>
      <td>Mark Sasaki<br><br>Big City Diner</td>
      <td>MARK SASAKI BIG CITY DINER</td>
      <td>0.730769</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16c2fsn4 (2 rows)</td>
      <td>138505</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKAO (R) House Minority Leader</td>
      <td>0.116279</td>
      <td>0.116279</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16c2fsn4 (2 rows)</td>
      <td>370504</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKAO (R) House Minority Leader</td>
      <td>0.116279</td>
      <td>0.116279</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16pzgpgh (2 rows)</td>
      <td>123156</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANANAKA (R) House Minority Leader</td>
      <td>0.068182</td>
      <td>0.068182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-16pzgpgh (2 rows)</td>
      <td>350150</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANANAKA (R) House Minority Leader</td>
      <td>0.068182</td>
      <td>0.068182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>299266</td>
      <td>Gary Siebert<br><br>Hilton Hawaii</td>
      <td>Gary Siebert, Hilton Hawaii</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>579279</td>
      <td>Barbara Stanton<br><br>Executive Director<br><br>AARP Hawaii</td>
      <td>Barbara Stanton, Executive Director, AARP Hawaii</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-17crjg75 (4 rows)</td>
      <td>902903</td>
      <td>Eric Tom<br><br>CEO<br><br>BBITV</td>
      <td>ERIC TOM, CEO, BBITV</td>
      <td>0.450000</td>
      <td>0.200000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-182jm7v7 (4 rows)</td>
      <td>231031</td>
      <td>Robbie Alm<br><br>VP, Hawaiian Electric</td>
      <td>ROBBIE ALM VP, HAWAIIAN ELECTRIC</td>
      <td>0.718750</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>105506</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM Hawaii Edition</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>202135</td>
      <td>PHIL ESTERMANN<br><br>Save Sandy Beach Coalition</td>
      <td>PHIL ESTERMANN SAVE SANDY BEACH COALITION</td>
      <td>0.512195</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>230764</td>
      <td>STEVE HIRANO<br><br>Good Neighbors/Good Planning</td>
      <td>STEVE HIRANO Good Neighbors/Good Planning</td>
      <td>0.048780</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>248282</td>
      <td>DONNA GOTH<br><br>Land Use Research Foundation<br><br>of Hawaii</td>
      <td>DONNA GOTH, Land Use Research Foundation of Hawaii</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>301001</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>321522</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayor</td>
      <td>Joann YukiMura (D) is the Mayor of Kauai.</td>
      <td>0.658537</td>
      <td>0.414634</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>360027</td>
      <td>REP. EZRA KANOHO (D)<br><br>Lihue/Kapaa</td>
      <td>The image shows a man sitting in a chair, wearing a suit and tie. The text on the screen reads "REP. EZRA KANOHO (D) Lihue/Kapa'a".</td>
      <td>0.770992</td>
      <td>0.770992</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>437504</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>Jan. 31, GOV. JOHN WAHEE (D)</td>
      <td>0.357143</td>
      <td>0.357143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>494528</td>
      <td>GARY GILL<br><br>Honolulu City Council Member</td>
      <td>GARY GILL, Honolulu City Council Member</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>532900</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>John Radcliffe, Good Neighbors, Good Planning</td>
      <td>0.333333</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>598632</td>
      <td>GARY GILL<br><br>Honolulu City Council Member</td>
      <td>GARY GILL, Homolulu City Council Member</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>640774</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>John Radcliffe Good Neighbors Good Planning</td>
      <td>0.325581</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>884751</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors/Good Planning</td>
      <td>John Radcliffe, Good Neighbors, Good Planning</td>
      <td>0.333333</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1021755</td>
      <td>MARTHA HULBERT<br><br>Adoption Circle of Hawaii</td>
      <td>MARTHA HULBERT Adoption Circle of Hawaii</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1183016</td>
      <td>VERA BENEDEK<br><br>Hawaii Public Television</td>
      <td>VERA BENEDEK Hawaii Public Television</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20ftth6f (29 rows)</td>
      <td>1308141</td>
      <td>ARTHUR ROSS<br><br>Neighborhood Board Chairman</td>
      <td>ARTHUR ROSS Neighborhood Board Chairman</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>137504</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA Honolulu Star-Bulletin</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>155022</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA KHON TV-2</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>266133</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA Honolulu Star-Bulletin</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>402135</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA KHONTV2</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>696530</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA Honolulu Star-Bulletin</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-20sqvcsn (8 rows)</td>
      <td>763130</td>
      <td>GREGG TAKAYAMA<br><br>KHON TV-2</td>
      <td>GREGG TAKAYAMA KHON TV-2</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-21tdz2bj (2 rows)</td>
      <td>547281</td>
      <td>Angela Britten<br><br>Mutual Publishing</td>
      <td>Angela Britten, Mutual Publishing</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>237137</td>
      <td>Steve Johnson<br><br>Kazi Foods</td>
      <td>STEVE JOHNSON Kazi Foods</td>
      <td>0.500000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>574007</td>
      <td>Virginia Easton Smith<br><br>UH Agricultural Extension Agent</td>
      <td>VIRGINIA EASTON SMITH, UH AGRICULTURAL EXTENSION AGENT</td>
      <td>0.759259</td>
      <td>0.037037</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>881014</td>
      <td>Mark Gilbert<br><br>VP<br><br>Commercial Data Systems</td>
      <td>MARK GILBERT, VP, COMMERCIAL DATA SYSTEMS</td>
      <td>0.756098</td>
      <td>0.097561</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2259zz64 (4 rows)</td>
      <td>1217150</td>
      <td>Jane Sawyer<br><br>SBA of Honolulu</td>
      <td>Jane Sawyer, SBA of Honolulu</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>107774</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus EVERYBODY'S BUSINESS</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>242142</td>
      <td>Steve Teruya<br><br>PRESIDENT<br><br>FINANCE FACTORS</td>
      <td>STEVE TERUYA PRESIDENT FINANCE FACTORS</td>
      <td>0.342105</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22h70v35 (4 rows)</td>
      <td>770771</td>
      <td>Rep. Bob Herkes<br><br>HAWAII HOSPITALITY</td>
      <td>Rep. Bob Herkes, Hawaii Hospitality</td>
      <td>0.485714</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-22v41rbt (2 rows)</td>
      <td>92759</td>
      <td>KELLI ABE<br><br>TRIFONOVITCH<br><br>Hawaii Public Television</td>
      <td>KELLI ABE TRIFONOVITCH Hawaii Public Television</td>
      <td>0.085106</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>99266</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>262896</td>
      <td>Jim Barahal<br><br>President<br><br>Honolulu Marathon</td>
      <td>JIM BARAHAL PRESIDENT HONOLULU MARATHON</td>
      <td>0.871795</td>
      <td>0.102564</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-23612mxk (5 rows)</td>
      <td>887888</td>
      <td>Lyn Flanigan<br><br>Hawaii State Bar Association</td>
      <td>LYN FLANIGAN HAWAII STATE BAR ASSOCIATION</td>
      <td>0.780488</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>235903</td>
      <td>Harvey Shapiro<br><br>Honolulu Board of Realtors</td>
      <td>HARVEY SHAPIRO, HONOLULU BOARD OF REALTORS</td>
      <td>0.785714</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>620153</td>
      <td>Mike Ivens<br><br>MGI Aviation Services</td>
      <td>MIKE IVENS, MGI AVIATION SERVICES</td>
      <td>0.696970</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-24wh7333 (3 rows)</td>
      <td>1291391</td>
      <td>Diane Wicks<br><br>Plantation Home Decor</td>
      <td>DIANE WICKS PLANTATION HOME DECOR</td>
      <td>0.787879</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>185018</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>BOB HOGUE (R) State Senate Dist. 24 Candidate Kaneohe-Enchanted Lake</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>226527</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>Solomon Nalu'i (D) State Senate Dist. 24 Candidate Kanohe-Enchanted Lake</td>
      <td>0.236111</td>
      <td>0.097222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>429129</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>BOB HOGUE (R) State Senate Dist. 24 Candidate Kanohe-Enchanted Lake</td>
      <td>0.074627</td>
      <td>0.074627</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>440774</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>Solomon Nalu'i (D) State Senate District 24 Candidate Kanohe-Enchanted Lake</td>
      <td>0.280000</td>
      <td>0.146667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>707407</td>
      <td>SOLOMON NALUA`I (D)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>Solomon Nalua'i (D) State Senate Dist. 24 Candidate Kanohe-Enchanted Lake</td>
      <td>0.232877</td>
      <td>0.082192</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>763764</td>
      <td>BOB HOGUE (R)<br><br>State Senate Dist. 24 Candidate<br><br>Kaneohe-Enchanted Lake</td>
      <td>BOB HOGUE (R) State Senate Dist. 24 Candidate Kanoehe-Enchanted Lake</td>
      <td>0.088235</td>
      <td>0.088235</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>964898</td>
      <td>WILLIAM STONEBRAKER (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>WILLIAM STONEBRAKER (R) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.044944</td>
      <td>0.044944</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d801s (12 rows)</td>
      <td>1027761</td>
      <td>GREG KNUDSEN (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>Greg Knudsen (D) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.158537</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>189256</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R) State Rep, Dist. 42 Candidate Kunia-Makiko-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.102273</td>
      <td>0.102273</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>243510</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (D) State Rep. Dist. 42 Candidate Kimia-Makiko-Ewa Village Park-Kapolei-Kunia</td>
      <td>0.122222</td>
      <td>0.122222</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>453253</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (D) State Rep. Dist. 42 Candidate Kunia-Makilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.077778</td>
      <td>0.077778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>533634</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R) State Rep. Dist. 42 Candidate Kunia-Makiko-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>695028</td>
      <td>MARK MOSES (R)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MARK MOSES (R) State Rep. Dist. 42 Candidate Kunia-Makilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.079545</td>
      <td>0.079545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>708008</td>
      <td>MAEDA TIMSON (D)<br><br>State Rep. Dist. 42 Candidate<br><br>Kunia-Makakilo-Ewo-Village Park-Kapolei-Kunia</td>
      <td>MAEDA TIMSON (D) State Rep. Dist. 42 Candidate Kunia-Makilo-Ewa-Village Park-Kapolei-Kunia</td>
      <td>0.077778</td>
      <td>0.077778</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-257d802h (12 rows)</td>
      <td>1186653</td>
      <td>IRIS IKEDA CATALANI (D)<br><br>State Rep. Dist. 47 Candidate<br><br>Kahalu`u-Kane`ohe</td>
      <td>IRIS IKEDA CATALANI (D) State Rep. Dist. 47 Candidate Kahalu'u-Kane'ohe</td>
      <td>0.084507</td>
      <td>0.084507</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2683bp5b (14 rows)</td>
      <td>1156523</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-2683bp5b (14 rows)</td>
      <td>1289022</td>
      <td>REP. ROMY CACHOLA (D)<br><br>Chair, House Committee on<br><br>Tourism</td>
      <td>Rep. Romy Cachola (D) Chair, House Committee on Tourism</td>
      <td>0.272727</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>99766</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN Newsmakers</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>177778</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>SAM AIONA (R) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>233033</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>440641</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>SAM AIONA (R) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>498532</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>701001</td>
      <td>SAM AIONA (R)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>SAM AIONA (R) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>791391</td>
      <td>BRIAN SCHATZ (D)<br><br>State Rep. Dist. 24 Candidate<br><br>Makiki-Tantalus</td>
      <td>BRIAN SCHATZ (D) State Rep. Dist. 24 Candidate Makiki-Tantalus</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27mpg72s (13 rows)</td>
      <td>1081281</td>
      <td>HENRY MAKINI (R)<br><br>State Senate Dist. 20 Candidate<br><br>Ewa Beach-Makakilo-Kapolei</td>
      <td>HENRY MAKINI (R) State Senate Dist. 20 Candidate Ewa Beach-Makakilo-Kapolei</td>
      <td>0.053333</td>
      <td>0.053333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>96763</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN Newsmakers</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>149016</td>
      <td>WHITNEY ANDERSON (R)<br><br>State Senate Candidate<br><br>District 25 Kailua, Waimanalo</td>
      <td>Whitney Anderson, a State Senate candidate from District 25, Kailua, Waimanalo.</td>
      <td>0.354430</td>
      <td>0.177215</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>312779</td>
      <td>FRED HEMMINGS (R)<br><br>State Senate Candidate<br><br>District 25 Kailua, Waimanalo</td>
      <td>FRED HEMMINGS (R) State Senate Candidate District 25 Kailua, Waimanalo</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>933767</td>
      <td>ALEX SONSON (D)<br><br>State Rep. Candidate<br><br>District 36 Pearl City, Waipahu</td>
      <td>Alex Sonson (D) State Rep. Candidate District 36 Pearl City, Waipahu</td>
      <td>0.176471</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-27zkh3tm (5 rows)</td>
      <td>985652</td>
      <td>ROY TAKUMI (D)<br><br>State Rep. Candidate<br><br>District 36 Pearl City, Waipahu</td>
      <td>ROY TAKUMI (D) State Rep. Candidate District 36 Pearl City, Waipahu</td>
      <td>0.059701</td>
      <td>0.059701</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>232399</td>
      <td>DAN BOYLAN<br><br>Hawaii Public Television</td>
      <td>DAN BOYLAN Hawaii Public Television</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-300zpg5s (14 rows)</td>
      <td>339406</td>
      <td>Ronald T. Y. Moon<br><br>Chief Justice</td>
      <td>Ronald T.Y. Moon Chief Justice</td>
      <td>0.100000</td>
      <td>0.100000</td>
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
      <td>Joseph M. Souki (D) Speaker of the House</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>200501</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>Denise Matsumoto, Honolulu Board of Education Candidate</td>
      <td>0.327273</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>303270</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK Honolulu-Board of Education Candidate</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>443143</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>Denise Matsumoto, Honolulu Board of Education Candidate</td>
      <td>0.327273</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>526126</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK Honolulu-Board of Education Candidate</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>655022</td>
      <td>DENISE MATSUMOTO<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>Denise Matsumoto, Honolulu Board of Education Candidate</td>
      <td>0.327273</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>799900</td>
      <td>MALCOLM KIRKPATRICK<br><br>Honolulu-Board of Education<br><br>Candidate</td>
      <td>MALCOLM KIRKPATRICK Honolulu-Board of Education Candidate</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-30bvqbsq (37 rows)</td>
      <td>877644</td>
      <td>PAUL G. LeMAHIEU Ph.D<br><br>Superintendent of Education</td>
      <td>Paul G. LeMahieu Ph.D. Superintendent of Education</td>
      <td>0.200000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4q0 (2 rows)</td>
      <td>97898</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>55522</td>
      <td>ANNE F. LEE<br><br>President, League of Women<br><br>Voters of Hawaii</td>
      <td>ANNE F. LEE President, League of Women Voters of Hawaii</td>
      <td>0.072727</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>181148</td>
      <td>RANDY MOORE<br><br>Moderator</td>
      <td>RANDY MOORE Moderator</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>318151</td>
      <td>BART FREDO</td>
      <td>BART FREDO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>335636</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>WILLIAM K. "BILLY" KUAIWA</td>
      <td>0.080000</td>
      <td>0.080000</td>
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
      <td>Patsy T. Mink</td>
      <td>0.538462</td>
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
      <td>JOHN WAIIHEE</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns4wm (64 rows)</td>
      <td>1155155</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>WILLIAM K. "BILLY" KUAIWA</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>172906</td>
      <td>JOHN WAIHEE<br><br>DELEGATE, DISTRICT 17B</td>
      <td>JOHN WAIHEE DELEGATE, DISTRICT 17B</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>203770</td>
      <td>RICHARD KAHLE<br><br>Hawaii Tax Director</td>
      <td>RICHARD KAHLE Hawaii Tax Director</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>235269</td>
      <td>BEN CAYETANO (D)<br><br>Lieutenant Governor</td>
      <td>BEN CAYETANO (D) Lieutenant Governor</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>281148</td>
      <td>REP. MICHAEL LIU (R)<br><br>House Minority Leader</td>
      <td>REP. MICHAEL LIU (R) HOUSE MINORITY LEADER</td>
      <td>0.428571</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>333634</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Candidate for Governor</td>
      <td>Rep. Fred Hemmings (R) Candidate for Governor</td>
      <td>0.311111</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>367134</td>
      <td>SAM SLOM<br><br>Small Business Hawaii</td>
      <td>SAM SLOM Small Business Hawaii</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>404905</td>
      <td>SEN. RICHARD WONG (D)<br><br>Senate President</td>
      <td>SEN. RICHARD WONG (D) SENATE PRESIDENT</td>
      <td>0.394737</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>445512</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent of Education</td>
      <td>CHARLES TOGUCHI Superintendent of Education</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-311ns516 (18 rows)</td>
      <td>461395</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
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
      <td>Eddie Flores, CEO, L&L Hawaiian Barbecue</td>
      <td>0.100000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31cjt1d2 (3 rows)</td>
      <td>675142</td>
      <td>Gordon Bruce<br><br>I.T. Director<br><br>City & County of Honolulu</td>
      <td>GORDON BRUCE I.T. DIRECTOR CITY & COUNTY OF HONOLULU</td>
      <td>0.711538</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31qftxh5 (6 rows)</td>
      <td>824391</td>
      <td>Joseph M. Souki (D)<br><br>Speaker of the House</td>
      <td>Joseph M. Souki (D) Speaker of the House</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-31qftxh5 (6 rows)</td>
      <td>993126</td>
      <td>Tom Okamura (D)<br><br>House Majority Leader</td>
      <td>Tom Okamura (D) House Majority Leader</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>91758</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>237137</td>
      <td>Frank Mento<br><br>Kewalo Ocean Activities</td>
      <td>Frank Mento, Kewalo Ocean Activities</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>263764</td>
      <td>Daniel Dinell<br><br>Hawaii Community Development Authority</td>
      <td>DANIEL DINELL, HAWAII COMMUNITY DEVELOPMENT AUTHORITY</td>
      <td>0.811321</td>
      <td>0.037736</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-3331zgtf (4 rows)</td>
      <td>1052886</td>
      <td>Roy Sakuma<br><br>Ukulele Festival Founder</td>
      <td>ROY SAKUMA Ukulele Festival Founder</td>
      <td>0.257143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>343277</td>
      <td>Nina Kealiiwahamana</td>
      <td>"Nina Kealiiwahamanana"</td>
      <td>0.173913</td>
      <td>0.173913</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>398765</td>
      <td>Nina Kealiiwahamana</td>
      <td>The image captures a moment of a woman named Nina Kealiiwahamana standing on a stage, holding a microphone in her hand. She is adorned with a green lei around her neck, adding a touch of cultural flair to her appearance. The backdrop behind her is adorned with the word "Aloha," suggesting a Hawaiian theme to the event. The text "Nina Kealiiwahamana" is prominently displayed at the bottom of the image, indicating her name and possibly her role in the event.</td>
      <td>0.958696</td>
      <td>0.958696</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>423657</td>
      <td>KIMO KAHOANO<br><br>Master of Ceremonies</td>
      <td>KIMO KAHOANO Master of Ceremonies</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>464531</td>
      <td>BENJAMIN J. CAYETANO<br><br>Governor</td>
      <td>Benjamin J. Cayetano, Governor</td>
      <td>0.533333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>505506</td>
      <td>DONOVAN GABOYA<br><br>Kapolei Elementary<br><br>(6th Grader)</td>
      <td>DONOVAN GABOYA Kapolei Elementary (6th Grader)</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>652019</td>
      <td>KIMO KAHOANO<br><br>Master of Ceremonies</td>
      <td>KIMO KAHOANO Master of Ceremonies</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>756256</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO Lt. Governor</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>776877</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO Lt. Governor</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>1143510</td>
      <td>MAZIE K. HIRONO<br><br>Lt. Governor</td>
      <td>MAZIE K. HIRONO Lt. Governor</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-34sj3z70 (23 rows)</td>
      <td>1388755</td>
      <td>BENJAMIN J. CAYETANO<br><br>Governor</td>
      <td>Benjamin J. Cayetano, Governor</td>
      <td>0.533333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-354f4tzn (4 rows)</td>
      <td>104505</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus, EVERYBODY'S BUSINESS</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-354f4tzn (4 rows)</td>
      <td>268135</td>
      <td>David Lassner<br><br>I.T. CHIEF<br><br>UNIVERSITY OF HAWAII</td>
      <td>David Lassner, I.T. Chief, University of Hawaii</td>
      <td>0.510638</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>50517</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>Leslie Wilcox, Election Live</td>
      <td>0.785714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>260027</td>
      <td>ROBERT E. BETHEA<br><br>Chairman<br><br>People for a Better Hawaii</td>
      <td>ROBERT E. BETHEA Chairman People for a Better Hawaii</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>387654</td>
      <td>JERRY ROTHSTEIN<br><br>Spokesman, Save Hapuna<br><br>Initiative Petition (SHIP) Comm.</td>
      <td>JERRY ROTHSTEIN Spokesman, Save Hapuna Initiative Petition (SHIP) Comm.</td>
      <td>0.056338</td>
      <td>0.056338</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>431031</td>
      <td>ROBERT E. BETHEA<br><br>Chairman<br><br>People for a Better Hawaii</td>
      <td>ROBERT E. BETHEA Chairman People for a Better Hawaii</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>639006</td>
      <td>RAYMOND AKI (R)<br><br>Kauai Mayoral Candidate</td>
      <td>RAYMOND AKI (R) Kauai Mayoral Candidate</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>676009</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayoral Candidate</td>
      <td>JOANN YUKIMURA (D) Kauai Mayoral Candidate</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>752886</td>
      <td>JOANN YUKIMURA (D)<br><br>Kauai Mayoral Candidate</td>
      <td>JOANN YUKIMURA (D) Kauai Mayoral Candidate</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>1082649</td>
      <td>DWIGHT TAKAMINE (D)</td>
      <td>The image shows a man wearing a blue suit, a red tie, and an orange lei around his neck. He is standing in front of a white background with a geometric pattern. The text "DWIGHT TAKAMINE (D)" is displayed at the bottom of the image.</td>
      <td>0.918103</td>
      <td>0.918103</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-35t76n5v (17 rows)</td>
      <td>1258258</td>
      <td>FRANK FASI (R)</td>
      <td>FRANK FASI (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-36tx99dz (3 rows)</td>
      <td>295529</td>
      <td>Dan Davidson<br><br>AFFORDABLE HOUSING TASK FORCE HEAD</td>
      <td>Dan Davidson, AFFORDABLE HOUSING TASK FORCE HEAD</td>
      <td>0.041667</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-36tx99dz (3 rows)</td>
      <td>808008</td>
      <td>Leonard Loventhal<br><br>LOAN MANAGER<br><br>CENTRAL PACIFIC HOME LOANS</td>
      <td>LEONARD LOVENTHAL LOAN MANAGER CENTRAL PACIFIC HOME LOANS</td>
      <td>0.315789</td>
      <td>0.070175</td>
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
      <td>GEORGE STAUFFER PRES. STAUFFER & SONS WISCONSIN</td>
      <td>0.085106</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>88889</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>119253</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>John Waihee, Governor</td>
      <td>0.666667</td>
      <td>0.285714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>174775</td>
      <td>Rep. SAMUEL LEE (D)<br><br>Vice Chairman<br><br>House Education Committee</td>
      <td>Rep. SAMUEL LEE (D) Vice Chairman House Education Committee</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>185886</td>
      <td>Sen. BERTRAND<br><br>KOBAYASHI (D)<br><br>Chairman, Senate Education Committee</td>
      <td>Sen. Bertrand Kobayashi (D) is the Chairman of the Senate Education Committee.</td>
      <td>0.423077</td>
      <td>0.230769</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>214281</td>
      <td>Rep. ROD TAM (D)<br><br>Chairman<br><br>House Education Committee</td>
      <td>Rep. ROD TAM (D) Chairman House Education Committee</td>
      <td>0.078431</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>255255</td>
      <td>Rep. BOB McEACHERN<br><br>Minnesota Legislator</td>
      <td>Rep. Bob McAhern, Minnesota Legislator</td>
      <td>0.263158</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>295529</td>
      <td>Sen. MIKE McCARTNEY (D)<br><br>Vice Chairman<br><br>Senate Education Committee</td>
      <td>Sen. Mike McCartney (D) is the Vice Chairman of the Senate Education Committee.</td>
      <td>0.329114</td>
      <td>0.215190</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>414281</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>447648</td>
      <td>EVAN THOMAS<br><br>Common Cause</td>
      <td>Evan Thomas, Common Cause</td>
      <td>0.400000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>461128</td>
      <td>PATSY T. MINK<br><br>The Public Reporter</td>
      <td>Patsy T. Mink, The Public Reporter</td>
      <td>0.264706</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>520521</td>
      <td>Sen. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>Sen. Mary George (R) Senate Minority Leader</td>
      <td>0.232558</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>546380</td>
      <td>Rep. PETER APO (D)<br><br>House Majority Floor Leader</td>
      <td>The image shows a man wearing a Reebok cap and a light blue shirt. He is standing in a room with a dark background. The text on the image reads "Rep. PETER APO (D) House Majority Floor Leader".</td>
      <td>0.772021</td>
      <td>0.772021</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>607007</td>
      <td>JOHN WAIHEE (D)<br><br>Governor</td>
      <td>John Waihee (D) Governor</td>
      <td>0.416667</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>647014</td>
      <td>Rep. ROLAND KOTANI (D)<br><br>Pearl City/Pacific Palisades</td>
      <td>Rep. ROLAND KOTANI (D) Pearl City/Pacific Palisades</td>
      <td>0.039216</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>677010</td>
      <td>Sen. ELOISE TUNGPALAN (D)<br><br>Chairman, Senate Culture<br><br>& Arts Committee</td>
      <td>Sen. ELOISE TUNG PALAN (D) Chairwoman, Senate Culture & Arts Committee</td>
      <td>0.100000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>778779</td>
      <td>Sen. RICK REED (R)<br><br>Senate Minority Floor Leader</td>
      <td>Sen. RICK REED (R) Senate Minority Floor Leader</td>
      <td>0.042553</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>800400</td>
      <td>Sen. GERALD HAGINO (D)<br><br>Senate Majority Leader</td>
      <td>Sen. Gerald Hagino (D) Senate Majority Leader</td>
      <td>0.266667</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>849516</td>
      <td>Sen. RUSSELL BLAIR (D)<br><br>Senate Majority Floor Leader</td>
      <td>Sen. RUSSELL BLAIR (D) Senate Majority Floor Leader</td>
      <td>0.039216</td>
      <td>0.039216</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>948782</td>
      <td>Rep. DWIGHT TAKAMINE (D)<br><br>North Hilo/Hamakua</td>
      <td>The image shows a man wearing glasses and a suit, standing in front of a wooden background. The text on the image reads "Rep. DWIGHT TAKAMINE (D) North Hilo/Hamakua." This indicates that the man is a representative of the Democratic Party, representing the district of North Hilo/Hamakua.</td>
      <td>0.854167</td>
      <td>0.854167</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>1080013</td>
      <td>Rep. DAVID IGE (D)<br><br>Chairman, Economic Dev.<br><br>& Hawaiian Affairs Com.</td>
      <td>The image shows a man wearing glasses and a white shirt. He is standing in front of a wooden door. The text on the image reads "Rep. David Ige (D) Chairman, Economic Dev. & Hawaiian Affairs Com." This indicates that the man is likely a representative from the state of Hawaii, serving in the position of chairman for the Economic Development and Hawaiian Affairs Committee.</td>
      <td>0.849866</td>
      <td>0.833780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-37vmd093 (40 rows)</td>
      <td>1295028</td>
      <td>Sen. LEHUA FERNANDES<br><br>SALLING (D)<br><br>Chairman<br><br>Senate Transportation Committee</td>
      <td>Sen. LEHUA FERNANDEZ SALLING (D) Chairman, Senate Transportation Committee</td>
      <td>0.094595</td>
      <td>0.094595</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>110511</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus, EVERYBODY'S BUSINESS</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>250250</td>
      <td>Peter Rosegg<br><br>HAWAIIAN ELECTRIC</td>
      <td>Peter Rosegg, Hawaiian Electric</td>
      <td>0.516129</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>622155</td>
      <td>Pat Onishi<br><br>AMERICAN INSTITUTE OF ARCHITECTS<br><br>HONOLULU CHAPTER</td>
      <td>PAT ONISHI AMERICAN INSTITUTE OF ARCHITECTS HONOLULU CHAPTER</td>
      <td>0.183333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-38w9gnfz (5 rows)</td>
      <td>958258</td>
      <td>Stuart W. H. Ching<br><br>`IOLANI PALACE</td>
      <td>STUART W. H. CHING IOLANI PALACE</td>
      <td>0.375000</td>
      <td>0.093750</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>452019</td>
      <td>Bruce Smith<br><br>CEO<br><br>Tesoro Corp.</td>
      <td>BRUCE SMITH, CEO, TESORO CORP.</td>
      <td>0.666667</td>
      <td>0.133333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>675142</td>
      <td>Ed Kubo<br><br>U.S. Attorney</td>
      <td>Ed Kubo, U.S. Attorney</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-407wm6z0 (4 rows)</td>
      <td>800901</td>
      <td>Debbie Goodwin<br><br>Keck Observatory</td>
      <td>Debbie Goodwin, Keck Observatory</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>126126</td>
      <td>PETER CARLISLE<br><br>Deputy Prosecutor</td>
      <td>PETER CARLISLE Deputy Prosecutor</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>180013</td>
      <td>CAPT. WILLIAM ORNELLAS<br><br>Honolulu Police Dept.</td>
      <td>CAPT. WILLIAM ORNELLAS HONOLULU POLICE DEPT.</td>
      <td>0.386364</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>194628</td>
      <td>TIMOTHY WALES<br><br>John Howard Association</td>
      <td>Timothy Wales, John Howard Association</td>
      <td>0.315789</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>227761</td>
      <td>ALFRED SUGA<br><br>Deputy Director, DSSH</td>
      <td>ALFRED SUGA Deputy Director, DSSH</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>241141</td>
      <td>JAMES MAY<br><br>Nat. Assoc. Social Workers</td>
      <td>JAMES MAY NAT. ASSOC. SOCIAL WORKERS</td>
      <td>0.527778</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>597631</td>
      <td>LYNNE WATERS</td>
      <td>LYNN WATERS</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>657524</td>
      <td>HERBERT DIAS<br><br>State Director of Taxation</td>
      <td>HERBERT DIAS STATE DIRECTOR OF TAXATION</td>
      <td>0.564103</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-418kpws1 (14 rows)</td>
      <td>790157</td>
      <td>TIM SOGGIN<br><br>Hawn. Sugar Planters<br><br>Association</td>
      <td>TIM SOGGIN Hawn. Sugar Planters Association</td>
      <td>0.093023</td>
      <td>0.093023</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>67901</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM: Hawaii Public Television</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>84251</td>
      <td>CHUCK FREEDMAN<br><br>Governor's Director of<br><br>Communication</td>
      <td>CHUCK FREEDMAN, Governor's Director of Communication</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>181515</td>
      <td>SEN. CLAYTON HEE (D)<br><br>Chair, Senate Judiciary<br><br>Committee</td>
      <td>SEN. CLAYTON HEE (D) CHAIR, SENATE JUDICIARY COMMITTEE</td>
      <td>0.537037</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>235502</td>
      <td>SEN. MAMORU YAMASAKI (D)<br><br>Chair, Senate Ways and means<br><br>Committee</td>
      <td>SEN. MAMORU YAMASAKI (D) Chair, Senate Ways and Means Committee</td>
      <td>0.079365</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>273907</td>
      <td>SEN. RICK REED (R)</td>
      <td>SEN. RICK REED (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>295262</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>352152</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>393894</td>
      <td>WARREN PRICE<br><br>Attorney General</td>
      <td>WARREN PRICE Attorney General</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>448015</td>
      <td>REP. ANDREW LEVIN (D)<br><br>Chair, House Committee on<br><br>Hawaiian Affairs</td>
      <td>Rep. Andrew Levin (D) Chair, House Committee on Hawaiian Affairs</td>
      <td>0.234375</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-41mgqsz7 (11 rows)</td>
      <td>534768</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>105138</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus, EVERYBODY'S BUSINESS</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>259893</td>
      <td>Irene Bowie<br><br>MAUI TOMORROW FOUNDATION</td>
      <td>Irene Bowie, Maui Tomorrow Foundation</td>
      <td>0.567568</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-4298sk4k (5 rows)</td>
      <td>827127</td>
      <td>Mark Yamane<br><br>HAWAII PACIFIC FEDERAL CREDIT UNION</td>
      <td>Mark Yamane, Hawaii Pacific Federal Credit Union</td>
      <td>0.583333</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>108275</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>Leslie Wilcox, Election Live</td>
      <td>0.785714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>270904</td>
      <td>JOHN RADCLIFFE<br><br>Former Congressional Candidate</td>
      <td>John Radcliffe, Former Congressional Candidate</td>
      <td>0.282609</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>347514</td>
      <td>GERRY KEIR<br><br>Managing Editor<br><br>Honolulu Advertiser</td>
      <td>Gerry Keir, Managing Editor, Honolulu Advertiser</td>
      <td>0.229167</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>422756</td>
      <td>JOHN RADCLIFFE<br><br>Former Congressional Candidate</td>
      <td>John Radcliffe, Former Congressional Candidate</td>
      <td>0.282609</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>488522</td>
      <td>GERRY KEIR<br><br>Managing Editor<br><br>Honolulu Advertiser</td>
      <td>Gerry Keir, Managing Editor, Honolulu Advertiser</td>
      <td>0.229167</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>784151</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>The woman is standing in front of a sign that reads "215 Campaign Spending Commission Office of the Lieutenant Governor". She is wearing a white cardigan and a necklace. The text "Nina Berglund Election Live" is displayed at the bottom of the screen.</td>
      <td>0.936000</td>
      <td>0.900000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>801635</td>
      <td>DAN TUTTLE<br><br>Political Analyst</td>
      <td>Dan Tuttle, a political analyst, is seated in front of a bookshelf filled with books.</td>
      <td>0.788235</td>
      <td>0.682353</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-44bnzxh7 (20 rows)</td>
      <td>830030</td>
      <td>ANDREW POEPOE<br><br>Co-Chairman<br><br>Saiki in '88 Committee</td>
      <td>ANDREW POEPOE Co-Chairman Saiki in '88 Committee</td>
      <td>0.083333</td>
      <td>0.083333</td>
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
      <td>The image is a close-up of a man wearing a yellow shirt with blue and green patterns. He is wearing glasses and has a mustache. The background is blue with a pattern of chevrons. The text "JERRY BURRIS Politics Editor Honolulu Advertiser" is displayed in yellow at the bottom of the image.</td>
      <td>0.847751</td>
      <td>0.847751</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-45q83h0w (7 rows)</td>
      <td>410644</td>
      <td>ANDREW K. POEPOE<br><br>State Representative</td>
      <td>ANDREW K. POEPOE STATE REPRESENTATIVE</td>
      <td>0.513514</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>98765</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>Lesli Wilcox, Hawaii Public Television</td>
      <td>0.315789</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>221755</td>
      <td>PAM JAASKO<br><br>The Parent Line</td>
      <td>PAM JAASKO The Parent Line</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>243777</td>
      <td>FRED<br><br>Parent</td>
      <td>FRED Parent</td>
      <td>0.181818</td>
      <td>0.181818</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>264631</td>
      <td>JONATHAN RIETA<br><br>Parent</td>
      <td>JONATHAN RIETA Parent</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>381782</td>
      <td>MEREDITH MAEDA<br><br>Kailua High Principal</td>
      <td>MEREDITH MAEDA Kailua High Principal</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>405272</td>
      <td>PAM JAASKO<br><br>The Parent Line</td>
      <td>PAM JAASKO The Parent Line</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>448282</td>
      <td>STEPHEN CHOY, PhD<br><br>Psychologist</td>
      <td>STEPHEN CHOY, PhD Psychologist</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>575776</td>
      <td>KEN YAMAMOTO<br><br>Dept. of Education</td>
      <td>KEN YAMAMOTO Dept. of Education</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>727127</td>
      <td>ROBERTA LORENZO<br><br>Toughlove</td>
      <td>ROBERTA LORENZO Toughlove</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1267000</td>
      <td>KEN YAMAMOTO<br><br>Dept. of Education</td>
      <td>KEN YAMAMOTO Dept. of Education</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1377377</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>Lesli Wilcox, Hawaii Public Television</td>
      <td>0.315789</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-46qz65g2 (37 rows)</td>
      <td>1405405</td>
      <td>ROBERTA LORENZO<br><br>Toughlove</td>
      <td>ROBERTA LORENZO Toughlove</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-47rn8tt8 (1 rows)</td>
      <td>241775</td>
      <td>Steve Van Ribbink<br><br>CFO, HMSA</td>
      <td>STEVE VAN RIBBINK CFO, HMSA</td>
      <td>0.518519</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>97397</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>Lesley Wilcox Hawaii Public Television</td>
      <td>0.315789</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>175876</td>
      <td>JONATHAN DENNIS<br><br>Director, The New Zealand<br><br>Film Archive</td>
      <td>Jonathan Dennis, Director, The New Zealand Film Archive</td>
      <td>0.290909</td>
      <td>0.072727</td>
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
      <td>Witarina Harris</td>
      <td>0.800000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-48sbchm7 (13 rows)</td>
      <td>1404404</td>
      <td>JONATHAN DENNIS<br><br>Director, The New Zealand<br><br>Film Archive</td>
      <td>Jonathan Dennis, Director, The New Zealand Film Archive</td>
      <td>0.290909</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>85886</td>
      <td>JOE MOOR<br><br>CHANNEL 2 NEWS</td>
      <td>JOE MOORE CHANNEL 2 NEWS</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>155022</td>
      <td>GERRY KEIR<br><br>HONOLULU ADVERTISER<br><br>MANAGING EDITOR</td>
      <td>GERRY KEIR HONOLULU ADVERTISER MANAGING EDITOR</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>237004</td>
      <td>MARY BITTERMAN<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>MARY-BITTERMAN CONGRESSIONAL CANDIDATE</td>
      <td>0.078947</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>296129</td>
      <td>BLASE HARRIS<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>BLASE HARRIS CONGRESSIONAL CANDIDATE</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>358158</td>
      <td>PATRICIA SAIKI<br><br>CONGRESSIONAL CANDIDATE</td>
      <td>PATRICIA SAIKI, CONGRESSIONAL CANDIDATE</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>440007</td>
      <td>ANNE HARPHAM<br><br>HONOLULU ADVERTISER</td>
      <td>ANNE HARPHAM, HONOLULU ADVERTISER</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-49t1g691 (14 rows)</td>
      <td>1032766</td>
      <td>BARBARA MARSHALL<br><br>CHANNEL 2 NEWS</td>
      <td>Barbara Marshall, Channel 2 News</td>
      <td>0.750000</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvnn (3 rows)</td>
      <td>272639</td>
      <td>Calvin Say<br><br>Speaker of the House</td>
      <td>CALVIN SAY, SPEAKER OF THE HOUSE</td>
      <td>0.750000</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvnn (3 rows)</td>
      <td>865532</td>
      <td>Joe Davis<br><br>General Manager<br><br>Hawaii Convention Center</td>
      <td>Joe Davis, General Manager, Hawaii Convention Center</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvpc (3 rows)</td>
      <td>284885</td>
      <td>Bill Chee<br><br>CEO<br><br>Prudential Locations</td>
      <td>Bill CHEE, CEO, PRUDENTIAL LOCATIONS</td>
      <td>0.666667</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-50tqjvpc (3 rows)</td>
      <td>1024157</td>
      <td>Gunner Hartner<br><br>Honda Windward</td>
      <td>Gunner Hartner, Honda Windward</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51hhmnck (3 rows)</td>
      <td>250150</td>
      <td>Bruce Smith<br><br>CEO<br><br>Tesoro Corp.</td>
      <td>Bruce Smith, CEO, Tesoro Corp.</td>
      <td>0.133333</td>
      <td>0.133333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51hhmnck (3 rows)</td>
      <td>622389</td>
      <td>Darren Kimura<br><br>Energy Industries</td>
      <td>DARREN KIMURA ENERGY INDUSTRIES</td>
      <td>0.838710</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>99766</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>286753</td>
      <td>Connie Lau<br><br>CEO<br><br>American Savings Bank</td>
      <td>Connie Lau, CEO, American Savings Bank</td>
      <td>0.105263</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>644878</td>
      <td>Sterling Paulos<br><br>Hotel Director<br><br>NCL Hawaii</td>
      <td>STERLING PAULOS, Hotel Director, NCL HAWAII</td>
      <td>0.488372</td>
      <td>0.093023</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>954521</td>
      <td>Susan Todani<br><br>Director of Investments<br><br>Kamehameha Schools</td>
      <td>Susan Todani, Director of Investments, Kamehameha Schools</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnj5t (5 rows)</td>
      <td>1032032</td>
      <td>Rosalind Schurgin<br><br>Executive Vice President<br><br>Festival Companies</td>
      <td>Rosalind Schurgin, Executive Vice President, Festival Companies</td>
      <td>0.063492</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnjgb (15 rows)</td>
      <td>792125</td>
      <td>Norman Mizuguchi (D)<br><br>Senate President</td>
      <td>Norman Mizuguchi, D, Senate President</td>
      <td>0.135135</td>
      <td>0.135135</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-51vdnjgb (15 rows)</td>
      <td>1162896</td>
      <td>Norman Mizuguchi (D)<br><br>Senate President</td>
      <td>Norman Mizuguchi (D) Senate President</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>101902</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
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
      <td>SEN. RON MENOR (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>256890</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>SEN. MARY-JANE McMURDO (D)</td>
      <td>0.000000</td>
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
      <td>Tom Selleck is giving a speech at a podium with a microphone. He is wearing a suit and a red flower garland around his neck.</td>
      <td>0.975806</td>
      <td>0.911290</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>365032</td>
      <td>TOM SELLECK</td>
      <td>Tom Selleck is giving a speech at a podium with a microphone. He is wearing a white shirt and a red flower garland around his neck.</td>
      <td>0.977099</td>
      <td>0.916031</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>415516</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>466767</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>481515</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br><br>Chair, Senate Education<br><br>Committee</td>
      <td>SEN. NORMAN MIZUGUCHI (D) Chair, Senate Education Committee</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>516283</td>
      <td>REP. ROD TAM (D)<br><br>Chair, House Education<br><br>Committee</td>
      <td>ROD TAM (D) Chair, House Education Committee</td>
      <td>0.204545</td>
      <td>0.204545</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>609276</td>
      <td>REP. ROD TAM (D)<br><br>Chair, House Education<br><br>Committee</td>
      <td>REP. ROD TAM (D) Chair, House Education Committee</td>
      <td>0.081633</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>638505</td>
      <td>SEN. NORMAN MIZUGUCHI (D)<br><br>Chair, Senate Education<br><br>Committee</td>
      <td>SEN. NORMAN MIZUGUCHI (D) Chair, Senate Education Committee</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>671505</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>759259</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>823657</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>908275</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>GOV. JOHN WAIHEE</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>939506</td>
      <td>DONNIS THOMPSON<br><br>Chair, YWCA Leaderluncheon</td>
      <td>DONNIS THOMPSON Chair, YWCA Leaderluncheon</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>1152152</td>
      <td>BRUCE ANDERSON<br><br>State Health Department</td>
      <td>BRUCE ANDERSON STATE HEALTH DEPARTMENT</td>
      <td>0.526316</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5269pfd1 (83 rows)</td>
      <td>1296129</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-5370s3m0 (2 rows)</td>
      <td>487020</td>
      <td>Vicki Harris<br><br>Executive Director<br><br>Vanpool Hawaii</td>
      <td>Vicki Harris, Executive Director, Vanpool Hawaii</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-53wstwhr (3 rows)</td>
      <td>102903</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus, EVERYBODY'S BUSINESS</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-53wstwhr (3 rows)</td>
      <td>1203403</td>
      <td>Mary Flood<br><br>VICE PRESIDENT OF SALES<br><br>SCHULER HOMES</td>
      <td>Mary Flood, Vice President of Sales, Schuler Homes</td>
      <td>0.620000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54kkwnxg (3 rows)</td>
      <td>612145</td>
      <td>Janice Mizuno<br><br>OWNER<br><br>ANIMATION MAGIC</td>
      <td>Janice Mizuno, Owner, Animation Magic</td>
      <td>0.540541</td>
      <td>0.108108</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54kkwnxg (3 rows)</td>
      <td>946880</td>
      <td>Lavina Wong<br><br>DIRECTOR OF SPECIAL EVENTS<br><br>MACY'S</td>
      <td>LAVINA WONG, DIRECTOR OF SPECIAL EVENTS, MACY'S</td>
      <td>0.255319</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>94027</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>240908</td>
      <td>Wendy Goodenow<br><br>HNL Travel</td>
      <td>Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow, Wendy Goodenow,</td>
      <td>0.974961</td>
      <td>0.973396</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>599266</td>
      <td>Jeff Berger<br><br>Kapalua Bay Resort</td>
      <td>Jeff Berger, Kapalua Bay Resort</td>
      <td>0.064516</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-54xgxjx2 (6 rows)</td>
      <td>896396</td>
      <td>Rex Kim<br><br>Korean Chamber of Commerce</td>
      <td>Rex Kim, Korean Chamber of Commerce</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>102402</td>
      <td>Howard Dicus<br><br>EVERYBODY'S BUSINESS</td>
      <td>Howard Dicus, EVERYBODY'S BUSINESS</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>237271</td>
      <td>Harvey Shapiro<br><br>ECONOMIST<br><br>HONOLULU BOARD OF REALTORS</td>
      <td>Harvey Shapiro, Economist, Honolulu Board of Realtors</td>
      <td>0.603774</td>
      <td>0.075472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-55z617mg (4 rows)</td>
      <td>594027</td>
      <td>Michael Kramer<br><br>NATURAL INVESTMENT SERVICES, LLC</td>
      <td>Michael Kramer, Natural Investment Services, LLC</td>
      <td>0.500000</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>89890</td>
      <td>LESLIE WILCOX<br><br>Hawaii Public Television</td>
      <td>Leslie Wilcox, Hawaii Public Television</td>
      <td>0.307692</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>156523</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>241642</td>
      <td>GERALD KATO<br><br>Assignment Editor<br><br>KITV News 4</td>
      <td>Gerald Kato, Assignment Editor, KITV News 4</td>
      <td>0.279070</td>
      <td>0.093023</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>318018</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, POLITICS EDITOR, HONOLULU ADVERTISER</td>
      <td>0.640000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>500033</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>560027</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, POLITICS EDITOR, HONOLULU ADVERTISER</td>
      <td>0.640000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>604271</td>
      <td>RICHARD BORRECA<br><br>Political Bureau Chief<br><br>Honolulu Star-Bulletin</td>
      <td>Richard Borreca, Political Bureau Chief, Honolulu Star-Bulletin</td>
      <td>0.253968</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>972639</td>
      <td>RICHARD BORRECA<br><br>Political Bureau Chief<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORREGA, POLITICAL BUREAU CHIEF, HONOLULU STAR-BULLETIN</td>
      <td>0.619048</td>
      <td>0.079365</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>1013146</td>
      <td>JERRY BURRIS<br><br>Politics Editor<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, POLITICS EDITOR, HONOLULU ADVERTISER</td>
      <td>0.640000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-58pc8cvz (17 rows)</td>
      <td>1087654</td>
      <td>DAN BOYLAN<br><br>Professor of History<br><br>West Oahu College</td>
      <td>Dan Boylan, Professor of History, West Oahu College</td>
      <td>0.215686</td>
      <td>0.078431</td>
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
      <td>PETER YOUNG, CHAIRMAN, DEPT. OF LAND & NATURAL RESOURCES</td>
      <td>0.696429</td>
      <td>0.035714</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>242142</td>
      <td>Judith Fogarty<br><br>NOAA Fisheries Enforcement</td>
      <td>Judith Fogarty, NOAA Fisheries Enforcement</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>503003</td>
      <td>Bill Chee<br><br>CEO, Prudential Properties</td>
      <td>Bill CHEE, CEO, PRUDENTIAL PROPERTIES</td>
      <td>0.621622</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b58c (6 rows)</td>
      <td>1255255</td>
      <td>Michelle Kennedy<br><br>Customer Communications, TheBus</td>
      <td>Michelle Kennedy, Customer Communications, TheBus</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>220254</td>
      <td>DAN BOYLAN<br><br>Hawaii Public Television</td>
      <td>DAN BOYLAN Hawaii Public Television</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>327528</td>
      <td>Ronald T. Y. Moon<br><br>Chief Justice</td>
      <td>Ronald T.Y. Moon, Chief Justice</td>
      <td>0.096774</td>
      <td>0.096774</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-59c5b5gq (11 rows)</td>
      <td>645779</td>
      <td>Joseph M. Souki (D)<br><br>Speaker of the House</td>
      <td>Joseph M. Souki (D) Speaker of the House</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-60qrfqn9 (3 rows)</td>
      <td>243277</td>
      <td>Jonathan Ornstein<br><br>CEO, Mesa Air</td>
      <td>Jonathan Ornstein, CEO, Mesa Air</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>96129</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM Hawaii Edition</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>137504</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD President Kauai Chamber of Commerce</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>173774</td>
      <td>TOM SHIGEMOTO<br><br>Kauai Planning Director</td>
      <td>TOM SHIGEMOTO, Kauai Planning Director</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>228028</td>
      <td>TOM CONTRADES<br><br>Kauai Planning Commission</td>
      <td>TOM CONTRADES, KAUAI PLANNING COMMISSION</td>
      <td>0.550000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>238505</td>
      <td>ANNETTE CASSIDY<br><br>President<br><br>Thousand Friends of Kauai</td>
      <td>ANNETTE CASSIDY PRESIDENT THOUSAND FRIENDS OF KAUAI</td>
      <td>0.607843</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>267267</td>
      <td>TOM CONTRADES<br><br>Kauai Planning Commission</td>
      <td>TOM CONTRADES, Kauai Planning Commission</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>275008</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD President Kauai Chamber of Commerce</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>327895</td>
      <td>TONY KUNIMURA<br><br>Former Kauai Mayor</td>
      <td>TONY KUNIMURA Former Kauai Mayor</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>353387</td>
      <td>ANNETTE CASSIDY<br><br>President<br><br>Thousand Friends of Kauai</td>
      <td>ANNETTE CASSIDY PRESIDENT THOUSAND FRIENDS OF KAUAI</td>
      <td>0.607843</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>368001</td>
      <td>MARK HUBBARD<br><br>President<br><br>Kauai Chamber of Commerce</td>
      <td>MARK HUBBARD President Kauai Chamber of Commerce</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>380380</td>
      <td>TONY KUNIMURA<br><br>Former Kauai Mayor</td>
      <td>TONY KUNIMURA Former Kauai Mayor</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>416383</td>
      <td>MAXINE CORREA (D)<br><br>Kauai Council Chair</td>
      <td>MAXINE CORREA (D) KAUAI COUNCIL CHAIR</td>
      <td>0.432432</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>452653</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>Joann Yukimura, Mayor of Kauai</td>
      <td>0.566667</td>
      <td>0.200000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>588021</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>JOANN YUKIMURA (D) Mayor of Kauai</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>723023</td>
      <td>JOANN YUKIMURA (D)<br><br>Mayor of Kauai</td>
      <td>JOANN YUKIMURA (D) Mayor of Kauai</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1002402</td>
      <td>ELIZABETH FUJIWARA<br><br>Civil Rights Attorney</td>
      <td>ELIZABETH FUJIWARA CIVIL RIGHTS ATTORNEY</td>
      <td>0.450000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1046146</td>
      <td>JOHN KNOREK<br><br>Corporate Attorney</td>
      <td>John Knorek, Corporate Attorney</td>
      <td>0.322581</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1072272</td>
      <td>ELIZABETH FUJIWARA<br><br>Civil Rights Attorney</td>
      <td>ELIZABETH FUJIWARA CIVIL RIGHTS ATTORNEY</td>
      <td>0.450000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n305 (25 rows)</td>
      <td>1156890</td>
      <td>VERA BENEDEK<br><br>Hawaii Public Television</td>
      <td>VERA BENEDEK Hawaii Public Television</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>62629</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM, LYNETTE LO TOM,</td>
      <td>0.957393</td>
      <td>0.942356</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>83383</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>Rep. Brian Taniguchi (D)</td>
      <td>0.583333</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>137137</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>Rep Brian Taniguchi (D)</td>
      <td>0.652174</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>169770</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>233267</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>253520</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>Rep. Brian Taniguchi (D)</td>
      <td>0.583333</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>297631</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>SEN. MAMORU YAMASAKI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>315015</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>379012</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>390257</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Chair, Government Operations<br><br>Committee</td>
      <td>SEN. RUSSELL BLAIR (D) CHAIR, GOVERNMENT OPERATIONS COMMITTEE</td>
      <td>0.557377</td>
      <td>0.065574</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>435769</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Chair, Government Operations<br><br>Committee</td>
      <td>SEN. RUSSELL BLAIR (D) Chair, Government Operations Committee</td>
      <td>0.065574</td>
      <td>0.065574</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>477377</td>
      <td>REBECCA SENUTOVITCH<br><br>American Association of<br><br>University Women</td>
      <td>Rebecca Senutovitch, American Association of University Women</td>
      <td>0.327869</td>
      <td>0.065574</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>505138</td>
      <td>BUCK BUCHWACH<br><br>Honolulu Advertiser</td>
      <td>BUCK BUCKWACH HONOLULU ADVERTISER</td>
      <td>0.575758</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>529530</td>
      <td>G. A. "RED" MORRIS</td>
      <td>G. A. "RED" MORRIS</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>547781</td>
      <td>JANICE WOLF<br><br>Admin. Director State Judiciary</td>
      <td>Janice Wolf, Admin. Director State Judiciary</td>
      <td>0.227273</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>578278</td>
      <td>JAY SCHARF<br><br>Common Cause Hawaii</td>
      <td>Jay Scharf, Common Cause Hawaii</td>
      <td>0.290323</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>603003</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>654021</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>675008</td>
      <td>DANTE CARPENTER<br><br>Hawaii County Mayor</td>
      <td>DANTE CARPENTER HAWAII COUNTY MAYOR</td>
      <td>0.457143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>697264</td>
      <td>HANNIBAL TAVARES<br><br>Maui County Mayor</td>
      <td>HANNIBAL TAVARES MAUI COUNTY MAYOR</td>
      <td>0.411765</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>706006</td>
      <td>SPENCER KALANI SCHUTTE<br><br>Hawaii County Councilmember</td>
      <td>SPENCER KALANI SCHUTTE Hawaii County Councilmember</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>742876</td>
      <td>JOSEPH CONANT<br><br>Dir., State Housing Finance<br><br>& Development Corp.</td>
      <td>JOSEPH CONANT, Director, State Housing Finance & Development Corp.</td>
      <td>0.136364</td>
      <td>0.136364</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>782282</td>
      <td>STANLEY KAWAGUCHI<br><br>Consulting Engineers Council</td>
      <td>STANLEY-KAWAGUCHI Consulting Engineers Council</td>
      <td>0.065217</td>
      <td>0.065217</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>797631</td>
      <td>DONNA MERCADO KIM<br><br>Honolulu City Councilmember</td>
      <td>Donna Mercado Kim, Honolulu City Councilmember</td>
      <td>0.304348</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>907641</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>922022</td>
      <td>SEN. RUSSELL BLAIR (D)</td>
      <td>SEN. RUSSELL BLAIR (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-62s4n31w (97 rows)</td>
      <td>942776</td>
      <td>REP. DWIGHT TAKAMINE (D)<br><br>Chair, House Labor Committee</td>
      <td>REPR DWIGHT TAKAMINE (D) Chair, House Labor Committee</td>
      <td>0.056604</td>
      <td>0.056604</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>104771</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN Newsmakers</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>160027</td>
      <td>KELLY ZANE (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>Kelly Zane (D) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.137500</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>215649</td>
      <td>GREG KNUDSEN (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>Greg Knudsen (D) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.158537</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>308275</td>
      <td>ROY BENHAM (D)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>ROY BENHAM (D) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>865532</td>
      <td>KERRIE (Lane) WOODALL (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>KERRIE (Lane) WOODALL (R) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.043956</td>
      <td>0.043956</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>914281</td>
      <td>WILLIAM STONEBRAKER (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>WILLIAM STONEBRAKER (R) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.044944</td>
      <td>0.044944</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nznq (9 rows)</td>
      <td>1062529</td>
      <td>ADRIENNE KING (R)<br><br>State Rep. Dist. 15 Candidate<br><br>Kalama Valley, Hawaii Kai, Portlock</td>
      <td>ADRIENNE KING (R) State Rep. Dist. 15 Candidate Kalama Valley, Hawaii Kai, Portlock</td>
      <td>0.048193</td>
      <td>0.048193</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nzq5 (2 rows)</td>
      <td>693527</td>
      <td>Nola Nahulu<br><br>Artistic Director<br><br>Hawaii Youth Opera Chorus</td>
      <td>NOLA NAHULU, ARTISTIC DIRECTOR, HAWAII YOUTH OPERA CHORUS</td>
      <td>0.771930</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-6341nzq5 (2 rows)</td>
      <td>733033</td>
      <td>Selena Ching<br><br>Executive Director<br><br>Hawaii Youth Symphony</td>
      <td>SELENA CHING, EXECUTIVE DIRECTOR, HAWAII YOUTH SYMPHONY</td>
      <td>0.800000</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-644qrn7r (2 rows)</td>
      <td>353153</td>
      <td>Judith Kalbrener<br><br>President<br><br>Honolulu Board of Realtors</td>
      <td>JUDITH KALBRENER PRESIDENT HONOLULU BOARD OF REALTORS</td>
      <td>0.849057</td>
      <td>0.075472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-644qrn7r (2 rows)</td>
      <td>621655</td>
      <td>Brian Black<br><br>Pasha Hawaii</td>
      <td>Brian Black, Pasha Hawaii</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65h9w6jg (7 rows)</td>
      <td>301502</td>
      <td>GEORGE TAKANE<br><br>HOUSE CLERK</td>
      <td>George Takane, House Clerk.</td>
      <td>0.777778</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65h9w6jg (7 rows)</td>
      <td>410511</td>
      <td>HERMAN LUM<br><br>CHIEF JUSTICE<br><br>HAWAII SUPREME COURT</td>
      <td>HERMAN LUM CHIEF JUSTICE HAWAII SUPREME COURT</td>
      <td>0.088889</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65v6x41w (18 rows)</td>
      <td>250150</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent<br><br>Dept. of Education</td>
      <td>Charles Togechi, Superintendent of Education</td>
      <td>0.477273</td>
      <td>0.227273</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-65v6x41w (18 rows)</td>
      <td>1179646</td>
      <td>Rep. DANIEL KIHANO</td>
      <td>Rep. DANIEL KIHANO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p11 (1 rows)</td>
      <td>590023</td>
      <td>Mona Abadir<br><br>Hawaii State Foundation<br><br>on Culture and the Arts</td>
      <td>MONA ABADIR, HAWAII STATE FOUNDATION ON CULTURE AND THE ARTS</td>
      <td>0.783333</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p2r (4 rows)</td>
      <td>233634</td>
      <td>David Carey<br><br>CEO<br><br>Outrigger</td>
      <td>David Carey, CEO, Outrigger</td>
      <td>0.148148</td>
      <td>0.148148</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1p2r (4 rows)</td>
      <td>571138</td>
      <td>Harvey Shapiro<br><br>Economist</td>
      <td>HARVEY SHAPIRO ECONOMIST</td>
      <td>0.875000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>252886</td>
      <td>CHRIS COOK<br><br>Kauai County Economic<br><br>Development Coordinator</td>
      <td>CHRIS COOK, Kauai County Economic Development Coordinator</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>267134</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>292392</td>
      <td>REP. DAVID IGE (D)<br><br>House Economic<br><br>Development Chair</td>
      <td>REP. DAVID IGE (D) HOUSE ECONOMIC DEVELOPMENT CHAIR</td>
      <td>0.568627</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>401001</td>
      <td>JIM MANKE<br><br>State Information Service Dir.</td>
      <td>JIM MANKE State Information Service Dir.</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>481281</td>
      <td>REP. CAROL FUKUNAGA (D)<br><br>House Legislative<br><br>Management Chair</td>
      <td>CAROL FUKUNAGA (D) House Legislative Management Chair</td>
      <td>0.169811</td>
      <td>0.169811</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>556256</td>
      <td>DESMOND BYRNE<br><br>Citizen Advocate</td>
      <td>Desmond Byrne, Citizen Advocate</td>
      <td>0.387097</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>664765</td>
      <td>REP. CAROL FUKUNAGA (D)<br><br>House Legislative<br><br>Management Chair</td>
      <td>CAROL FUKUNAGA (D) House Legislative Management Chair</td>
      <td>0.169811</td>
      <td>0.169811</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>926760</td>
      <td>JESSE OLANOLAN<br><br>Kapaa High School Student</td>
      <td>JESSE OLANOLAN Kapaah High School Student</td>
      <td>0.073171</td>
      <td>0.073171</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>979012</td>
      <td>CLARENCE KAONA<br><br>Bus Driver</td>
      <td>Clarence Kaona is a bus driver.</td>
      <td>0.645161</td>
      <td>0.225806</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>1032766</td>
      <td>EUGENE IMAI<br><br>Department of Education</td>
      <td>Eugene Imai, Department of Education.</td>
      <td>0.297297</td>
      <td>0.081081</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-676t1pd0 (24 rows)</td>
      <td>1406139</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS Honolulu Advertiser</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>283750</td>
      <td>Ricky Cassiday<br><br>Home Price Researcher</td>
      <td>RICKY CASSIDAY HOME PRICE RESEARCHER</td>
      <td>0.805556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>964531</td>
      <td>Chris van Bergeijk<br><br>VP Programs<br><br>Hawaii Community Foundation</td>
      <td>CHRIS VAN BERGEIJK VP PROGRAMS HAWAII COMMUNITY FOUNDATION</td>
      <td>0.810345</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67jq2jv9 (3 rows)</td>
      <td>1289656</td>
      <td>Melanie Okazaki<br><br>Marketing Manager<br><br>McDonald's</td>
      <td>Melanie Okazaki, Marketing Manager, McDonald's</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>102002</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>274007</td>
      <td>Ted Liu<br><br>Director<br><br>DBEDT</td>
      <td>TED LIU DIRECTOR DBDET</td>
      <td>0.772727</td>
      <td>0.272727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-67wm3fvw (5 rows)</td>
      <td>697631</td>
      <td>Chuck Sted<br><br>Kapiolani Medical Center</td>
      <td>CHUCK STED KAPIOLANI MEDICAL CENTER</td>
      <td>0.800000</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>68268</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>Leslie Wilcox, Election Live</td>
      <td>0.785714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>122256</td>
      <td>FRED HEMMINGS<br><br>Republican</td>
      <td>FRED HEMMINGS Republican</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>185752</td>
      <td>PATSY T. MINK<br><br>Democrat</td>
      <td>Patsy T. Mink is a Democrat.</td>
      <td>0.500000</td>
      <td>0.250000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>289022</td>
      <td>FRED HEMMINGS<br><br>Republican</td>
      <td>FRED HEMMINGS Republican</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>423757</td>
      <td>PATSY T. MINK<br><br>Democrat</td>
      <td>Patsy T. Mink, Democrat</td>
      <td>0.391304</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>580514</td>
      <td>MARIA HUSTACE (R)<br><br>Senatorial Candidate</td>
      <td>MARIA HUSTACE (R) SENATORIAL CANDIDATE</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>585018</td>
      <td>KEN SCHOOLLAND (L)<br><br>Senatorial Candidate</td>
      <td>KEN SCHOOLLAND (L) SENATORIAL CANDIDATE</td>
      <td>0.487179</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>629396</td>
      <td>SPARK MATSUNAGA (D)<br><br>U.S. Senator</td>
      <td>SPARK MATSUNAGA (D) U.S. SENATOR</td>
      <td>0.250000</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>660761</td>
      <td>MARIA HUSTACE (R)<br><br>Senatorial Candidate</td>
      <td>MARIA HUSTACE (R) SENATORIAL CANDIDATE</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>679379</td>
      <td>KEN SCHOOLLAND (L)<br><br>Senatorial Candidate</td>
      <td>KEN SCHOOLLAND (L) SENATORIAL CANDIDATE</td>
      <td>0.487179</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>801134</td>
      <td>BERNARD AKANA (R)<br><br>Mayoral Candidate<br><br>Hawaii County</td>
      <td>BERNARD AKANA (R) MAYORAL CANDIDATE HAWAII COUNTY</td>
      <td>0.571429</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>1052519</td>
      <td>NINA BERGLUND<br><br>Election Live</td>
      <td>NINA BERGLUND Election Live</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-687h4bv1 (34 rows)</td>
      <td>1066900</td>
      <td>BETTE TATUM<br><br>National Federation of <br><br>Independent Business</td>
      <td>BETTE TATUM National Federation of Independent Business</td>
      <td>0.072727</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>334134</td>
      <td>Michael Kosmin<br><br>Centex Destinations</td>
      <td>Michael Kosmin, CenTex Destinations</td>
      <td>0.085714</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>1191758</td>
      <td>Dave Plaskett<br><br>Hawaii Coffee Company</td>
      <td>Dave Plaskett, Hawaii Coffee Company</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69m37x2m (3 rows)</td>
      <td>1273006</td>
      <td>Allen Kaufman<br><br>President<br><br>Seasoned Citizens</td>
      <td>Allen Kaufman, President, Seasoned Citizens</td>
      <td>0.093023</td>
      <td>0.093023</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08szb (5 rows)</td>
      <td>815649</td>
      <td>Valerie Love, Director<br><br>Gain Awareness Through Education<br><br>Atlanta</td>
      <td>Valerie Love, Director, Gain Awareness Through Education, Atlanta</td>
      <td>0.061538</td>
      <td>0.061538</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>695896</td>
      <td>Richard Onishi (D)<br><br>House of Representatives, District 2</td>
      <td>Richard Onishi [D] House of Representatives, District 2</td>
      <td>0.072727</td>
      <td>0.072727</td>
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
      <td>Russell Kokubun (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1040407</td>
      <td>Stephen Yamashiro (D)</td>
      <td>Stephen Yamashiro ID</td>
      <td>0.100000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-69z08t1g (9 rows)</td>
      <td>1167267</td>
      <td>Wendell Kaehuaea (R)</td>
      <td>Wendell Kaehuea [R]</td>
      <td>0.157895</td>
      <td>0.157895</td>
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
      <td>Marcus Oshiro, House Majority Leader, Hawaii Legislature</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-720cg58f (1 rows)</td>
      <td>638639</td>
      <td>Michael Kliks<br><br>President<br><br>Hawaii Beekeepers Association</td>
      <td>Michael Kliks, President, Hawaii Beekeepers Association</td>
      <td>0.072727</td>
      <td>0.072727</td>
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
      <td>Reverend Chris Eng, United Church of Christ</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hxtv (4 rows)</td>
      <td>252386</td>
      <td>John Garibaldi<br><br>CEO<br><br>Hawaii Superferry</td>
      <td>JOHN GARIBALDI, CEO, HAWAII SUPERFERRY</td>
      <td>0.763158</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hxtv (4 rows)</td>
      <td>676009</td>
      <td>Edgy Lee<br><br>PacificNetwork.tv</td>
      <td>EDGY LEE PACIFICNETWORK.TV</td>
      <td>0.807692</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>223023</td>
      <td>FRANK FASI (R)<br><br>Honolulu Mayor</td>
      <td>FRANK FASI (R) HONOLULU MAYOR</td>
      <td>0.448276</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>319152</td>
      <td>CHRIS HART<br><br>Maui Planning Director</td>
      <td>CHRIS HART, Maui Planning Director</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>364765</td>
      <td>HANNIBAL TAVARES (R)<br><br>Maui Mayor</td>
      <td>HANNIBAL TAVARES (R) MAUI MAYOR</td>
      <td>0.290323</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>417150</td>
      <td>CHRIS HART<br><br>Maui Planning Director</td>
      <td>CHRIS HART, Maui Planning Director</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>452019</td>
      <td>COLIN CAMERON<br><br>President<br><br>Maui Land and Pineapple Co.</td>
      <td>COLIN CAMERON President Maui Land and Pineapple Co.</td>
      <td>0.078431</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>554521</td>
      <td>ARNOLD MORGADO, JR. (D)<br><br>Chair, Honolulu City Council</td>
      <td>ARNOLD MORGADO, JR. (D) Chair, Honolulu City Council</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>878879</td>
      <td>ARNOLD MORGADO, JR. (D)<br><br>Chair, Honolulu City Council</td>
      <td>ARNOLD MORGADO, JR. (D) Chair, Honolulu City Council</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1050517</td>
      <td>JOANNE KAPOLOLA<br><br>Welfare Recipient</td>
      <td>JOANNE KAPOLOA WELFARE RECIPIENT</td>
      <td>0.531250</td>
      <td>0.093750</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1150250</td>
      <td>MARALYN KURSHALS<br><br>Human Rights Advocate</td>
      <td>MARALYN KURSHALS Human Rights Advocate</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-72p5hz3b (17 rows)</td>
      <td>1183383</td>
      <td>WINONA RUBIN<br><br>State Human Services Director</td>
      <td>Winona Rubin, State Human Services Director</td>
      <td>0.255814</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmc5 (3 rows)</td>
      <td>96763</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmc5 (3 rows)</td>
      <td>350017</td>
      <td>Jim Wright<br><br>CEO, Century 21, All Islands</td>
      <td>JIM WRIGHT, CEO, CENTURY 21, ALL ISLANDS</td>
      <td>0.575000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>145879</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM Hawaii Edition</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>242009</td>
      <td>JEREMY HARRIS<br><br>Honolulu Managing Director</td>
      <td>JEREMY HARRIS HONOLULU MANAGING DIRECTOR</td>
      <td>0.575000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>255255</td>
      <td>Rep. PAUL OSHIRO (D)<br><br>Transportation Comm. Chair</td>
      <td>Rep. Paul Oshiro (D) Transportation Comm. Chair</td>
      <td>0.212766</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>310143</td>
      <td>JEREMY HARRIS<br><br>Honolulu Managing Director</td>
      <td>JEREMY HARRIS Honolulu Managing Director</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>349516</td>
      <td>DAVID KAHANU (D)<br><br>Honolulu City<br><br>Council Member</td>
      <td>DAVID KAHANU (D) Honolulu City Council Member</td>
      <td>0.088889</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>393260</td>
      <td>DAVID KAHANU (D)<br><br>Honolulu City<br><br>Council Member</td>
      <td>DAVID KAHANU (D) Honolulu City Council Member</td>
      <td>0.088889</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>407274</td>
      <td>Rep. PAUL OSHIRO (D)<br><br>Transportation Comm. Chair</td>
      <td>Rep. PAUL OSHIRO (D) Transportation Comm. Chair</td>
      <td>0.042553</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>441642</td>
      <td>Sen. MARY-JANE McMURDO<br><br>(D) Waikiki-Moiliili</td>
      <td>Sen. MARY-JANE McMURDO (D) WAIKIKI-MOILII</td>
      <td>0.365854</td>
      <td>0.097561</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>454888</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>608642</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, HONOLULU ADVERTISER</td>
      <td>0.545455</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>650517</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA HONOLULU STAR-BULLETIN</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>696263</td>
      <td>BARBARA MARSHALL<br><br>TV-2 News</td>
      <td>Barbara Marshall, TV-2 News</td>
      <td>0.555556</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>730397</td>
      <td>GERALD KATO<br><br>KGMB News</td>
      <td>Gerald Kato, KGMB News</td>
      <td>0.454545</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>811278</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>Richard Borreca, Honolulu Star-Bulletin</td>
      <td>0.358974</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>838505</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, HONOLULU ADVERTISER</td>
      <td>0.545455</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>1168001</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, HONOLULU ADVERTISER</td>
      <td>0.545455</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-73pvmmnz (22 rows)</td>
      <td>1254254</td>
      <td>GERALD KATO<br><br>KGMB News</td>
      <td>Gerald Kato, KGMB News</td>
      <td>0.454545</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>100400</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>281515</td>
      <td>Peter Schall<br><br>Senior Vice President<br><br>Hilton Hotels Corp.</td>
      <td>Peter Schall, Senior Vice President, Hilton Hotels Corp.</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-74cnpd4t (4 rows)</td>
      <td>565632</td>
      <td>Karen Tiller<br><br>Executive Director<br><br>Hawaii Opera Theatre</td>
      <td>Karen Tiller, Executive Director, Hawaii Opera Theatre</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>154755</td>
      <td>RICHARD KELLEY<br><br>Outrigger Hotels</td>
      <td>RICHARD KELLEY OUTRIGGER HOTELS</td>
      <td>0.483871</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>167401</td>
      <td>DUDLEY PRATT<br><br>Hawaiian Electric Industries</td>
      <td>DUDLEY PRATT, HAWAIIAN ELECTRIC INDUSTRIES</td>
      <td>0.595238</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>205772</td>
      <td>JOSEPH MAGALDI<br><br>Honolulu Deputy<br><br>Transportation Director</td>
      <td>JOSEPH MAGALDI Honolulu Deputy Transportation Director</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>217518</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council<br><br>Transportation Chairman</td>
      <td>GARY GILL (D) Honolulu City Council Transportation Chairman</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>257758</td>
      <td>CLIFF SLATER<br><br>Committee on<br><br>Sensible Transit (C.O.S.T.)</td>
      <td>CLIFF SLATER Committee on Sensible Transit (C.O.S.T.)</td>
      <td>0.075472</td>
      <td>0.075472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>297531</td>
      <td>AMAR SAPPAL<br><br>Honolulu Rapid Transit <br><br>Administrator</td>
      <td>AMAR SAPPAL, HONOLULU RAPID TRANSIT ADMINISTRATOR</td>
      <td>0.673469</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>305772</td>
      <td>JOSEPH MAGALDI<br><br>Honolulu Deputy<br><br>Transportation Director</td>
      <td>Joseph Magaldi, Honolulu Deputy Transportation Director</td>
      <td>0.272727</td>
      <td>0.072727</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>322256</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council<br><br>Transportation Chairman</td>
      <td>GARY GILL (D) Honolulu City Council Transportation Chairman</td>
      <td>0.067797</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>351151</td>
      <td>CLIFF SLATER<br><br>Committee on<br><br>Sensible Transit (C.O.S.T.)</td>
      <td>CLIFF SLATER Committee on Sensible Transit (G.O.S.T.)</td>
      <td>0.094340</td>
      <td>0.094340</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>457391</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>JEREMY HARRIS Managing Director City & County of Honolulu</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>486386</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA STATE TRANSPORTATION DIRECTOR</td>
      <td>0.666667</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>581014</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>Jeremy Harris, Managing Director, City & County of Honolulu</td>
      <td>0.237288</td>
      <td>0.067797</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>636136</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA STATE TRANSPORTATION DIRECTOR</td>
      <td>0.666667</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>773907</td>
      <td>JEREMY HARRIS<br><br>Managing Director<br><br>City & County of Honolulu</td>
      <td>JEREMY HARRIS Managing Director City & County of Honolulu</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>805405</td>
      <td>ED HIRATA<br><br>State Transportation Director</td>
      <td>ED HIRATA STATE TRANSPORTATION DIRECTOR</td>
      <td>0.666667</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1112779</td>
      <td>MAJ. JAMES FEMIA<br><br>Honolulu Police Department</td>
      <td>MAJ. JAMES FEMIA HONOLULU POLICE DEPARTMENT</td>
      <td>0.534884</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1131131</td>
      <td>MYLES SHINSATO<br><br>Hunting Supplies of Hawaii</td>
      <td>Myles Shinato, Hunting Supplies of Hawaii</td>
      <td>0.317073</td>
      <td>0.073171</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-752fr61c (29 rows)</td>
      <td>1304404</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>Richard Borreca, Honolulu Star-Bulletin</td>
      <td>0.358974</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-75r7szj2 (2 rows)</td>
      <td>556390</td>
      <td>Lisa Gibson<br><br>President<br><br>Hawaii Life Sciences Council</td>
      <td>Lisa Gibson, President, Hawaii Life Sciences Council</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>284017</td>
      <td>John Cummings<br><br>Oahu Civil Defense</td>
      <td>John Cummings, Oahu Civil Defense</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>307407</td>
      <td>Courtney Brown<br><br>Government Efficiency Teams</td>
      <td>Courtney Brown, Government Efficiency Teams</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>966633</td>
      <td>Barry Weinman<br><br>Benefactor</td>
      <td>Barry Weinman, Benefactor</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>1000767</td>
      <td>Virginia Weinman<br><br>Benefactor</td>
      <td>VIRGINIA WEINMAN BENEFACTOR</td>
      <td>0.888889</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-7634tvj6 (6 rows)</td>
      <td>1028128</td>
      <td>Joshua Hvidding<br><br>Student</td>
      <td>Joshua Hvidding, Student</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>220254</td>
      <td>Bill Tobin<br><br>Tiki's Grill & Bar</td>
      <td>Bill Tobin, Tiki's Grill & Bar</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>650150</td>
      <td>Susan Todani<br><br>Director of Investments<br><br>Kamehameha Schools</td>
      <td>Susan Todani, Director of Investments, Kamehameha Schools</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>728028</td>
      <td>Rosalind Schurgin<br><br>Executive Vice President<br><br>Festival Companies</td>
      <td>Rosalind Schurgin, Executive Vice President, Festival Companies</td>
      <td>0.063492</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-76rxwn5t (4 rows)</td>
      <td>831131</td>
      <td>Scott Williams<br><br>General Manager<br><br>Lex Brodie's</td>
      <td>Scott Williams, General Manager, Lex Brodie's</td>
      <td>0.088889</td>
      <td>0.088889</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>203770</td>
      <td>HOALIKU DRAKE<br><br>Dept. of Hawaiian Homelands<br><br>Director</td>
      <td>HOALIKU DRAKE, Dept. of Hawaiian Homelands Director</td>
      <td>0.078431</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>217885</td>
      <td>NORMA WONG<br><br>Governor's Administrative<br><br>Assistant</td>
      <td>NORMA WONG Governor's Administrative Assistant</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>229396</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>238772</td>
      <td>NORMA WONG<br><br>Governor's Administrative<br><br>Assistant</td>
      <td>NORMA WONG, GOVERNOR'S ADMINISTRATIVE ASSISTANT</td>
      <td>0.702128</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>281782</td>
      <td>HOALIKU DRAKE<br><br>Dept. of Hawaiian Homelands<br><br>Director</td>
      <td>HOALIKU DRAKE, Dept. of Hawaiian Homelands Director</td>
      <td>0.078431</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>306773</td>
      <td>BILLIE BEAMER<br><br>Former Dept. of Hawaiian <br><br>Homelands Director</td>
      <td>Billie Beamer, Former Dept. of Hawaiian Homelands Director</td>
      <td>0.241379</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>369002</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI TRASK Governor, Ka Lahui</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>417751</td>
      <td>FRENCHY DeSOTO<br><br>Trustee<br><br>Office of Hawaiian Affairs</td>
      <td>FRENCHY, DeSOTO, Trustee, Office of Hawaiian Affairs</td>
      <td>0.096154</td>
      <td>0.096154</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>454888</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI TRASK Governor, Ka Lahui</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>533901</td>
      <td>FRENCHY DeSOTO<br><br>Trustee<br><br>Office of Hawaiian Affairs</td>
      <td>FRENCHY DeSOTO Trustee Office of Hawaiian Affairs</td>
      <td>0.081633</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>612145</td>
      <td>MILILANI TRASK<br><br>Governor, Ka Lahui</td>
      <td>MILILANI TRASK Governor, Ka Lahui</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>826760</td>
      <td>EARL ARRUDA<br><br>President<br><br>Hawaii State Teachers Assn.</td>
      <td>EARL ARRUDA President Hawaii State Teachers Assn.</td>
      <td>0.081633</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>881882</td>
      <td>CHARLES TOGUCHI<br><br>Superintendent of Schools</td>
      <td>CHARLES TOGUCHI Superintendent of Schools</td>
      <td>0.048780</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>950250</td>
      <td>DEBBI BOLTZ<br><br>Castle High Teacher</td>
      <td>Debbie Boltz, Castle High Teacher</td>
      <td>0.333333</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>967267</td>
      <td>JOHN DOLLY<br><br>Dean, UH College of Education</td>
      <td>John Dolly, Dean, UH College of Education</td>
      <td>0.219512</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1053253</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary <br><br>Committee Chair</td>
      <td>SEN. RON MENOR (D) Senate Judiciary Committee Chair</td>
      <td>0.078431</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1090657</td>
      <td>SEN. RICK REED (R)<br><br>Senate Minority Floor Leader</td>
      <td>SEN. RICK REED (R) SENATE MINORITY FLOOR LEADER</td>
      <td>0.489362</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1116149</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R) SENATE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1132132</td>
      <td>REP. WHITNEY ANDERSON (R)<br><br>Maunawili-Enchanted Lake</td>
      <td>REP. WHITNEY ANDERSON (R) MAUNAWILI-ENCHANTED LAKES</td>
      <td>0.431373</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-773txjbk (33 rows)</td>
      <td>1196129</td>
      <td>JOHN RADCLIFFE<br><br>Good Neighbors-Good Planning</td>
      <td>JOHN RADCLIFFE Good Neighbors-Good Planning</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-77fqzf2c (14 rows)</td>
      <td>578278</td>
      <td>NORMAN MIZUGUCHI (D)<br><br>Senate President</td>
      <td>Norman Mizuguchi (D) Senate President</td>
      <td>0.405405</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-77fqzf2c (14 rows)</td>
      <td>619653</td>
      <td>CATHY FOY</td>
      <td>A woman wearing a red off-the-shoulder top and a necklace with a large white pendant is speaking into a microphone. The text "CATHY FOY" is displayed at the bottom of the image.</td>
      <td>0.949153</td>
      <td>0.949153</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>99132</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>632633</td>
      <td>Rick Page<br><br>Director<br><br>Eastern Region of the Military Defense Commissary System</td>
      <td>Rick Page, Director, Eastern Region of the Military Defense Commissary System</td>
      <td>0.051948</td>
      <td>0.051948</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16nb (3 rows)</td>
      <td>1300400</td>
      <td>Don Robbs<br><br>Easter Seals Hawaii</td>
      <td>Don Robbs, Easter Seals Hawaii</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16p2 (2 rows)</td>
      <td>236136</td>
      <td>Mike Ruley<br><br>CEO<br><br>Hawaiian Telcom</td>
      <td>MIKE RULEY, CEO, HAWAIIAN TEL.COM</td>
      <td>0.727273</td>
      <td>0.151515</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-784j16p2 (2 rows)</td>
      <td>887020</td>
      <td>Michael Kliks<br><br>Beekeeper</td>
      <td>Michael Kliks, beekeeper.</td>
      <td>0.160000</td>
      <td>0.120000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79h44s0t (6 rows)</td>
      <td>648015</td>
      <td>Joshua Beil<br><br>President & CEO, Skywave Broadband<br><br>www.skywavebroadband.net</td>
      <td>Joshua Beil, President & CEO, Skywave Broadband, www.skywavebroadband.net</td>
      <td>0.054795</td>
      <td>0.054795</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79v15nz0 (5 rows)</td>
      <td>424157</td>
      <td>JAMES WAKATSUKI<br><br>SPEAKER OF THE HOUSE</td>
      <td>JAMES WAKATSUKI SPEAKER OF HOUSE</td>
      <td>0.187500</td>
      <td>0.187500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-79v15nz0 (5 rows)</td>
      <td>930764</td>
      <td>JAMES WAKATSUKI<br><br>SPEAKER OF THE HOUSE</td>
      <td>JAMES WAKATSUKI SPEAKER OF HOUSE</td>
      <td>0.187500</td>
      <td>0.187500</td>
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
      <td>Patsy T. Mink</td>
      <td>0.538462</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>387154</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>WILLIAM K. "BILLY" KUAIWA</td>
      <td>0.080000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>451518</td>
      <td>JOHN WAIHEE</td>
      <td>JOHN WAIIHEE</td>
      <td>0.083333</td>
      <td>0.083333</td>
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
      <td>Patsy T. Mink</td>
      <td>0.538462</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-805x6k1p (35 rows)</td>
      <td>782282</td>
      <td>WILLIAM K.<br><br>"BILLY" KUAIWA</td>
      <td>WILLIAM K. "BILLY" KUAIWA</td>
      <td>0.080000</td>
      <td>0.080000</td>
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
      <td>JOHN WAIIHEE</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>254388</td>
      <td>Clint Arnoldus<br><br>PRESIDENT & CEO<br><br>CENTRAL PACIFIC BANK</td>
      <td>Clint Arnoldus, President & CEO, Central Pacific Bank</td>
      <td>0.509434</td>
      <td>0.075472</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>811144</td>
      <td>Michael Drace<br><br>YOUNG LAUNDRY & DRYCLEANING</td>
      <td>Michael Drace, Young Laundry & Drycleaning</td>
      <td>0.523810</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-81jhb4c4 (3 rows)</td>
      <td>1150250</td>
      <td>Andres Delfs<br><br>PRINCIPAL CONDUCTOR<br><br>HONOLULU SYMPHONY</td>
      <td>ANDRES DELFS PRINCIPAL CONDUCTOR HONOLULU SYMPHONY</td>
      <td>0.260000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>281782</td>
      <td>Glenn Hong<br><br>CEO<br><br>Young Brothers</td>
      <td>GLENN HONG, CEO, YOUNG BROTHERS</td>
      <td>0.709677</td>
      <td>0.129032</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>558258</td>
      <td>Neil Anthony Sims<br><br>President<br><br>Kona Blue</td>
      <td>Neil Anthony Sims, President, Kona Blue</td>
      <td>0.102564</td>
      <td>0.102564</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83kwhghq (4 rows)</td>
      <td>852252</td>
      <td>Chris Scanlan<br><br>Investor<br><br>Trinity Restaurant Partners</td>
      <td>CHRIS SCANLAN, INVESTOR, TRINITY RESTAURANT PARTNERS</td>
      <td>0.826923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>255255</td>
      <td>Debbie Goodwin<br><br>Keck Observatory</td>
      <td>Debbie Goodwin, Keck Observatory</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>499032</td>
      <td>Peter Shaindlin<br><br>Halekulani Corporation</td>
      <td>PETER SHAINDLIN HALEKULANI CORPORATION</td>
      <td>0.868421</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>768001</td>
      <td>Mike Wright<br><br>A&B Properties</td>
      <td>Mike Wright, A&B Properties</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjc9z (4 rows)</td>
      <td>1030397</td>
      <td>Dustin Shindo<br><br>CEO<br><br>Hoku Scientific</td>
      <td>Dustin Shindo, CEO, Hoku Scientific</td>
      <td>0.114286</td>
      <td>0.114286</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjcgk (13 rows)</td>
      <td>892259</td>
      <td>Reverend Chris Eng<br><br>United Church of Christ</td>
      <td>Reverend Chris Eng, United Church of Christ</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-83xsjcgk (13 rows)</td>
      <td>982015</td>
      <td>Reverend Chris Eng<br><br>United Church of Christ</td>
      <td>Reverend Chris Eng, United Church of Christ</td>
      <td>0.046512</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>242643</td>
      <td>FRED HOLSCHUH (D)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>FRED HOLSCHUH (D) MAYORAL CANDIDATE COUNTY OF HAWAII</td>
      <td>0.576923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>360394</td>
      <td>KEIKO BONK (G)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>KEIKO BONK (G) Mayoral Candidate County of Hawaii</td>
      <td>0.081633</td>
      <td>0.081633</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk819 (18 rows)</td>
      <td>562029</td>
      <td>HARRY KIM (R)<br><br>Mayoral Candidate<br><br>County of Hawaii</td>
      <td>HARRY KIM (R) MAYORAL CANDIDATE COUNTY OF HAWAII</td>
      <td>0.625000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk821 (4 rows)</td>
      <td>96396</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-848pk821 (4 rows)</td>
      <td>619386</td>
      <td>Jenny Strand<br><br>Visitor</td>
      <td>JENNY STRAND VISITOR</td>
      <td>0.850000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-84zgn1v5 (3 rows)</td>
      <td>582149</td>
      <td>Greg O'Donnell<br><br>CEO<br><br>Damien School</td>
      <td>Greg O'Donnell, CEO, Damien School</td>
      <td>0.117647</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-84zgn1v5 (3 rows)</td>
      <td>966266</td>
      <td>Marsha Bemko<br><br>Producer<br><br>Antiques Road Show</td>
      <td>Marsha Bemko, Producer, Antiques Road Show</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-86b2rm9c (4 rows)</td>
      <td>247881</td>
      <td>Nate Smith<br><br>CEO<br><br>Oceanic Cablevision</td>
      <td>Nate Smith, CEO, Oceanic Cablevision</td>
      <td>0.111111</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-86b2rm9c (4 rows)</td>
      <td>616149</td>
      <td>Mark Hudson<br><br>USDA Honolulu</td>
      <td>MARK HUDSON USDA HONOLULU</td>
      <td>0.680000</td>
      <td>0.080000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>437638</td>
      <td>WARREN PRICE<br><br>Attorney General</td>
      <td>WARREN PRICE Attorney General</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>559626</td>
      <td>DANTE CARPENTER<br><br>Hawaii County Mayor</td>
      <td>DANTE CARPENTER HAWAII COUNTY MAYOR</td>
      <td>0.457143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>576777</td>
      <td>HANNIBAL TAVARES<br><br>Maui County Mayor</td>
      <td>HANNIBAL TAVARES MAUI COUNTY MAYOR</td>
      <td>0.411765</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-881jx2zw (6 rows)</td>
      <td>1171905</td>
      <td>REP. ROLAND KOTANI (D)</td>
      <td>REPR. ROLAND KOTANI (D)</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfxzgp (2 rows)</td>
      <td>331031</td>
      <td>Paul Brewbaker<br><br>Chief Economist<br><br>Bank of Hawaii</td>
      <td>Paul Brewbaker, Chief Economist, Bank of Hawaii</td>
      <td>0.085106</td>
      <td>0.085106</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>92125</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>152019</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>Governor John Waihee speaking at a podium.</td>
      <td>0.880952</td>
      <td>0.523810</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>181515</td>
      <td>SEN. RICHARD WONG (D)<br><br>Senate President</td>
      <td>SEN. RICHARD WONG (D) SENATE PRESIDENT</td>
      <td>0.394737</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>204638</td>
      <td>REP. DANIEL KIHANO (D)<br><br>House Speaker</td>
      <td>REP. DANIEL KIHANO (D) HOUSE SPEAKER</td>
      <td>0.333333</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>235636</td>
      <td>SEN. MARY GEORGE (R)<br><br>Senate Minority Leader</td>
      <td>SEN. MARY GEORGE (R) SENATE MINORITY LEADER</td>
      <td>0.441860</td>
      <td>0.046512</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>302903</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>GOVERNOR JOHN WAHEE</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>375375</td>
      <td>REP. ROMY CACHOLA (D)<br><br>Chair, House Committee on<br><br>Tourism</td>
      <td>REPR. ROMY CAGHOLA (D) Chair, House Committee on Tourism</td>
      <td>0.107143</td>
      <td>0.107143</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>398131</td>
      <td>RAY MALLOY<br><br>Ala Moana/Kakaako<br><br>Neighborhood Board</td>
      <td>Ray Malloy, Ala Moana/Kakaako Neighborhood Board</td>
      <td>0.229167</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>435769</td>
      <td>ROGER ULVELING<br><br>Director, Dept. of Business &<br><br>Economic Development</td>
      <td>ROGER ULVELING Director, Dept. of Business & Economic Development</td>
      <td>0.061538</td>
      <td>0.061538</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>518385</td>
      <td>MARY SHIN<br><br>Merchants' Association</td>
      <td>MARY SHIN MERCHANTS' ASSOCIATION</td>
      <td>0.625000</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>558025</td>
      <td>SEN. MILTON HOLT (D)<br><br>Chair, Senate Tourism Committee</td>
      <td>SEN. MILTON HOLT (D) Chair, Senate Tourism Committee</td>
      <td>0.038462</td>
      <td>0.038462</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>572639</td>
      <td>REP. WHITNEY ANDERSON (R)</td>
      <td>A man in a suit and tie is standing at a podium in a courtroom, speaking into a microphone.</td>
      <td>0.967033</td>
      <td>0.846154</td>
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
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>757257</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>SEN. MAMORU YAMASAKI (D) Chair, Senate Ways and Means Committee</td>
      <td>0.079365</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>944144</td>
      <td>REP. HARVEY TAJIRI (D)</td>
      <td>REP. HARVEY TAJIRI (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1067901</td>
      <td>JOSEPH CONANT<br><br>Director, Housing Finance and<br><br>Development Corporation</td>
      <td>JOSEPH CONANT, Director, Housing Finance and Development Corporation</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1093126</td>
      <td>GOVERNOR JOHN WAIHEE</td>
      <td>GOVERNOR JOHN WAHEE</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-88cfz00w (37 rows)</td>
      <td>1189756</td>
      <td>REP. BRIAN TANIGUCHI (D)<br><br>Chairman - House Committee<br><br>on Higher Education</td>
      <td>Rep. Brian Taniguchi (D) Chairman - House Committee on Higher Education</td>
      <td>0.253521</td>
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
      <td>REP. JOSEPH SOUKI (D) House Finance Comm. Chair</td>
      <td>0.042553</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>341642</td>
      <td>SEN. LEHUA FERNANDES<br><br>SALLING (D)<br><br>Senate Transportation<br><br>Committee Chair</td>
      <td>SEN. LEHUA FERNANDEZ SALLING (D) SENATE TRANSPORTATION COMMITTEE CHAIR</td>
      <td>0.528571</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>396029</td>
      <td>REP. ED BYBEE (D)<br><br>Mokapu-Kailua</td>
      <td>REP. ED BYBEE (D) MOKAPU-KAILUA</td>
      <td>0.387097</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>406640</td>
      <td>SEN. RUSSELL BLAIR (D)<br><br>Makiki-Ala Moana</td>
      <td>SEN. RUSSELL BLAIR (D) MAKIKI - ALA MONA</td>
      <td>0.375000</td>
      <td>0.125000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>425626</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>451251</td>
      <td>SEN. MIKE COZIER (D)<br><br>Senate Housing<br><br>Committee Chair</td>
      <td>SEN. MIKE COZIER (D) SENATE HOUSING COMMITTEE CHAIR</td>
      <td>0.529412</td>
      <td>0.078431</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>472139</td>
      <td>SEN. STEVE COBB (D)<br><br>Waialae-Palolo</td>
      <td>SEN. STEVE COBB (D) WAIALAE-PALOLO</td>
      <td>0.382353</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>557257</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, HONOLULU ADVERTISER</td>
      <td>0.545455</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>607007</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA HONOLULU STAR BULLETIN</td>
      <td>0.526316</td>
      <td>0.078947</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>692759</td>
      <td>DAN BOYLAN<br><br>Honolulu Magazine</td>
      <td>Dan Boylan, Honolulu Magazine</td>
      <td>0.310345</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>772773</td>
      <td>BARBARA MARSHALL<br><br>KHON TV-2</td>
      <td>Barbara Marshall Khon TV-2</td>
      <td>0.692308</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>933400</td>
      <td>BARBARA MARSHALL<br><br>KHON TV-2</td>
      <td>Barbara Marshall, Khon TV-2</td>
      <td>0.666667</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>1002002</td>
      <td>RICHARD BORRECA<br><br>Honolulu Star-Bulletin</td>
      <td>RICHARD BORRECA HONOLULU STAR-BULLETIN</td>
      <td>0.500000</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89280rcv (19 rows)</td>
      <td>1413146</td>
      <td>JERRY BURRIS<br><br>Honolulu Advertiser</td>
      <td>JERRY BURRIS, HONOLULU ADVERTISER</td>
      <td>0.545455</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89r22hxx (3 rows)</td>
      <td>243877</td>
      <td>Rex Johnson<br><br>CEO<br><br>Hawaii Tourism Authority</td>
      <td>Rex Johnson, CEO, Hawaii Tourism Authority</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-89r22hxx (3 rows)</td>
      <td>645512</td>
      <td>Jim Ueno<br><br>Aloha Street</td>
      <td>JIM UENO ALOHA STREET</td>
      <td>0.761905</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3dxg (6 rows)</td>
      <td>759760</td>
      <td>AL HARRINGTON</td>
      <td>AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON AL HARRINGTON</td>
      <td>0.976744</td>
      <td>0.976744</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3dxg (6 rows)</td>
      <td>1156890</td>
      <td>DANIEL KIHANO<br><br>Speaker of the House</td>
      <td>DANIEL KIHANO Speaker of the House</td>
      <td>0.058824</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3f8d (2 rows)</td>
      <td>506773</td>
      <td>REP. ANDREW LEVIN (D)<br><br>Chair, Water, Land Use<br><br>Dev., & Hawaiian Affairs Com.</td>
      <td>ANDREW LEVIN (D) Chair, Water, Land Use Dev., & Hawaiian Affairs Com.</td>
      <td>0.130435</td>
      <td>0.130435</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-902z3f8d (2 rows)</td>
      <td>628629</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>SEN. MALAMA SOLOMON (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-90dv49tw (1 rows)</td>
      <td>268268</td>
      <td>JOHN WAIHEE<br><br>Governor</td>
      <td>John Waihee is the Governor of Hawaii.</td>
      <td>0.710526</td>
      <td>0.500000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63bg (2 rows)</td>
      <td>281281</td>
      <td>Sam Shomaker<br><br>Interim Dean<br><br>John A. Burns School of Medicine</td>
      <td>Sam Shomaker, Interim Dean, John A. Burns School of Medicine</td>
      <td>0.066667</td>
      <td>0.066667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63bg (2 rows)</td>
      <td>559126</td>
      <td>Steve Little<br><br>Director<br><br>Honolulu Academy of Arts</td>
      <td>Steve Little, Director, Honolulu Academy of Arts</td>
      <td>0.083333</td>
      <td>0.083333</td>
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
      <td>keith kaneshiro</td>
      <td>0.933333</td>
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
      <td>RICHARD BORRECA</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>BART FREDO</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>CHARLES MARSLAND</td>
      <td>0.000000</td>
      <td>0.000000</td>
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
      <td>BART FREDO</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>998031</td>
      <td>CHARLES MARSLAND</td>
      <td>CHARLES MARSLAND</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-913n63kj (32 rows)</td>
      <td>1291391</td>
      <td>RICHARD BORRECA</td>
      <td>RICHARD BORRECA</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-91sf7w98 (2 rows)</td>
      <td>648515</td>
      <td>RICHARD WONG<br><br>SENATE PRESIDENT</td>
      <td>RICHARD WONG SENATE PRESIDENT</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>98632</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN Newsmakers</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>177644</td>
      <td>RANDALL KUSAKA (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>RANDALL KUSAKA (D) State Rep. Dist. 33 Candidate Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.043956</td>
      <td>0.043956</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>196129</td>
      <td>BLAKE OSHIRO (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>Blake Oshiro (D) State Rep. Dist. 33 Candidate Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.146067</td>
      <td>0.044944</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>452886</td>
      <td>RANDALL KUSAKA (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>RANDALL KUSAKA (D) State Rep. Dist. 33 Candidate Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.043956</td>
      <td>0.043956</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjr9 (11 rows)</td>
      <td>509510</td>
      <td>BLAKE OSHIRO (D)<br><br>State Rep. Dist. 33 Candidate<br><br>Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>Blake Oshiro (D) State Rep. Dist. 33 Candidate Red Hill, Halawa Heights, Pearlridge, Aiea</td>
      <td>0.146067</td>
      <td>0.044944</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>206640</td>
      <td>Glenn Hong<br><br>President<br><br>Young Brothers</td>
      <td>GLENN HONG, PRESIDENT, YOUNG BROTHERS</td>
      <td>0.810811</td>
      <td>0.108108</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>476643</td>
      <td>Russell Kokubun<br><br>State Senator</td>
      <td>RUSSELL KOKUBUN STATE SENATOR</td>
      <td>0.827586</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>851151</td>
      <td>Mark Schiebe<br><br>Parson Brinkerhoff</td>
      <td>MARK SCHIEBE Parson Brinkerhoff</td>
      <td>0.354839</td>
      <td>0.064516</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-92t4bjs1 (5 rows)</td>
      <td>1204404</td>
      <td>Maile Meyer<br><br>Entrepreneur</td>
      <td>MAILE MEYER ENTREPRENEUR</td>
      <td>0.875000</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>99132</td>
      <td>LYNETTE LO TOM<br><br>Capitol Spotlight</td>
      <td>LYNETTE LO TOM, CAPITOL SPOTLIGHT</td>
      <td>0.484848</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>142776</td>
      <td>JOHN WAIHEE<br><br>Governor</td>
      <td>John Waihee, Governor</td>
      <td>0.476190</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>339406</td>
      <td>JOHN LEWIN<br><br>Dir., Dept. of Health</td>
      <td>John Lewin, Director, Department of Health</td>
      <td>0.476190</td>
      <td>0.309524</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>476777</td>
      <td>ILIMA PIIANAIA<br><br>Chair<br><br>Hawaiian Homes Commission</td>
      <td>ILIMA PIIANAIA Chair Hawaiian Homes Commission</td>
      <td>0.086957</td>
      <td>0.086957</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbd6 (9 rows)</td>
      <td>618385</td>
      <td>CHARLES TOGUCHI<br><br>Supt., Dept. of Education</td>
      <td>CHARLES TOGUCHI Supt., Dept. of Education</td>
      <td>0.048780</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>106907</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM Hawaii Edition</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>150751</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>155522</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council Member</td>
      <td>GARY GILL (D) Honolulu City Council Member</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>175509</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>LT. GOV. BEN CAYETANO (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>199399</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Republican Candidate<br><br>for Governor</td>
      <td>Rep. Fred Hemmings (R) Republican Candidate for Governor</td>
      <td>0.285714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>228896</td>
      <td>GARY GILL (D)<br><br>Honolulu City Council Member</td>
      <td>GARY GILL (D) Honolulu City Council Member</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>251652</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>265265</td>
      <td>D. G. "ANDY" ANDERSON<br><br>Republican Party Chairman</td>
      <td>D.G. "ANDY" ANDERSON Republican Party Chairman</td>
      <td>0.065217</td>
      <td>0.065217</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>304771</td>
      <td>JOHN HENRY FELIX (R)<br><br>Honolulu City Council Member</td>
      <td>JOHN HENRY FELIX (R) Honolulu City Council Member</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>315382</td>
      <td>REP. FRED HEMMINGS (R)<br><br>Republican Candidate<br><br>for Governor</td>
      <td>REP. FRED HEMMINGS (R) Republican Candidate for Governor</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>361528</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>Gov. John Waihee (D)</td>
      <td>0.500000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>401268</td>
      <td>ARNOLD MORGADO (D)<br><br>Honolulu City Council Chair</td>
      <td>ARNOLD MORGADO (D) Honolulu City Council Chair</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>429630</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>447014</td>
      <td>JOHN HENRY FELIX (R)<br><br>Honolulu City Council Member</td>
      <td>JOHN HENRY FELIX (R) Honolulu City Council Member</td>
      <td>0.040816</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>453387</td>
      <td>ARNOLD MORGADO (D)<br><br>Honolulu City Council Chair</td>
      <td>ARNOLD MORGADO (D) Honolulu City Council Chair</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-93gxdbgn (22 rows)</td>
      <td>501134</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>GOV. JOHN WAHEE (D)</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg46k (3 rows)</td>
      <td>275642</td>
      <td>Thom Nulty<br><br>Aloha Airlines</td>
      <td>Thom Nulty, Aloha Airlines</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg46k (3 rows)</td>
      <td>570137</td>
      <td>Emy Yamauchi-Wong<br><br>Altres Staffing</td>
      <td>EMY YAMAUCHI-WONG ALTRES STAFFING</td>
      <td>0.787879</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg479 (2 rows)</td>
      <td>861628</td>
      <td>Peter Vincent<br><br>President<br><br>AIA Hawaii</td>
      <td>PETER VINCENT, PRESIDENT, AIA HAWAII</td>
      <td>0.750000</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>242509</td>
      <td>Bill Boyer<br><br>CEO, Mokulele Air</td>
      <td>Bill Boyer, CEO, Mokulele Air</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>689156</td>
      <td>Robin Puanani Danner<br><br>Native Hawaiian Economic Alliance</td>
      <td>Robin Puananani Danner, Native Hawaiian Economic Alliance</td>
      <td>0.070175</td>
      <td>0.070175</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-945qg481 (4 rows)</td>
      <td>995128</td>
      <td>Chuck Steilen<br><br>Dean of the College of Business Administration<br><br>Hawaiian Pacific University</td>
      <td>Chuck Steilen, Dean of the College of Business Administration, Hawaii Pacific University</td>
      <td>0.068182</td>
      <td>0.068182</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-94vhhwww (3 rows)</td>
      <td>279780</td>
      <td>Chad Jensen<br><br>ARDA Hawaii</td>
      <td>Chad Jensen, Arda Hawaii</td>
      <td>0.208333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-94vhhwww (3 rows)</td>
      <td>1313780</td>
      <td>Barbara Campbell<br><br>VP<br><br>Outrigger</td>
      <td>Barbara Campbell, VP Outrigger</td>
      <td>0.133333</td>
      <td>0.133333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>148148</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Edition</td>
      <td>LYNETTE LO TOM Hawaii Edition</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>195262</td>
      <td>HENRY FOLEY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>HENRY FOLEY, Ph.D. STATE DEPUTY HEALTH DIRECTOR</td>
      <td>0.489362</td>
      <td>0.042553</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>255756</td>
      <td>MARK DILLEN STITHAM, M.D.<br><br>President, Hawaii<br><br>Psychiatric Society</td>
      <td>MARK DILLEN STITHAM, M.D. President, Hawaii Psychiatric Society</td>
      <td>0.063492</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>288889</td>
      <td>HENRY FOLEY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>HENRY FOLEY, Ph.D., State Deputy Health Director</td>
      <td>0.041667</td>
      <td>0.041667</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>318385</td>
      <td>MARK DILLEN STITHAM, M.D.<br><br>President, Hawaii<br><br>Psychiatric Society</td>
      <td>MARK DILLEN STITHAM, M.D. President, Hawaii Psychiatric Society</td>
      <td>0.063492</td>
      <td>0.063492</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>350017</td>
      <td>KELLY DEAN<br><br>Hawaii Public Television</td>
      <td>Kelly Dean, Hawaii Public Television</td>
      <td>0.250000</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>362629</td>
      <td>PETER SYBINSKY, Ph.D.<br><br>State Deputy Health Director</td>
      <td>PETER SYBINSKY, Ph.D. State Deputy Health Director</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>388255</td>
      <td>REP. MICHAEL LIU (R)<br><br>House Minority Leader</td>
      <td>Rep. Michael Liu (R) House Minority Leader</td>
      <td>0.285714</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>452386</td>
      <td>JOHN HENRY FELIX (R)<br><br>City Council Member</td>
      <td>John Henry Felix (R) City Council Member</td>
      <td>0.325000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>488655</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>JOHN LEWIN, MD, Director State Dept. of Health</td>
      <td>0.043478</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>531765</td>
      <td>AH QUON McELRATH<br><br>Welfare Advocate</td>
      <td>AH QUON McELRATH Welfare Advocate</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>559626</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>John Lewin, MD, Director State Dept. of Health</td>
      <td>0.195652</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>620654</td>
      <td>AH QUON McELRATH<br><br>Welfare Advocate</td>
      <td>AH QUON McELRATH Welfare Advocate</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>766767</td>
      <td>JOHN LEWIN, MD<br><br>Director State Dept. of Health</td>
      <td>John Lewin, MD, Director State Dept. of Health</td>
      <td>0.195652</td>
      <td>0.043478</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>985018</td>
      <td>CHRIS JONES<br><br>Aloha Greens Co-chairman</td>
      <td>CHRIS JONES Aloha Greens Co-chairman</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-956djsw1 (31 rows)</td>
      <td>1042876</td>
      <td>ALAN BURDICK<br><br>Attorney</td>
      <td>ALAN BURDICK Attorney</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95j9kphn (4 rows)</td>
      <td>246513</td>
      <td>Roger Kaiwi<br><br>Captain Cook Coffee Co.</td>
      <td>Roger Kaiwi, Captain Cook Coffee Co.</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95j9kphn (4 rows)</td>
      <td>348782</td>
      <td>Jim Wayman<br><br>Hawaii Coffee Co.</td>
      <td>Jim Wayman, Hawaii Coffee Co.</td>
      <td>0.068966</td>
      <td>0.068966</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>99266</td>
      <td>Howard Dicus<br><br>PBN Friday</td>
      <td>Howard Dicus, PBN Friday</td>
      <td>0.083333</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>245012</td>
      <td>Nick Buchanan<br><br>Waikiki Watermark</td>
      <td>Nick Buchanan, Waikiki Watermark</td>
      <td>0.062500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-95w6mkcb (4 rows)</td>
      <td>541775</td>
      <td>Pat Bustamente<br><br>CEO, Pacific LightNet</td>
      <td>PAT BUSTAMENTE, CEO, PACIFIC LIGHTNET</td>
      <td>0.675676</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>265399</td>
      <td>Joe Toy<br><br>CEO<br><br>HOSPITALITY ADVISORS</td>
      <td>Joe Toy, CEO, Hospitality Advisors</td>
      <td>0.617647</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>583650</td>
      <td>Bernard Ho<br><br>INTERIM CEO<br><br>DAMIEN SCHOOL</td>
      <td>Bernard Ho, Interim CEO, Damien School</td>
      <td>0.526316</td>
      <td>0.105263</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-9673nggn (4 rows)</td>
      <td>915015</td>
      <td>Kippen de Alba Chu<br><br>IOLANI PALACE</td>
      <td>KIPPEN DE ALBA CHU IOLANI PALACE</td>
      <td>0.437500</td>
      <td>0.062500</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>90390</td>
      <td>DAN BOYLAN<br><br>Newsmakers</td>
      <td>DAN BOYLAN Newsmakers</td>
      <td>0.095238</td>
      <td>0.095238</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>235002</td>
      <td>CHARLOTTE NEKOTA (D)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>A woman named Charlotte Nekota, who is a state representative from District 39 and a candidate for Wheeler-Millani.</td>
      <td>0.643478</td>
      <td>0.504348</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>319253</td>
      <td>GUY ONTAI (R)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>GUY ONTAI (R) State Rep. Dist. 39 Candidate Wheeler-Millani</td>
      <td>0.101695</td>
      <td>0.101695</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>501768</td>
      <td>CHARLOTTE NEKOTA (D)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>CHARLOTTE NEKOTA (D) State Rep. Dist. 39 Candidate Wheeler-Millani</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>637004</td>
      <td>GUY ONTAI (R)<br><br>State Rep. Dist. 39 Candidate<br><br>Wheeler-Mililiani</td>
      <td>GUY ONTAI (R) State Rep. Dist. 39 Candidate Wheeler-Millani</td>
      <td>0.101695</td>
      <td>0.101695</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>993393</td>
      <td>JOE GOMES (R)<br><br>State Rep. Dist. 51 Candidate<br><br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>Joe Gomes (R) State Rep. Dist. 51 Candidate Lanikai-Kolu Hills-Waimanalo</td>
      <td>0.152778</td>
      <td>0.069444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr4x3 (11 rows)</td>
      <td>1168635</td>
      <td>JOE GOMES (R)<br><br>State Rep. Dist. 51 Candidate<br><br>Lanikai-Keolu Hills-Waimanalo</td>
      <td>Joe Gomes (R) State Rep. Dist. 51 Candidate Lanikai-Kolu Hills-Waimanalo</td>
      <td>0.152778</td>
      <td>0.069444</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr507 (3 rows)</td>
      <td>278512</td>
      <td>Roger Kaiwi<br><br>Captain Cook Coffee Co.</td>
      <td>Roger Kaiwi, Captain Cook Coffee Co.</td>
      <td>0.055556</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr507 (3 rows)</td>
      <td>697631</td>
      <td>Cary Tagawa<br><br>Actor</td>
      <td>CARY TAGAWA ACTOR</td>
      <td>0.823529</td>
      <td>0.117647</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr51z (3 rows)</td>
      <td>262896</td>
      <td>Ron Baird<br><br>EXECUTIVE DIRECTOR<br><br>NELHA</td>
      <td>Ron Baird, Executive Director, Nelha</td>
      <td>0.638889</td>
      <td>0.111111</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-977sr51z (3 rows)</td>
      <td>578645</td>
      <td>Amy Hammond<br><br>MADE IN HAWAII FESTIVAL</td>
      <td>Amy Hammond, Made in Hawaii Festival</td>
      <td>0.527778</td>
      <td>0.055556</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttgb (10 rows)</td>
      <td>103136</td>
      <td>NORMAN MIZUGUCHI<br><br>Senate President</td>
      <td>Norman Mizuguchi, Senate President</td>
      <td>0.441176</td>
      <td>0.058824</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttgb (10 rows)</td>
      <td>559026</td>
      <td>NORMAN MIZUGUCHI<br><br>Senate President</td>
      <td>NORMAN MIZUGUCHI Senate President</td>
      <td>0.060606</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>81148</td>
      <td>LESLIE WILCOX<br><br>ELECTION LIVE</td>
      <td>Leslie Wilcox, Election Live</td>
      <td>0.785714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>169269</td>
      <td>PENNY NAKAMURA<br><br>ELECTION LIVE</td>
      <td>PENNY NAKAMURA ELECTION LIVE</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>189523</td>
      <td>JERRY ROTHSTEIN<br><br>Hapuna Beach Spokesman</td>
      <td>JERRY ROTHSTEIN, Hapuna Beach Spokesman</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>308375</td>
      <td>WILLIAM MIELCKE<br><br>Vice-President<br><br>Mauna Kea Properties</td>
      <td>William Mielcke, Vice President, Mauna Kea Properties</td>
      <td>0.320755</td>
      <td>0.094340</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>321655</td>
      <td>RUDY LEGASPI<br><br>Hawaii County Clerk</td>
      <td>Rudy Legaspi, Hawaii County Clerk</td>
      <td>0.333333</td>
      <td>0.060606</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>349650</td>
      <td>JERRY ROTHSTEIN<br><br>Hapuna Beach Spokesman</td>
      <td>JERRY ROTHSTEIN Hapuna Beach Spokesman</td>
      <td>0.052632</td>
      <td>0.052632</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>423156</td>
      <td>LYNETTE LO TOM<br><br>ELECTION LIVE</td>
      <td>LYNETTE LO TOM ELECTION LIVE</td>
      <td>0.071429</td>
      <td>0.071429</td>
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
      <td>JACKIE YOUNG Hawaii Women's Political Caucus</td>
      <td>0.090909</td>
      <td>0.090909</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1023156</td>
      <td>EILEEN ANDERSON (D)<br><br>Former Honolulu Mayor</td>
      <td>Eileen Anderson (D) Former Honolulu Mayor</td>
      <td>0.341463</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1064264</td>
      <td>SENA GATES (D)<br><br>Former City Council Candidate</td>
      <td>SENA GATES (D) Former City Council Candidate</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-988gttpp (22 rows)</td>
      <td>1186019</td>
      <td>JUDY SOBIN (D)<br><br>Former City Council Candidate</td>
      <td>Judy Sobin (D) Former City Council Candidate</td>
      <td>0.204545</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>199266</td>
      <td>TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>TOM OKAMURA (D) House Majority Leader</td>
      <td>0.054054</td>
      <td>0.054054</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>638005</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKA (R) House Minority Leader</td>
      <td>0.119048</td>
      <td>0.119048</td>
    </tr>
    <tr>
      <td>cpb-aacip-225-99n2zd03 (3 rows)</td>
      <td>866266</td>
      <td>QUENTIN KAWANANAKOA (R)<br><br>House Minority Leader</td>
      <td>QUENTIN KAWANAKAO (R) House Minority Leader</td>
      <td>0.116279</td>
      <td>0.116279</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>68902</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>Gov. John Waihee (D)</td>
      <td>0.500000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>126026</td>
      <td>GOV. JOHN WAIHEE (D)</td>
      <td>Gov. John Waihee (D)</td>
      <td>0.500000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>165766</td>
      <td>REP. MIKE CROZIER (D)</td>
      <td>REP. MIKE GROZIER (D)</td>
      <td>0.047619</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>202503</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>521889</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>552252</td>
      <td>REP. ANDREW LEVIN (D)</td>
      <td>REP. ANDREW LEVIN (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>567501</td>
      <td>SEN. PATSY YOUNG (D)</td>
      <td>SEN. PATSY YOUNG (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>596029</td>
      <td>REP. WAYNE METCALF (D)</td>
      <td>Rep. Wayne Metcalf (D)</td>
      <td>0.545455</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>614381</td>
      <td>REP. BRIAN TANIGUCHI (D)</td>
      <td>REPR. BRIAN TANIGUCHI (D)</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>643010</td>
      <td>SEN. ELOISE YAMASHITA-<br><br>TUNGPALAN (D)</td>
      <td>SEN. ELOISE YAMASHITA-TUNGPALAN (D)</td>
      <td>0.057143</td>
      <td>0.057143</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>686386</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>875876</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>938772</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>REP. MIKE O'KIEFFE (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1015015</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1096396</td>
      <td>REP. MAZIE HIRONO (D)<br><br>Chair, Consumer Protection<br><br>Committee</td>
      <td>REPR. MAZIE HIRONO (D) Chair, Consumer Protection Committee</td>
      <td>0.084746</td>
      <td>0.084746</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1172906</td>
      <td>REP. MIKE CROZIER (D)</td>
      <td>MIKE CROZIER (D)</td>
      <td>0.312500</td>
      <td>0.312500</td>
    </tr>
    <tr>
      <td>cpb-aacip-2f864418e19 (78 rows)</td>
      <td>1388755</td>
      <td>SEN. MAMORU YAMASAKI (D)<br><br>Chair, Ways and Means<br><br>Committee</td>
      <td>SEN. MAMORU YAMASAKI (D) Chair, Ways and Means Committee</td>
      <td>0.071429</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>73907</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE-LO TOM Hawaii Public Television</td>
      <td>0.076923</td>
      <td>0.076923</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>97130</td>
      <td>Rep. Joseph Souki (D)<br><br>House Finance Chairman</td>
      <td>Rep. Joseph Souki (D) House Finance Chairman</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>132132</td>
      <td>SEN. ANN KOBAYASHI (D)<br><br>Ways & Means Vice Chairman</td>
      <td>SEN. ANN KOBAYASHI (D) WAYS & MEANS VICE CHAIRMAN</td>
      <td>0.387755</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>252152</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>375008</td>
      <td>Rep. Rod Tam (D)<br><br>House Education Chairman</td>
      <td>Rep. Rod Tam (D) House Education Chairman</td>
      <td>0.048780</td>
      <td>0.048780</td>
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
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
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
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>680514</td>
      <td>SEN. GERALD HAGINO (D)<br><br>Senate Majority Leader</td>
      <td>SEN. GERALD HAGINO (D) SENATE MAJORITY LEADER</td>
      <td>0.422222</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>723657</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>REPR. TOM OKAMURA (D) HOUSE MAJORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-46e8446d567 (18 rows)</td>
      <td>836503</td>
      <td>REP. TOM OKAMURA (D)<br><br>House Majority Leader</td>
      <td>REPR. TOM OKAMURA (D) HOUSE MAJORITY LEADER</td>
      <td>0.441860</td>
      <td>0.069767</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>67401</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>88755</td>
      <td>REP. MAZIE HIRONO (D)</td>
      <td>REPR. MAZIE HIRONO (D)</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>99399</td>
      <td>REP. VIRGINIA ISBELL (D)</td>
      <td>REPR. VIRGINIA ISBELL (D)</td>
      <td>0.040000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>123023</td>
      <td>REP. MAZIE HIRONO (D)</td>
      <td>REPR. MAZIE HIRONO (D)</td>
      <td>0.045455</td>
      <td>0.045455</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>157758</td>
      <td>REP. ANNELLE AMARAL (D)</td>
      <td>Rep. Annelle Amaral (D)</td>
      <td>0.565217</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>193527</td>
      <td>REP. BARBARA MARUMOTO (R)</td>
      <td>REP. BARBARA MARUMOTO (R)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>239506</td>
      <td>REP. CLARICE HASHIMOTO (D)</td>
      <td>REPR. CLARICE-HASHIMOTO (D)</td>
      <td>0.074074</td>
      <td>0.074074</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>265265</td>
      <td>REP. ROSALYN BAKER (D)</td>
      <td>Rep Rosalyn Baker (D)</td>
      <td>0.619048</td>
      <td>0.047619</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>299399</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>618385</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>628629</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary, Chairman</td>
      <td>SEN. RON MENOR (D) Senate Judiciary, Chairman</td>
      <td>0.044444</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>663530</td>
      <td>MAJOR DAVID BENSON<br><br>Honolulu Police Dept.</td>
      <td>MAJOR DAVID BENSON Honolulu Police Dept.</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>687154</td>
      <td>EARL MATSUOKA<br><br>Chairman, State Offender Project</td>
      <td>Earl Matsuoka, Chairman, Status Offender Project</td>
      <td>0.291667</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>774641</td>
      <td>SERGEANT DAVID DEL ROSARIO<br><br>Honolulu Police Dept.</td>
      <td>Sergeant David Del Rosario, Honolulu Police Dept.</td>
      <td>0.428571</td>
      <td>0.040816</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>789890</td>
      <td>KEITH KANESHIRO<br><br>Honolulu City Prosecutor</td>
      <td>KEITH KANESHIRO Honolulu City Prosecutor</td>
      <td>0.050000</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>805906</td>
      <td>SEN. RON MENOR (D)<br><br>Senate Judiciary, Chairman</td>
      <td>SEN. RON MENOR (D) Senate Judiciary, Chairman</td>
      <td>0.044444</td>
      <td>0.044444</td>
    </tr>
    <tr>
      <td>cpb-aacip-5e99ee61039 (18 rows)</td>
      <td>843877</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>367401</td>
      <td>REP. DWIGHT TAKAMINE (D)<br><br>No. Hilo Hamakua</td>
      <td>REPR. DWIGHT TAKAMINE (D) No. HILO HAMAKUA</td>
      <td>0.285714</td>
      <td>0.071429</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>416884</td>
      <td>SEN. MIKE McCARTNEY (D)</td>
      <td>SEN. MIKE McCARTNEY (D)</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>457157</td>
      <td>REP. FRED HEMMINGS (R)<br><br>House Minority Floor Leader</td>
      <td>Rep. Fred Hemmings (R) House Minority Floor Leader</td>
      <td>0.280000</td>
      <td>0.040000</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>502269</td>
      <td>REP. ROD TAM (D)<br><br>House Education Chairman</td>
      <td>REP. ROD TAM (D) HOUSE EDUCATION CHAIRMAN</td>
      <td>0.512195</td>
      <td>0.048780</td>
    </tr>
    <tr>
      <td>cpb-aacip-c361a8d7683 (5 rows)</td>
      <td>583150</td>
      <td>LYNETTE LO TOM<br><br>Hawaii Public Television</td>
      <td>LYNETTE LO TOM Hawaii Public Television</td>
      <td>0.051282</td>
      <td>0.051282</td>
    </tr>
  </tbody>
</table>