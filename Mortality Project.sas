/*
Joao Paulo Rodrigues Rola
4/23/2024
*/

/* Import the dataset */
data final;
  infile '/home/u63775865/sasuser.v94/Dataset_MLDA.csv' delimiter=',' firstobs=2;
  input agecell all allfitted internal internalfitted external externalfitted alcohol alcoholfitted homicide homicidefitted suicide suicidefitted mva mvafitted drugs drugsfitted externalother externalotherfitted;
run;

/* Impute missing values with mean */
proc stdize data=final out=final_imputed reponly missing=mean;
  var agecell all allfitted internal internalfitted external externalfitted alcohol alcoholfitted homicide homicidefitted suicide suicidefitted mva mvafitted drugs drugsfitted externalother externalotherfitted;
run;

/* Export the imputed dataset */
proc export data=final_imputed
  outfile='/home/u63775865/sasuser.v94/Final Exam Dataset_MLDA.csv' 
  dbms=csv replace;
  delimiter=',';
run;

/* Compute summary statistics */
proc means data=final_imputed;
  var all internal external alcohol homicide suicide mva drugs externalother;
run;

/* Explore distribution */
proc univariate data=final_imputed;
  var all internal external alcohol homicide suicide mva drugs externalother;
  histogram / normal;
run;

/* Create scatter plots */
proc sgplot data=final_imputed;
  /* Scatter plot for all mortality rates */
  scatter x=agecell y=all / markerattrs=(symbol=circlefilled) 
                               datalabel=agecell;
  title 'Age Profile for All Mortality Rates';

  /* Scatter plot for internal mortality rates */
  scatter x=agecell y=internal / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Internal Mortality Rates';

  /* Repeat for other mortality rate categories */
  /* Scatter plot for external mortality rates */
  scatter x=agecell y=external / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for External Mortality Rates';

  /* Scatter plot for alcohol-related mortality rates */
  scatter x=agecell y=alcohol / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Alcohol-related Mortality Rates';

  /* Scatter plot for homicide mortality rates */
  scatter x=agecell y=homicide / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Homicide Mortality Rates';

  /* Scatter plot for suicide mortality rates */
  scatter x=agecell y=suicide / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Suicide Mortality Rates';

  /* Scatter plot for motor vehicle accidents mortality rates */
  scatter x=agecell y=mva / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Motor Vehicle Accidents Mortality Rates';

  /* Scatter plot for drugs-related mortality rates */
  scatter x=agecell y=drugs / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Drugs-related Mortality Rates';

  /* Scatter plot for other external mortality rates */
  scatter x=agecell y=externalother / markerattrs=(symbol=circlefilled) 
                                   datalabel=agecell;
  title 'Age Profile for Other External Mortality Rates';

run;

/* Create line graphs */
proc sgplot data=final_imputed;
  /* Line graph for all mortality rates */
  series x=agecell y=all / lineattrs=(color=blue thickness=2);
  title 'Age Profile for All Mortality Rates';

  /* Line graph for internal mortality rates */
  series x=agecell y=internal / lineattrs=(color=red thickness=2);
  title 'Age Profile for Internal Mortality Rates';

  /* Repeat for other mortality rate categories */
  /* Line graph for external mortality rates */
  series x=agecell y=external / lineattrs=(color=green thickness=2);
  title 'Age Profile for External Mortality Rates';

  /* Line graph for alcohol-related mortality rates */
  series x=agecell y=alcohol / lineattrs=(color=purple thickness=2);
  title 'Age Profile for Alcohol-related Mortality Rates';

  /* Line graph for homicide mortality rates */
  series x=agecell y=homicide / lineattrs=(color=orange thickness=2);
  title 'Age Profile for Homicide Mortality Rates';

  /* Line graph for suicide mortality rates */
  series x=agecell y=suicide / lineattrs=(color=black thickness=2);
  title 'Age Profile for Suicide Mortality Rates';

  /* Line graph for motor vehicle accidents mortality rates */
  series x=agecell y=mva / lineattrs=(color=pink thickness=2);
  title 'Age Profile for Motor Vehicle Accidents Mortality Rates';

  /* Line graph for drugs-related mortality rates */
  series x=agecell y=drugs / lineattrs=(color=blue thickness=2 pattern=dot);
  title 'Age Profile for Drugs-related Mortality Rates';

  /* Line graph for other external mortality rates */
  series x=agecell y=externalother / lineattrs=(color=green thickness=2 pattern=dot);
  title 'Age Profile for Other External Mortality Rates';

run;

/* Create binary treatment variable */
data final_imputed;
  set final_imputed;
  treatment = (agecell >= 21);
run;

/* RD models for each mortality rate category */
/* Model for all mortality rates */
proc reg data=final_imputed;
  model all = treatment;
  output out=all_model p=pred_all;
run;

/* Model for internal mortality rates */
proc reg data=final_imputed;
  model internal = treatment;
  output out=internal_model p=pred_internal;
run;

/* Model for external mortality rates */
proc reg data=final_imputed;
  model external = treatment;
  output out=external_model p=pred_external;
run;

/* Model for alcohol-related mortality rates */
proc reg data=final_imputed;
  model alcohol = treatment;
  output out=alcohol_model p=pred_alcohol;
run;

/* Model for homicide mortality rates */
proc reg data=final_imputed;
  model homicide = treatment;
  output out=homicide_model p=pred_homicide;
run;

/* Model for suicide mortality rates */
proc reg data=final_imputed;
  model suicide = treatment;
  output out=suicide_model p=pred_suicide;
run;

/* Model for motor vehicle accidents mortality rates */
proc reg data=final_imputed;
  model mva = treatment;
  output out=mva_model p=pred_mva;
run;

/* Model for drugs-related mortality rates */
proc reg data=final_imputed;
  model drugs = treatment;
  output out=drugs_model p=pred_drugs;
run;

/* Model for other external mortality rates */
proc reg data=final_imputed;
  model externalother = treatment;
  output out=external_other_model p=pred_external_other;
run;



