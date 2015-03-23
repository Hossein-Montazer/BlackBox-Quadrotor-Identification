clear all, clc, close all;

[in,out,mod] = loaddata();

opt = identifyOptions;
opt.inputDelayAuto = false;
opt.cost ='fit';
opt.modelType = 'oe';
opt.maxOrders = [ 5 5 5 5 3];
opt.validate = 1;
opt.validationData = iddata(out.prbs3,in.prbs3);

disp('OE model');
modelOE = identify(in.u1,out.y1,opt);

opt.modelType ='arx';
disp('ARX model');
modelARX = identify(in.u1,out.y1,opt);


modelOE, modelARX
compare(in.u1,out.y1,modelARX,modelOE);
