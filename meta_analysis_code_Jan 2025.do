********************************************************
**Tittle: Hysterectomy, oophorectomy, and bone health: a systematic review and meta-analysis
** Author: M Shariful Islam et al 2025
** Organization: The University of Queensland
** Created 8 Jan 2025
********************************************************

**steps
**Download specific datasets for a specific meta-analysis. There are 4 datasets
*install metan using this codes- ssc install metan, replace

*Table of contents:
**1. Figure 2 Forest plot showing the association between hysterectomy and/or oophorectomy and risk of fracture
**2.Figure 3 Forest plot for the association between hysterectomy and/or oophorectomy and osteoporosis
**3. Supplementary Figure 2: Forest plot showing the risk of any fracture after BO- hysterectomy unspecified compared to no oophorectomy- hysterectomy unspecified among women with no MHT use
**4. Supplementary Figure 3: Forest plot showing the association of hysterectomy and oophorectomy with fracture (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method)
**5. Supplementary Figure 4: Forest plot showing the risk of fracture stratified by menopausal status at surgery
**6. Supplementary Figure 5: Forest plot showing the association of hysterectomy and oophorectomy with osteoporosis (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman (HKSJ) method)




**1. Figure 2 Forest plot showing the association between hysterectomy and/or oophorectomy and risk of fracture
***************************************************************************************************************

clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 2
use "figure2.dta"

metan logrr loglowCI loghighCI, by(Subgroup) sortby(Order) random (dl) eform  lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "figure2.png", width(15500) height(5000) 
**************************************************************************************************************************************************************************************** 



**2.Figure 3 Forest plot for the association between hysterectomy and/or oophorectomy and osteoporosis
********************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 3
use "figure3.dta"
 
 metan logrr loglowCI loghighCI, by(Subgroup) sortby(Order) random (dl) eform  lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "figure3.png", width(10800) height(3900) 
****************************************************************************************************************************************************************************************



**3. Supplementary Figure 2: Forest plot showing the risk of any fracture after BO- hysterectomy unspecified compared to no oophorectomy- hysterectomy unspecified among women with no MHT use. 
****************************************************************************************************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*use dataset for figure 3
use "Sfigure2.dta"

 metan logrr loglowCI loghighCI, sortby(Order) random (dl) eform  lcols (Author Exposure Comparison Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.75,1,2)  xsize(9) force) 
graph export "Sfigure2.png", width(11000) height(4000) 
****************************************************************************************************************************************************************************************



**4. Supplementary Figure 3: Forest plot showing the association of hysterectomy and oophorectomy with fracture (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman [HKSJ] method). 
****************************************************************************************************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
*dataset would be same as figure 2. use dataset for figure 2
use "figure2.dta"
 
metan logrr loglowCI loghighCI, by(Subgroup) sortby(Order) eform model(random, hksj)   lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "Sfigure3.png", width(15500) height(5000) 
****************************************************************************************************************************************************************************************



**5. Supplementary Figure 4: Forest plot showing the risk of fracture stratified by menopausal status at surgery. 
**************************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
use "sfigure4.dta"

 metan logrr loglowCI loghighCI, by(Subgroup) sortby(Order) random (dl) eform  lcols (Author Exposure Comparison Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "Sfigure4.png", width(12000) height(3900) 
****************************************************************************************************************************************************************************************



**6. Supplementary Figure 5: Forest plot showing the association of hysterectomy and oophorectomy with osteoporosis (Sensitivity analysis using Hartung-Knapp-Sidik-Jonkman [HKSJ] method). 
****************************************************************************************************************************************************************************************
clear
*set up directory
cd "C:\Users\s4773888\OneDrive - The University of Queensland\PhD\sys rev\stata"
use "figure3.dta"
 
 metan logrr loglowCI loghighCI, by(Subgroup) sortby(Order) eform  model(random, hksj) lcols (Author ExposureN ComparisonN Age MHT)  effect(Relative risk) texts (160)  boxsca(3) labtitle(Studies) ///
forestplot(favours(Decreased Risk#Increased Risk) xlabel(.5,1,2,3)  xsize(8) force nooverall) 
graph export "sfigure5.png", width(10800) height(3900) 
****************************************************************************************************************************************************************************************













