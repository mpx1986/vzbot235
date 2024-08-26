resonances_X <- read.csv(dir('/tmp/', full.names=T, pattern="^resonances_x"))
resonances_Y <- read.csv(dir('/tmp/', full.names=T, pattern="^resonances_y"))

peak_power_X<-max(resonances_X$psd_xyz)
peak_power_Y<-max(resonances_Y$psd_xyz)

peak_freq_X<-resonances_X$freq[resonances_X$psd_xyz==peak_power_X]
peak_freq_Y<-resonances_Y$freq[resonances_Y$psd_xyz==peak_power_Y]

half_power_X<-peak_power_X/sqrt(2)
half_power_Y<-peak_power_Y/sqrt(2)

install.packages("rootSolve")
library(rootSolve)

roots_X<-uniroot.all(approxfun(resonances_X$freq,resonances_X$psd_xyz-half_power_X),c(1,135))
roots_Y<-uniroot.all(approxfun(resonances_Y$freq,resonances_Y$psd_xyz-half_power_Y),c(1,135))

Damping_Ratio_X=(roots_X[2]-roots_X[1])/(2*peak_freq_X)
Damping_Ratio_Y=(roots_Y[2]-roots_Y[1])/(2*peak_freq_Y)

Damping_Ratio_X
Damping_Ratio_Y