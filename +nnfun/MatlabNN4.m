function [Y,Xf,Af] = MatlabNN4(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 24-Jul-2015 14:53:44.
% 
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timsteps
%   Each X{1,ts} = 9xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 4xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

  % ===== NEURAL NETWORK CONSTANTS =====
  
  % Input 1
  x1_step1_xoffset = [0;-0.582497746075963;-0.496044142298002;-0.999998672326938;-0.999999997613455;-0.477585455671001;-0.468765896273813;-0.999998832758875;-0.999999248949718];
  x1_step1_gain = [2;1.76884811855292;1.84887238775667;1.00000082545028;1.00000000248081;2.08244056613219;1.96207978703015;1.00000171182966;1.0000003755529];
  x1_step1_ymin = -1;
  
  % Layer 1
  b1 = [-4.7804756484980588;3.266627377710321;-1.6375060193792406;3.6160613294513735;2.5784606329174862;4.393665229283374;-0.3441028447834959;1.5326026548648735;0.95074342076963791;-0.46354591540194184;0.67074223329550764;-1.3714471179048271;0.1531822210805108;-0.2017701986291667;-1.020396390877425;1.1185514231605449;0.64002121781960819;-0.38120953322591894;-1.0909127269779046;0.091552179914040285;2.1684008604417437;-3.0788094265905777;2.678235131393599;1.7143382662838507;4.3044072370908522];
  IW1_1 = [2.5785080099478828 -0.23566046512867883 0.1178840876302714 1.0557194519397024 -0.39847676186450598 0.50128574308188312 1.095018946678757 0.43497510096229997 0.3986062015294341;0.14605269421861847 -1.4784169049793174 0.89341375287103664 0.77581568635931974 1.0716883862927622 1.1415399525408787 0.86274293825724069 -0.64031426211753506 1.4222216775161847;1.7962639031367946 0.90342684522660188 1.1791707918484844 -2.2972689561122785 0.099674961546054805 -0.67559820440739426 -0.21859023005891834 0.17546390407287463 -0.030133205073233933;-1.5276657923780612 -0.57315219570793718 0.29169742424195449 0.045974845760044847 -0.18816197262473558 3.9062160567820272 -0.76980987858325822 -0.55479473463834694 1.951379899445346;-1.4885540309557288 1.0315859918963861 0.056934978495149627 0.69997242924501835 0.32072437953413008 -1.236123075572598 -0.80413615425235485 -0.40208471283843256 0.69523785581732012;-1.7689718012368445 -2.440471420672369 0.091353380504389542 3.732923959685936 -2.211532464893589 -1.0856138440405276 0.68447103000389431 -3.2897475626898331 2.2506108095310622;0.49476051877099847 0.36597624071614593 -1.4473504376861048 -0.80982244787561719 0.22643042715250478 -0.22355936945111654 0.43302978042248896 -0.63408164606252215 1.5523518798751128;-1.802136959095852 -0.81840622405272068 -1.7898614404075892 2.5947628625467174 -0.21744815787169286 0.95378719430898795 0.79078294527221593 -0.3965234896825221 0.2646288010238465;-0.66947274376430699 -1.1105159533857882 0.12453094531862964 -0.056742887439820908 -0.68217086276103012 0.60709171998793088 0.37201494717188144 0.021267165004578405 -0.075868365596026305;0.24772872734434701 -1.067325808630649 0.39843966540836656 0.19042488185468559 -0.88429341882402202 -0.38610708605322835 -0.65570972277976303 -0.23927722258882403 -0.14499329775398459;2.4203463768787619 0.51351778910703716 0.025401535787284817 1.1440973044848886 1.177545474366301 -0.21147747982749132 1.3016316652465834 -1.7080458442908535 1.8108809474219343;-0.95883207363042156 0.028688098322924807 -0.71273455462819024 -1.7097197536079527 0.18745155643031 1.0621358321394658 0.34166719936048329 -0.35150059230401698 0.98127469654999944;-0.044189505431034386 0.75085159898145204 -0.09764093119340797 -1.4921565786415318 -0.21987910836921051 -0.068571025533046975 0.64902423215430138 -0.36542213626364173 0.20830968222920382;-0.01166097831582924 0.25831604238632516 -0.34135322987397937 0.62071620786261439 0.15411689814523033 0.23437178080482698 0.020423003504519123 0.44753670358591335 -0.32493011136504407;-1.5456562342534068 -0.51045131516150533 -1.0730612906293679 1.4846566526434166 -0.69458213413936432 0.72394459141359158 -0.5542924728670956 0.4859240264075349 -0.14763081121795205;1.7020445607005037 -0.47424342258189428 -2.8377953727077818 -1.1058404487252591 0.1762772077101602 -0.35730147744417218 -0.08503133479268607 -1.0915326232584017 0.72115782549041973;-0.39186601394368642 0.59467480540826112 0.25397235264063972 1.1172957353376785 -0.71347572299731699 1.1576384803702677 -1.0082499655338513 1.0632380837567803 -0.66965369787429807;-0.16486071054157123 -0.077860014345568551 -1.9855423271308117 1.454652506263685 0.71514178546594709 -0.2449060257759437 0.8076253629472453 0.050879583346344071 -1.2004792517349117;-0.45600031219102927 -1.1364361201332283 1.0919462643877871 1.0833893493330906 -0.20539924393938547 -0.91716983133534047 -0.16339994616975068 -0.69090987524826841 0.56245101897368543;0.20584900867009578 -0.34621184623475731 -0.05644958759571303 -0.13011949994245903 -0.035589144920359361 -0.2596942050160459 0.027439881043187682 -0.65977206192000293 0.42040540092652656;1.3278657410809971 -0.3688579496873417 -0.16740969337926945 -0.76616712586959212 -0.040773530052057395 0.21676086220020446 -0.5150412440287806 1.5589271340898829 -1.6241199008587084;-1.6264724890824349 0.79726368517957624 -1.5887867818640375 -2.4892807922745201 1.1344707735189297 0.2423383831389653 0.83712804512195227 -0.36769759294797788 1.1048318632469971;2.0586946375952455 -0.77659416642065049 1.0946715702241658 0.72383917231394468 -0.020377314810067659 0.4943325995722907 -0.19490892716124777 0.55997197855692826 -0.73008895907058058;0.37390861059052161 2.1759185946000388 0.51437830528911155 1.6665645556271578 -0.2744409234330456 0.074820609054687237 0.46339221244697271 -0.79158618263698033 1.3465500263544465;0.55640692139161119 -2.5402762374224985 -2.2964648713749556 -0.56078906369179271 0.25614010208919641 0.25693174481629721 1.030899363382402 1.5724576138401924 0.95152337818562149];
  
  % Layer 2
  b2 = [0.81493730862336133;0.46544587884814093;0.26281604133595016;-4.2696634616790234];
  LW2_1 = [0.14319195680797131 -0.010680859712789103 -0.0097645282106075312 0.2325449861160746 -0.096190623713864373 -0.029921166460844837 0.058032892512884196 0.072061891340337525 -0.083544462262102354 0.059303204916340564 0.011269508092703081 0.0096866182788819671 0.1104866318337212 0.08994298979776677 0.0022454292466130297 0.049346149352748905 0.0033806744083363007 -0.042985461980034091 -0.072928624859033661 -0.064591756122678382 -0.057597286084567705 -0.053204861348652377 0.14889344153831754 0.057185142631378354 -0.84624420279749324;0.37176910721060424 0.27863199304843111 0.024407289452684455 0.14468000567819589 -0.19836277774288164 0.027834279935815345 -0.021986861849271632 0.054436423380143872 0.0076472646288681806 -0.10484291804836694 0.016389787285755856 -0.1144930598670492 0.042265293785789193 -0.18882467224951685 0.052824994767387029 -0.14031134392049263 0.013669474074371758 -0.015892358756041784 0.066731129475240181 0.11608368569125073 0.014125005528925176 0.1127153373973583 0.12454711739851222 0.019255912907154359 -0.35084180568955114;1.9330990263387136 0.88980589005470601 -0.35334944439628829 -0.29873751649489361 -0.056464148979169966 0.27038422620415475 0.6511366926933142 -0.098891625163201158 -0.86797774565033192 0.7814275307447508 -0.69789704216052761 -0.18091796224715118 -0.065066562917981074 -2.3859446285436365 0.24693192714250217 0.55062822807299772 -0.27741856741373677 0.54782205450560317 -0.12724649340053201 -2.634758671669406 -1.2658446365672487 0.52465549231670561 2.0047850951646149 0.31497300413256207 0.94748881653072692;-0.9876958667764606 0.15491306590642048 2.7503596030881603 0.6570822163032588 1.2841695086596958 -0.23214560189014594 -0.37123477375282005 1.8440989326584363 0.48184956114417038 -0.14050570770203599 0.083703225297860354 -0.19901096168141347 -1.025268560836017 -0.063386630260163654 -0.61605362925829477 -0.22220115102714452 0.36284810771598058 0.11696019937382175 -0.30345324084761655 0.85258349979050929 -0.0038759592185677368 0.46008398059587396 -0.47545184309093702 -0.070507853011982605 2.8005844496420096];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = [1.93030921978322;2.3776078318995;1.00000119371446;1.00000601125089];
  y1_step1_xoffset = [-0.582497746075963;-0.479895273387133;-0.99999793580007;-0.999987977625719];
  
  % ===== SIMULATION ========
  
  % Format Input Arguments
  isCellX = iscell(X);
  if ~isCellX, X = {X}; end;
  
  % Dimensions
  TS = size(X,2); % timesteps
  if ~isempty(X)
    Q = size(X{1},2); % samples/series
  else
    Q = 0;
  end
  
  % Allocate Outputs
  Y = cell(1,TS);
  
  % Time loop
  for ts=1:TS
  
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
  end
  
  % Final Delay States
  Xf = cell(1,0);
  Af = cell(2,0);
  
  % Format Output Arguments
  if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
  y = bsxfun(@minus,x,settings_xoffset);
  y = bsxfun(@times,y,settings_gain);
  y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
  x = bsxfun(@minus,y,settings_ymin);
  x = bsxfun(@rdivide,x,settings_gain);
  x = bsxfun(@plus,x,settings_xoffset);
end
