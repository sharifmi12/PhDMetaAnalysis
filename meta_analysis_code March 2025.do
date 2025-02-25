********************************************************
**Tittle: Hysterectomy, oophorectomy, and bone health: a systematic review and meta-analysis
** Author: M Shariful Islam et al 2025
** Organization: The University of Queensland
** Created 8 Jan 2025
********************************************************

**steps
**Download specific datasets for a specific meta-analysis. There are 4 datasets.
*install metan using this codes- ssc install metan, replace

*Table of contents:
**Figure 2 Forest plot showing the association between hysterectomy and/or oophorectomy and risk of fracture
**Figure 3 Forest plot for the association between hysterectomy and/or oophorectomy and osteoporosis
**Supplementary Figure 2:The leave-one-out meta-analysis demonstrates the stability of the results by re-running the analysis each time one study is excluded. Here outcome is fracture, exposure is BO-hysterectomy unspecified, and the comparison group is no oophorectomy-hysterectomy unspecified. 
**Supplementary Figure 3: Forest plot showing the risk of any fracture after BO- hysterectomy unspecified compared to no oophorectomy- hysterectomy unspecified among women with no MHT use
**Supplementary Figure 4: Forest plot showing the association of hysterectomy and oophorectomy with fracture (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method)
**Supplementary Figure 5: Forest plot showing the risk of fracture stratified by menopausal status at surgery
**Supplementary Figure 6: The leave-one-out meta-analysis demonstrates the stability of the results by re-running the analysis each time one study is excluded. Here, the outcome is osteoporosis, exposure is BO-hysterectomy unspecified, and the comparison group is no oophorectomy-hysterectomy unspecified. 
**Supplementary Figure 7: Forest plot showing the association of hysterectomy and oophorectomy with osteoporosis (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method)




**Figure 2 Forest plot showing the association between hysterectomy and/or oophorectomy and risk of fracture
***************************************************************************************************************

clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 2
use "figure2.dta"


 
metan logrr loglowCI loghighCI, by(Subgroup) sortby(rev_Publishing_year) random (dl) eform  lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "figure2.png", width(16000) height(5300) 
**************************************************************************************************************************************************************************************** 



**Figure 3 Forest plot for the association between hysterectomy and/or oophorectomy and osteoporosis
********************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 3
use "figure3.dta"


 metan logrr loglowCI loghighCI, by(Subgroup) sortby(rev_Publishing_year)  random (dl) eform  lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "figure3.png", width(11500) height(3900) 
****************************************************************************************************************************************************************************************

**Supplementary Figure 2:The leave-one-out meta-analysis demonstrates the stability of the results by re-running the analysis each time one study is excluded. Here outcome is fracture, exposure is BO-hysterectomy unspecified, and the comparison group is no oophorectomy-hysterectomy unspecified. 
****************************************************************************************************************************************************************************************
clear

cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
use "sfigure2.dta"
  meta set logrr logSE, studylabel(Author)
 meta forestplot, leaveoneout  eform(Relative risk) sort (rev_Publishing_year)
 meta summarize, leaveoneout
 
 
 graph export "sfigure2.png", width(3700) height(2500) 
 
 
 
****************************************************************************************************

**Supplementary Figure 3: Forest plot showing the risk of any fracture after BO- hysterectomy unspecified compared to no oophorectomy- hysterectomy unspecified among women with no MHT use. 
****************************************************************************************************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 3
use "Sfigure3.dta"


 metan logrr loglowCI loghighCI, sortby(rev_Publishing_year) random (dl) eform  lcols (Author Exposure Comparison Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.75,1,1.5)  xsize(9) force) 
graph export "Sfigure3.png", width(11000) height(4000) 
****************************************************************************************************************************************************************************************





**Supplementary Figure 4: Forest plot showing the association of hysterectomy and oophorectomy with fracture (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method). 
****************************************************************************************************************************************************************************************


clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*dataset would be same as figure 2. use dataset for figure 2
use "figure2.dta"
 
 
metan logrr loglowCI loghighCI, by(Subgroup) sortby(rev_Publishing_year) model(random, hksj)  eform  lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "Sfigure4.png", width(16000) height(5300)  
****************************************************************************************************************************************************************************************





 
**Supplementary Figure 5: Forest plot showing the risk of fracture stratified by menopausal status at surgery. 
**************************************************************************************************************
clear

cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
use "sfigure5.dta"



 metan logrr loglowCI loghighCI, by(Subgroup) sortby(rev_Publishing_year) random (dl) eform  lcols (Author Exposure Comparison Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "Sfigure5.png", width(13500) height(3900) 
****************************************************************************************************************************************************************************************

**Supplementary Figure 6: The leave-one-out meta-analysis demonstrates the stability of the results by re-running the analysis each time one study is excluded. Here, the outcome is osteoporosis, exposure is BO-hysterectomy unspecified, and the comparison group is no oophorectomy-hysterectomy unspecified. 


clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 3
use "sfigure6.dta"

 meta set logrr logSE, studylabel(Author)
 meta forestplot, leaveoneout  eform(Relative risk) sort (rev_Publishing_year) 
 meta summarize, leaveoneout
 
 graph export "sfigure6.png", width(3700) height(1500) 
 




**Supplementary Figure 7: Forest plot showing the association of hysterectomy and oophorectomy with osteoporosis (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method). 
****************************************************************************************************************************************************************************************
clear

cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
use "figure3.dta"

 
 metan logrr loglowCI loghighCI, by(Subgroup) sortby(rev_Publishing_year) eform  model(random, hksj) lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "sfigure7.png", width(11600) height(3900) 
****************************************************************************************************************************************************************************************













