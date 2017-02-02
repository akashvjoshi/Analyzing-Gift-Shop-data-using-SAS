*Question- 2. regression model using given explainatory variables

data d1;
set work.import;
TS07 = sum(RetF07Dollars,RetS07Dollars,IntF07GDollars,IntF07NGDollars,IntS07GDollars,IntS07NGDollars,CatF07GDollars,CatF07NGDollars,CatS07GDollars,CatS07NGDollars);
if carowner = 'Y' then CO = 1;if carowner = 'N' then CO = 0;
if HomeValue<>0 then logHV = log(HomeValue); if HomeValue=0 then logHV = 0;
proc reg;
model TS07 = Storedist Homecode logHV Lengthres CO Rets06trips Emailsf07 catcircF07/stb;
run;

*Question - 6. Adding other predictors into the model

data d1;
set work.import;
TS07 = sum(RetF07Dollars,RetS07Dollars,IntF07GDollars,IntF07NGDollars,IntS07GDollars,IntS07NGDollars,CatF07GDollars,CatF07NGDollars,CatS07GDollars,CatS07NGDollars);
CatCirc07 = sum(CatCircF07,CatCircS07);
*CatCirc06 = sum(CatCircF06,CatCircS06);
CatCirc05 = sum(CatCircF05,CatCircS05);
Emails07 = sum (EmailsF07,EmailsS07);
Emails06 = sum (EmailsF06,EmailsS06);
*Emails05 = sum (EmailsF05,EmailsS05);
if carowner = 'Y' then CO = 1;if carowner = 'N' then CO = 0;
if HomeValue<>0 then logHV = log(HomeValue); if HomeValue=0 then logHV = 0;
*if travel = 'Y' then TR = 1; if travel = 'N' then TR = 0;
*if DogOwner = 'Y' then DOwner = 1; if DogOwner = 'N' then DOwner = 0;
*if fashion = 'Y' then fs = 1; if fashion = 'N' then fs = 0;
if FirstChannel = 'Ret' then FC = 1; if FirstChannel = 'Cat' then FC = 2; else FC = 3;
*if hunting = 'Y' then Hun = 1; if hunting = 'N' then TR = 0;
proc reg;
model TS07 = Storedist Homecode logHV Lengthres CO Rets06trips Emails07 Emails06 catcirc07 catcirc05 IncCode FC Agecode;
run;

*Question - 7. Correlation among the variables in Q-7

data d1;
set work.import;
TS07 = sum(RetF07Dollars,RetS07Dollars,IntF07GDollars,IntF07NGDollars,IntS07GDollars,IntS07NGDollars,CatF07GDollars,CatF07NGDollars,CatS07GDollars,CatS07NGDollars);
CatCirc07 = sum(CatCircF07,CatCircS07);
CatCirc05 = sum(CatCircF05,CatCircS05);
Emails07 = sum (EmailsF07,EmailsS07);
Emails06 = sum (EmailsF06,EmailsS06);
if carowner = 'Y' then CO = 1;if carowner = 'N' then CO = 0;
if HomeValue<>0 then logHV = log(HomeValue); if HomeValue=0 then logHV = 0;
if FirstChannel = 'Ret' then FC = 1; if FirstChannel = 'Cat' then FC = 2; else FC = 3;
proc corr; var Storedist Homecode logHV Lengthres CO Rets06trips Emails07 Emails06 catcirc07 catcirc05 IncCode FC Agecode; run;