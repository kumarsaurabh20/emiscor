romosomal_assignment
mv Final.tab chromosomal_assignment/
cd chromosomal_assignment/
##
awk '{FS=OFS="\t"} {if ($5~/^W/) print $1,$2,$3,$6,$7,$8,$9}' Melitaea_cinxia_superscaffolds.agp > Melitaea_cinxia_superscaffolds_step_1.tab
awk '{print $9}' Melitaea_cinxia_v1.0.34_CDS.gff3 > temp1
cut -d';' -f1 temp1 > temp2
sed -i 's/ID=CDS://g' temp2
awk '{FS=OFS="\t"} {print $1,$4,$5,$7}' Melitaea_cinxia_v1.0.34_CDS.gff3 > temp3
paste temp3 temp2 > Melitaea_cinxia_step_1.tab
sort -k1,1 Melitaea_cinxia_step_1.tab > Melitaea_cinxia_step_1.tab.sorted
sort -k1,1 Melitaea_cinxia_superscaffolds_step_1.tab > Melitaea_cinxia_superscaffolds_step_1.tab.sorted
join -t $'\t' -j 1 -a 1 -o1.5,1.2,1.3,1.4,1.1,2.2,2.3,2.4,2.5,2.6,2.7 Melitaea_cinxia_step_1.tab.sorted Melitaea_cinxia_superscaffolds_step_1.tab.sorted > Melitaea_cinxia_step_2.tab
awk '{FS=OFS="\t"} {if ($3~/^CDS/) print $0}' kitengela_run_2nd_pass_with_est_prt.all.gff.aed-1.0.gff > kitengela_run_2nd_pass_with_est_prt.all.gff.aed-1.0_all_CDS.gff
rm temp*
##
awk '{print $9}' kitengela_run_2nd_pass_with_est_prt.all.gff.aed-1.0_all_CDS.gff | cut -d';' -f1 - | sed 's/ID=//g' - | sed 's/:cds//g' - > temp
awk '{FS=OFS="\t"} {print $1,$4,$5,$7}' kitengela_run_2nd_pass_with_est_prt.all.gff.aed-1.0_all_CDS.gff > temp1
paste temp1 temp > kitengela_step_1.tab
awk '{FS=OFS="\t"} {print $5,$2,$3,$4,$1}' kitengela_step_1.tab > kitengela_step_2.tab
sed -i 's/Dchrk|//g' Final.tabks575
sed -i 's/Dchrk|//g' Final.tab
sed -i 's/Mcix|//g' Final.tab
sort -k1,1 kitengela_step_2.tab > kitengela_step_2.tab.sorted
sort -k1,1 Melitaea_cinxia_step_2.tab > Melitaea_cinxia_step_2.tab.sorted
awk '{FS=OFS="\t"} {print $2,$1}' Final.tab > Final.tab.rev
sort -k1,1 Final.tab.rev > Final.tab.rev.sorted
##
join -t $'\t' -j 1 -a 1 -o1.2,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,2.10,2.11 Final.tab.rev.sorted Melitaea_cinxia_step_2.tab.sorted > Melitaea_cinxia_step_3.tab
sort -k1,1 Melitaea_cinxia_step_3.tab > Melitaea_cinxia_step_3.tab.sorted
join -t $'\t' -j 1 -a 1 -o1.1,1.2,1.3,1.4,1.5,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,2.10,2.11,2.12 kitengela_step_2.tab.sorted Melitaea_cinxia_step_3.tab.sorted > kitengela_step_3.tab
awk '{OFS=FS="\t"} {print $4,$5,$6,$1,$2,$3,$7}' Melitaea_cinxia_superscaffolds_step_1.tab.sorted > Melitaea_cinxia_superscaffolds_step_1.tab.sorted.column_adjusted
sort -k1,1 Melitaea_cinxia_superscaffolds_step_1.tab.sorted.column_adjusted > Melitaea_cinxia_superscaffolds_step_1.tab.sorted.column_adjusted.sorted
##
awk '{OFS=FS="\t"} {print $10,$1,$2,$3,$4,$5,$6,$7,$8,$9}' kitengela_step_3.tab > kitengela_step_3.tab.column_adjusted
sort -k1,1 kitengela_step_3.tab.column_adjusted
sort -k1,1 kitengela_step_3.tab.column_adjusted > kitengela_step_3.tab.column_adjusted.sorted
##
awk '{if ($1~/^s/) print $0}' kitengela_step_3.tab.column_adjusted.sorted | wc -l -
awk '{if ($1~/^s/) print $0}' kitengela_step_3.tab.column_adjusted.sorted | wc -l - | uniq
awk '{if ($1~/^s/) print $0}' kitengela_step_3.tab.column_adjusted.sorted | uniq | wc -l
awk '{FS=OFS="\t"} {print $6, $1,$2,$3,$4,$5}' Melitaea_cinxia_step_3.tab.sorted > Melitaea_cinxia_step_3.tab.sorted.column_adjusted
sort -k1,1 Melitaea_cinxia_step_3.tab.sorted.column_adjusted > Melitaea_cinxia_step_3.tab.sorted.column_adjusted.sorted
join -t $'\t' -j 1 -a 1 -o1.2,1.3,1.4,1.5,1.6,2.1,2.2,2.3,2.4,2.5,2.6,2.7 Melitaea_cinxia_step_3.tab.sorted.column_adjusted.sorted Melitaea_cinxia_superscaffolds_step_1.tab.sorted.column_adjusted.sorted > Melitaea_cinxia_step_4.tab
sort -k1,1 Melitaea_cinxia_step_4.tab > Melitaea_cinxia_step_4.tab.sorted
join -t $'\t' -j 1 -a 1 -o1.1,1.2,1.3,1.4,1.5,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,2.10,2.11,2.12 kitengela_step_2.tab.sorted Melitaea_cinxia_step_4.tab.sorted > kitengela_step_5.tab
