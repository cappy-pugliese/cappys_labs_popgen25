#The GT row names include the chromosome, the position and the alleles. We can use these to start building a data frame.
ids = gsub(":[A,T,C,G]*:[A,T,C,G]*","",rownames(GT))
chr = gsub(":.*","",ids)
pos = as.numeric(gsub(".*:","",ids))
summary_df = data.frame(chr=chr,pos=pos)
#summary_df$tot_het = apply(GT,1,sample_het)
#This identifies the columns for which the samples match. Rather than store a new genotype matrix for each, we can just subset on the go.
ceu_ids= which(colnames(GT) %in% samples$sample_id[which(samples$population == "CEU")])
mxl_ids= which(colnames(GT) %in% samples$sample_id[which(samples$population == "MXL")])
yri_ids= which(colnames(GT) %in% samples$sample_id[which(samples$population == "YRI")])

#Heterozygosities
summary_df$CEU_het = apply(GT[,ceu_ids],1,sample_het)
summary_df$MXL_het = apply(GT[,mxl_ids],1,sample_het)
summary_df$YRI_het = apply(GT[,yri_ids],1,sample_het)

#Allele frequencies
summary_df$CEU_p = apply(GT[,ceu_ids],1,freq_GT)
summary_df$MXL_p = apply(GT[,mxl_ids],1,freq_GT)
summary_df$YRI_p = apply(GT[,yri_ids],1,freq_GT)

#And now d_xy, we'll use the precalculated p values
summary_df$CEU_MXL_dxy = dxy_site(summary_df$CEU_p,summary_df$MXL_p)

summary_df$CEU_YRI_dxy = dxy_site(summary_df$CEU_p,summary_df$YRI_p)

summary_df$YRI_MXL_dxy = dxy_site(summary_df$YRI_p,summary_df$MXL_p)

### time to plot
dxy_plot = ggplot(summary_df,aes(x=pos))+
  geom_point(aes(y=CEU_YRI_dxy),col="coral",alpha=0.4)+
  geom_smooth(aes(y=CEU_YRI_dxy),col="coral")+
  geom_point(aes(y=YRI_MXL_dxy),col="cyan",alpha=0.4)+
  geom_smooth(aes(y=YRI_MXL_dxy),col="cyan")+
  geom_point(aes(y=CEU_MXL_dxy),col="chartreuse",alpha=0.4)+
  geom_smooth(aes(y=CEU_MXL_dxy),col="chartreuse")+
  labs(x="Position(bp)",y="d_xy")
dxy_plot