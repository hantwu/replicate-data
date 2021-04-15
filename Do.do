
*Preprocessing
encode city0,gen(city)
encode province,gen(pro)

*OLS Regression
reg dialectdifference topographicrelief ethnicminorities percapitaroadpassengers lnpercapitagdp lnpopulationdensity plainareaproportion hillyareaproportion mountainousareaproportion
reg dialectdifference topographicrelief ethnicminorities percapitaroadpassengers lnpercapitagdp lnpopulationdensity plainareaproportion hillyareaproportion mountainousareaproportion i.pro

*Descriptive statistical analysis
tabstat outpatientcare hospitalization physicalexamination selftreatment facilitiesforoutpatientcare facilitiesforinpatientcare dialectdifference householdincomenew basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight smoking drinking urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin support e ,stats(mean sd q) c(s)

*Preprocessing
encode city0,gen(city)
encode province,gen(pro)
winsor householdincome,gen(householdincomenew) p(0.01)
gen lnhouseholdincome=ln(1+householdincomenew/10000)


*Probit Regression
probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)
margins,dydx(e)

probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)
margins,dydx(e)

probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)
margins,dydx(e)

probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)
margins,dydx(e)

reg facilitiesforoutpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)

reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade,vce(cluster city)


*Heterogeneity analysis
*1
probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==1,vce(cluster city)
margins,dydx(e)
probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==0,vce(cluster city)
margins,dydx(e)

probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==1,vce(cluster city)
margins,dydx(e)
probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==0,vce(cluster city)
margins,dydx(e)

probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==1,vce(cluster city)
margins,dydx(e)
probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==0,vce(cluster city)
margins,dydx(e)

probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade if urban==1,vce(cluster city)
margins,dydx(e)
probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if urban==0,vce(cluster city)
margins,dydx(e)

reg facilitiesforoutpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if urban==1,vce(cluster city)
reg facilitiesforoutpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if urban==0,vce(cluster city)

reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if urban==1,vce(cluster city)
reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro i.decade  if urban==0,vce(cluster city)


*2
probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age>69,vce(cluster city)
margins,dydx(e)
probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)
margins,dydx(e)

probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age>69,vce(cluster city)
margins,dydx(e)
probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)
margins,dydx(e)

probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age>69,vce(cluster city)
margins,dydx(e)
probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)
margins,dydx(e)

probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitalbeds mandarin lnsupport i.pro  i.decade if age>69,vce(cluster city)
margins,dydx(e)
probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors  mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)
margins,dydx(e)

reg facilitiesforoutpatientcare e sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  if age>69,vce(cluster city)
reg facilitiesforoutpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)

reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age>69,vce(cluster city)
reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors mandarin lnsupport i.pro  i.decade if age<70,vce(cluster city)


*Endogenous processing
ivregress 2sls selftreatment lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth/*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade (e=lnrice), vce(cluster city) first  

ivregress 2sls phy lnhouseholdincome  basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade (e=to),vce(cluster city) first

ivregress 2sls out lnhouseholdincome  basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade (e=rice),vce(cluster city)  first

ivregress 2sls  hospitalization lnhouseholdincome  basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade  (e=lnrice),vce(cluster city)  first

ivregress 2sls facilitiesforoutpatientcare lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed  employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors i.pro i.decade (e=to ),vce(cluster city) first

ivregress 2sls facilitiesforinpatientcare lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*iv
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade (e=lnrice), vce(cluster city) first

*CEM
astile e2=e ,nquantiles(2)
imb selfratinghealth mentalhealth bodyhealth chronicdiseases lnhouseholdincome ,tr(e2)
cem selfratinghealth mentalhealth bodyhealth chronicdiseases lnhouseholdincome ,tr(e2)
qui cem selfratinghealth mentalhealth bodyhealth chronicdiseases,tr(e2)

probit selftreatment e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)
margins,dydx(e)

probit physicalexamination e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)
margins,dydx(e)

probit outpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)
margins,dydx(e)

probit hospitalization e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)
margins,dydx(e)

reg facilitiesforoutpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)

reg facilitiesforinpatientcare e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace  healthinstitutions hospitals hospitalbeds doctors i.pro i.decade [iweight=cem_weights],vce(cluster city)


*mechanism
probit poor e lnhouseholdincome  basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors ,vce(cluster city)
margins,dydx(e )

probit noavai e lnhouseholdincome  basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors ,vce(cluster city)
margins,dydx(e)

reg healthinsuranceusage e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade,vce(cluster city)

reg understood e lnhouseholdincome basichealthinsurance otherhealthinsurance sex age agriculturalhukou education selfratinghealth mentalhealth bodyhealth /*
*/ chronicdiseases farmemployed householdagriculturalwork employed height weight urban hukoulocation birthplace healthinstitutions hospitals hospitalbeds doctors i.pro i.decade,vce(cluster city)

