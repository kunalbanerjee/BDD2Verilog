module bdd_MUX ( out, inp0, inp1, selectBar, select );

output out;
input  inp0, inp1, selectBar, select;

nmos ( out, inp0, selectBar );
nmos ( out, inp1, select );

endmodule



module bdd_inv ( out, in );

output out;
input  in;

supply1 power;
supply0 ground;

pmos ( out, power,  in );
nmos ( out, ground, in );

endmodule


module bdd_pre_top ( outpre, insbox, pre );

output outpre;
input  insbox, pre;

wire out;

bdd_inv inv1 ( outpre, out );

pmos ( out, power,  pre );
nmos ( out, insbox, pre );

endmodule


module bdd_Sbox ( uOUTPUT, cOUTPUT, INPUT0, INPUT1, pre );

output uOUTPUT, cOUTPUT;
input  INPUT0, INPUT1, pre;

//Uncomplemented BDD
bdd_MUX unode_v7s1_1 ( uOUTPUT, uinp0_v7s1_1, uinp1_v7s1_1, selectBar_v7, select_v7 );
bdd_MUX unode_v5s1_2 ( uinp1_v7s1_1, uinp0_v5s1_2, uinp1_v5s1_2, selectBar_v5, select_v5 );
bdd_MUX unode_v5s2_513 ( uinp0_v7s1_1, uinp0_v5s2_513, uinp1_v5s2_513, selectBar_v5, select_v5 );
bdd_MUX unode_v1s2_3 ( uinp1_v5s1_2, uinp0_v1s2_3, uinp1_v1s2_3, selectBar_v1, select_v1 );
bdd_MUX unode_v1s3_258 ( uinp0_v5s1_2, uinp0_v1s3_258, uinp1_v1s3_258, selectBar_v1, select_v1 );
bdd_pre_top unode_R_4 ( uinp1_v1s2_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v1s2_3, uinp_R_131, pre );
bdd_MUX unode_v4s1_68 ( uinp_R_4, uinp0_v4s1_68, uinp1_v4s1_68, selectBar_v4, select_v4 );
bdd_MUX unode_v3s14_69 ( uinp1_v4s1_68, uinp0_v3s14_69, uinp1_v3s14_69, selectBar_v3, select_v3 );
bdd_MUX unode_v3s9_100 ( uinp0_v4s1_68, uinp0_v3s9_100, uinp1_v3s9_100, selectBar_v3, select_v3 );
bdd_MUX unode_v6s11_70 ( uinp1_v3s14_69, uinp0_v6s11_70, uinp1_v6s11_70, selectBar_v6, select_v6 );
bdd_MUX unode_v6s10_85 ( uinp0_v3s14_69, uinp0_v6s10_85, uinp1_v6s10_85, selectBar_v6, select_v6 );
bdd_MUX unode_v0s11_1017 ( uinp1_v6s11_70, uinp0_v0s11_1017, uinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v0s2_986 ( uinp0_v6s11_70, uinp0_v0s2_986, uinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX unode_v2s2_d_1018 ( uinp1_v0s11_1017, INPUT0, INPUT0, selectBar_v2, select_v2 );
bdd_MUX unode_v2s2_1021 ( uinp0_v0s11_1017, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX unode_v2s1_1011 ( uinp1_v0s2_986, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX unode_v2s1_d_990 ( uinp0_v0s2_986, INPUT1, INPUT1, selectBar_v2, select_v2 );
bdd_MUX unode_v0s1_251 ( uinp1_v6s10_85, uinp1_v0s2_986, uinp1_v0s1_251, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_995 ( uinp0_v6s10_85, uinp0_v0s10_995, uinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v6s16_101 ( uinp1_v3s9_100, uinp0_v6s16_101, uinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s13_116 ( uinp0_v3s9_100, uinp0_v6s13_116, uinp1_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX unode_v0s6_868 ( uinp1_v6s16_101, uinp1_v0s2_986, uinp1_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_d_341 ( uinp0_v6s16_101, uinp_v0s6_341, uinp_v0s6_341, selectBar_v0, select_v0 );
bdd_MUX unode_v0s8_345 ( uinp_v0s6_341, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_635 ( uinp1_v6s13_116, uinp0_v0s9_635, uinp0_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_d_468 ( uinp0_v6s13_116, uinp1_v0s11_1017, uinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v4s8_195 ( uinp_R_131, uinp0_v4s8_195, uinp1_v4s8_195, selectBar_v4, select_v4 );
bdd_MUX unode_v3s5_196 ( uinp1_v4s8_195, uinp0_v3s5_196, uinp1_v3s5_196, selectBar_v3, select_v3 );
bdd_MUX unode_v3s15_227 ( uinp0_v4s8_195, uinp0_v3s15_227, uinp1_v3s15_227, selectBar_v3, select_v3 );
bdd_MUX unode_v6s1_197 ( uinp1_v3s5_196, uinp0_v6s1_197, uinp0_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX unode_v6s1_d_212 ( uinp0_v3s5_196, uinp_v6s1_212, uinp_v6s1_212, selectBar_v6, select_v6 );
bdd_MUX unode_v0s7_852 ( uinp1_v6s1_197, uinp0_v0s11_1017, uinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0_d_971 ( uinp_v6s1_212, uinp0_v0s2_986, uinp0_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX unode_v6s19_d_228 ( uinp1_v3s15_227, uinp_v6s19_228, uinp_v6s19_228, selectBar_v6, select_v6 );
bdd_MUX unode_v6s19_243 ( uinp0_v3s15_227, uinp1_v6s10_85, uinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s12_236 ( uinp_v6s19_228, uinp0_v6s12_236, uinp0_v0s2_986, selectBar_v6, select_v6 );
bdd_pre_top unode_R_259 ( uinp1_v1s3_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v1s3_258, uinp_R_386, pre );
bdd_MUX unode_v4s5_323 ( uinp_R_259, uinp0_v4s5_323, uinp1_v4s5_323, selectBar_v4, select_v4 );
bdd_MUX unode_v3s3_324 ( uinp1_v4s5_323, uinp0_v3s3_324, uinp1_v3s3_324, selectBar_v3, select_v3 );
bdd_MUX unode_v3s4_355 ( uinp0_v4s5_323, uinp0_v3s4_355, uinp1_v3s4_355, selectBar_v3, select_v3 );
bdd_MUX unode_v6s24_325 ( uinp1_v3s3_324, uinp0_v6s24_325, uinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s25_340 ( uinp0_v3s3_324, uinp0_v6s16_101, uinp1_v6s25_340, selectBar_v6, select_v6 );
bdd_MUX unode_v0s4_d_979 ( uinp1_v6s24_325, uinp_v0s4_979, uinp_v0s4_979, selectBar_v0, select_v0 );
bdd_MUX unode_v0s4_859 ( uinp0_v6s24_325, uinp1_v0s2_986, uinp0_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v0s12_983 ( uinp_v0s4_979, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX unode_v0s5_724 ( uinp0_v6s25_340, uinp0_v0s11_1017, uinp1_v0s5_724, selectBar_v0, select_v0 );
bdd_MUX unode_v6s6_d_356 ( uinp1_v3s4_355, uinp_v6s6_356, uinp_v6s6_356, selectBar_v6, select_v6 );
bdd_MUX unode_v6s6_371 ( uinp0_v3s4_355, uinp0_v6s6_371, uinp1_v6s6_371, selectBar_v6, select_v6 );
bdd_MUX unode_v6s21_364 ( uinp_v6s6_356, uinp0_v6s21_364, uinp1_v0s11_1017, selectBar_v6, select_v6 );
bdd_MUX unode_v0s3_d_1002 ( uinp1_v6s6_371, uinp0_v0s11_1017, uinp0_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v0s3_1010 ( uinp0_v6s6_371, uinp0_v0s3_1010, uinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX unode_v4s3_450 ( uinp_R_386, uinp0_v4s3_450, uinp1_v4s3_450, selectBar_v4, select_v4 );
bdd_MUX unode_v3s13_451 ( uinp1_v4s3_450, uinp0_v3s13_451, uinp1_v3s13_451, selectBar_v3, select_v3 );
bdd_MUX unode_v3s11_482 ( uinp0_v4s3_450, uinp0_v3s11_482, uinp1_v3s11_482, selectBar_v3, select_v3 );
bdd_MUX unode_v6s26_452 ( uinp1_v3s13_451, uinp1_v6s1_197, uinp1_v6s26_452, selectBar_v6, select_v6 );
bdd_MUX unode_v6s2_467 ( uinp0_v3s13_451, uinp0_v6s6_371, uinp1_v6s2_467, selectBar_v6, select_v6 );
bdd_MUX unode_v6s4_483 ( uinp1_v3s11_482, uinp0_v6s4_483, uinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s4_d_498 ( uinp0_v3s11_482, uinp0_v6s24_325, uinp0_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v0s6_d_762 ( uinp0_v6s4_483, uinp1_v0s2_986, uinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX unode_v1s4_514 ( uinp1_v5s2_513, uinp0_v1s4_514, uinp1_v1s4_514, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_769 ( uinp0_v5s2_513, uinp0_v1s1_769, uinp1_v1s1_769, selectBar_v1, select_v1 );
bdd_pre_top unode_R_515 ( uinp1_v1s4_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v1s4_514, uinp_R_642, pre );
bdd_MUX unode_v4s7_579 ( uinp_R_515, uinp0_v4s7_579, uinp1_v4s7_579, selectBar_v4, select_v4 );
bdd_MUX unode_v3s1_580 ( uinp1_v4s7_579, uinp0_v3s1_580, uinp1_v3s1_580, selectBar_v3, select_v3 );
bdd_MUX unode_v3s7_611 ( uinp0_v4s7_579, uinp0_v3s7_611, uinp1_v3s7_611, selectBar_v3, select_v3 );
bdd_MUX unode_v6s8_581 ( uinp1_v3s1_580, uinp0_v6s11_70, uinp1_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX unode_v6s8_d_596 ( uinp0_v3s1_580, uinp1_v6s24_325, uinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s9_d_612 ( uinp1_v3s7_611, uinp_v6s9_612, uinp_v6s9_612, selectBar_v6, select_v6 );
bdd_MUX unode_v6s9_627 ( uinp0_v3s7_611, uinp1_v6s13_116, uinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s5_620 ( uinp_v6s9_612, uinp1_v0s2_986, uinp0_v0s11_1017, selectBar_v6, select_v6 );
bdd_MUX unode_v4s2_706 ( uinp_R_642, uinp0_v4s2_706, uinp1_v4s2_706, selectBar_v4, select_v4 );
bdd_MUX unode_v3s10_707 ( uinp1_v4s2_706, uinp0_v3s10_707, uinp1_v3s10_707, selectBar_v3, select_v3 );
bdd_MUX unode_v3s16_738 ( uinp0_v4s2_706, uinp0_v3s16_738, uinp1_v3s16_738, selectBar_v3, select_v3 );
bdd_MUX unode_v6s20_867 ( uinp1_v3s10_707, uinp1_v6s11_70, uinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s7_723 ( uinp0_v3s10_707, uinp0_v6s7_723, uinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s15_739 ( uinp1_v3s16_738, uinp0_v6s15_739, uinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s15_d_754 ( uinp0_v3s16_738, uinp0_v6s4_483, uinp0_v6s4_483, selectBar_v6, select_v6 );
bdd_pre_top unode_R_770 ( uinp1_v1s1_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v1s1_769, uinp_R_897, pre );
bdd_MUX unode_v4s6_834 ( uinp_R_770, uinp0_v4s6_834, uinp1_v4s6_834, selectBar_v4, select_v4 );
bdd_MUX unode_v3s8_835 ( uinp1_v4s6_834, uinp0_v3s8_835, uinp1_v3s8_835, selectBar_v3, select_v3 );
bdd_MUX unode_v3s6_866 ( uinp0_v4s6_834, uinp0_v3s6_866, uinp1_v3s10_707, selectBar_v3, select_v3 );
bdd_MUX unode_v6s14_836 ( uinp1_v3s8_835, uinp1_v6s16_101, uinp0_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s3_851 ( uinp0_v3s8_835, uinp0_v6s24_325, uinp1_v6s1_197, selectBar_v6, select_v6 );
bdd_MUX unode_v6s20_d_882 ( uinp0_v3s6_866, uinp0_v6s10_85, uinp0_v6s10_85, selectBar_v6, select_v6 );
bdd_MUX unode_v4s4_961 ( uinp_R_897, uinp0_v4s4_961, uinp1_v4s4_961, selectBar_v4, select_v4 );
bdd_MUX unode_v3s12_962 ( uinp1_v4s4_961, uinp0_v3s12_962, uinp1_v3s12_962, selectBar_v3, select_v3 );
bdd_MUX unode_v3s2_993 ( uinp0_v4s4_961, uinp0_v3s2_993, uinp1_v3s2_993, selectBar_v3, select_v3 );
bdd_MUX unode_v6s23_963 ( uinp1_v3s12_962, uinp0_v6s23_963, uinp_v6s1_212, selectBar_v6, select_v6 );
bdd_MUX unode_v6s17_978 ( uinp0_v3s12_962, uinp0_v6s11_70, uinp1_v6s17_978, selectBar_v6, select_v6 );
bdd_MUX unode_v6s18_994 ( uinp1_v3s2_993, uinp0_v6s18_994, uinp1_v6s6_371, selectBar_v6, select_v6 );
bdd_MUX unode_v6s22_1009 ( uinp0_v3s2_993, uinp1_v6s11_70, uinp0_v6s6_371, selectBar_v6, select_v6 );


//Complemented BDD
bdd_MUX cnode_v7s1_1 ( cOUTPUT, cinp0_v7s1_1, cinp1_v7s1_1, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s1_2 ( cinp1_v7s1_1, cinp0_v5s1_2, cinp1_v5s1_2, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s2_513 ( cinp0_v7s1_1, cinp0_v5s2_513, cinp1_v5s2_513, selectBar_v5, select_v5 );
bdd_MUX cnode_v1s2_3 ( cinp1_v5s1_2, cinp0_v1s2_3, cinp1_v1s2_3, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s3_258 ( cinp0_v5s1_2, cinp0_v1s3_258, cinp1_v1s3_258, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_4 ( cinp1_v1s2_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v1s2_3, cinp_R_131, pre );
bdd_MUX cnode_v4s1_68 ( cinp_R_4, cinp0_v4s1_68, cinp1_v4s1_68, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s14_69 ( cinp1_v4s1_68, cinp0_v3s14_69, cinp1_v3s14_69, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s9_100 ( cinp0_v4s1_68, cinp0_v3s9_100, cinp1_v3s9_100, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s11_70 ( cinp1_v3s14_69, cinp0_v6s11_70, cinp1_v6s11_70, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s10_85 ( cinp0_v3s14_69, cinp0_v6s10_85, cinp1_v6s10_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s11_1017 ( cinp1_v6s11_70, cinp0_v0s11_1017, cinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s2_986 ( cinp0_v6s11_70, cinp0_v0s2_986, cinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s2_d_1018 ( cinp1_v0s11_1017, INPUT1, INPUT1, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s2_1021 ( cinp0_v0s11_1017, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s1_1011 ( cinp1_v0s2_986, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s1_d_990 ( cinp0_v0s2_986, INPUT0, INPUT0, selectBar_v2, select_v2 );
bdd_MUX cnode_v0s1_251 ( cinp1_v6s10_85, cinp1_v0s2_986, cinp1_v0s1_251, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_995 ( cinp0_v6s10_85, cinp0_v0s10_995, cinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s16_101 ( cinp1_v3s9_100, cinp0_v6s16_101, cinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s13_116 ( cinp0_v3s9_100, cinp0_v6s13_116, cinp1_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s6_868 ( cinp1_v6s16_101, cinp1_v0s2_986, cinp1_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_d_341 ( cinp0_v6s16_101, cinp_v0s6_341, cinp_v0s6_341, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s8_345 ( cinp_v0s6_341, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_635 ( cinp1_v6s13_116, cinp0_v0s9_635, cinp0_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_d_468 ( cinp0_v6s13_116, cinp1_v0s11_1017, cinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s8_195 ( cinp_R_131, cinp0_v4s8_195, cinp1_v4s8_195, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s5_196 ( cinp1_v4s8_195, cinp0_v3s5_196, cinp1_v3s5_196, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s15_227 ( cinp0_v4s8_195, cinp0_v3s15_227, cinp1_v3s15_227, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s1_197 ( cinp1_v3s5_196, cinp0_v6s1_197, cinp0_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s1_d_212 ( cinp0_v3s5_196, cinp_v6s1_212, cinp_v6s1_212, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s7_852 ( cinp1_v6s1_197, cinp0_v0s11_1017, cinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0_d_971 ( cinp_v6s1_212, cinp0_v0s2_986, cinp0_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s19_d_228 ( cinp1_v3s15_227, cinp_v6s19_228, cinp_v6s19_228, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s19_243 ( cinp0_v3s15_227, cinp1_v6s10_85, cinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s12_236 ( cinp_v6s19_228, cinp0_v6s12_236, cinp0_v0s2_986, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_259 ( cinp1_v1s3_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v1s3_258, cinp_R_386, pre );
bdd_MUX cnode_v4s5_323 ( cinp_R_259, cinp0_v4s5_323, cinp1_v4s5_323, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s3_324 ( cinp1_v4s5_323, cinp0_v3s3_324, cinp1_v3s3_324, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s4_355 ( cinp0_v4s5_323, cinp0_v3s4_355, cinp1_v3s4_355, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s24_325 ( cinp1_v3s3_324, cinp0_v6s24_325, cinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s25_340 ( cinp0_v3s3_324, cinp0_v6s16_101, cinp1_v6s25_340, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s4_d_979 ( cinp1_v6s24_325, cinp_v0s4_979, cinp_v0s4_979, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s4_859 ( cinp0_v6s24_325, cinp1_v0s2_986, cinp0_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s12_983 ( cinp_v0s4_979, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s5_724 ( cinp0_v6s25_340, cinp0_v0s11_1017, cinp1_v0s5_724, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s6_d_356 ( cinp1_v3s4_355, cinp_v6s6_356, cinp_v6s6_356, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s6_371 ( cinp0_v3s4_355, cinp0_v6s6_371, cinp1_v6s6_371, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s21_364 ( cinp_v6s6_356, cinp0_v6s21_364, cinp1_v0s11_1017, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s3_d_1002 ( cinp1_v6s6_371, cinp0_v0s11_1017, cinp0_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s3_1010 ( cinp0_v6s6_371, cinp0_v0s3_1010, cinp1_v0s11_1017, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s3_450 ( cinp_R_386, cinp0_v4s3_450, cinp1_v4s3_450, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s13_451 ( cinp1_v4s3_450, cinp0_v3s13_451, cinp1_v3s13_451, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s11_482 ( cinp0_v4s3_450, cinp0_v3s11_482, cinp1_v3s11_482, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s26_452 ( cinp1_v3s13_451, cinp1_v6s1_197, cinp1_v6s26_452, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s2_467 ( cinp0_v3s13_451, cinp0_v6s6_371, cinp1_v6s2_467, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s4_483 ( cinp1_v3s11_482, cinp0_v6s4_483, cinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s4_d_498 ( cinp0_v3s11_482, cinp0_v6s24_325, cinp0_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s6_d_762 ( cinp0_v6s4_483, cinp1_v0s2_986, cinp1_v0s2_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v1s4_514 ( cinp1_v5s2_513, cinp0_v1s4_514, cinp1_v1s4_514, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_769 ( cinp0_v5s2_513, cinp0_v1s1_769, cinp1_v1s1_769, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_515 ( cinp1_v1s4_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v1s4_514, cinp_R_642, pre );
bdd_MUX cnode_v4s7_579 ( cinp_R_515, cinp0_v4s7_579, cinp1_v4s7_579, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s1_580 ( cinp1_v4s7_579, cinp0_v3s1_580, cinp1_v3s1_580, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s7_611 ( cinp0_v4s7_579, cinp0_v3s7_611, cinp1_v3s7_611, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s8_581 ( cinp1_v3s1_580, cinp0_v6s11_70, cinp1_v6s13_116, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s8_d_596 ( cinp0_v3s1_580, cinp1_v6s24_325, cinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s9_d_612 ( cinp1_v3s7_611, cinp_v6s9_612, cinp_v6s9_612, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s9_627 ( cinp0_v3s7_611, cinp1_v6s13_116, cinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s5_620 ( cinp_v6s9_612, cinp1_v0s2_986, cinp0_v0s11_1017, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s2_706 ( cinp_R_642, cinp0_v4s2_706, cinp1_v4s2_706, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s10_707 ( cinp1_v4s2_706, cinp0_v3s10_707, cinp1_v3s10_707, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s16_738 ( cinp0_v4s2_706, cinp0_v3s16_738, cinp1_v3s16_738, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s20_867 ( cinp1_v3s10_707, cinp1_v6s11_70, cinp1_v6s16_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s7_723 ( cinp0_v3s10_707, cinp0_v6s7_723, cinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s15_739 ( cinp1_v3s16_738, cinp0_v6s15_739, cinp1_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s15_d_754 ( cinp0_v3s16_738, cinp0_v6s4_483, cinp0_v6s4_483, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_770 ( cinp1_v1s1_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v1s1_769, cinp_R_897, pre );
bdd_MUX cnode_v4s6_834 ( cinp_R_770, cinp0_v4s6_834, cinp1_v4s6_834, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s8_835 ( cinp1_v4s6_834, cinp0_v3s8_835, cinp1_v3s8_835, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s6_866 ( cinp0_v4s6_834, cinp0_v3s6_866, cinp1_v3s10_707, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s14_836 ( cinp1_v3s8_835, cinp1_v6s16_101, cinp0_v6s24_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s3_851 ( cinp0_v3s8_835, cinp0_v6s24_325, cinp1_v6s1_197, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s20_d_882 ( cinp0_v3s6_866, cinp0_v6s10_85, cinp0_v6s10_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s4_961 ( cinp_R_897, cinp0_v4s4_961, cinp1_v4s4_961, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s12_962 ( cinp1_v4s4_961, cinp0_v3s12_962, cinp1_v3s12_962, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s2_993 ( cinp0_v4s4_961, cinp0_v3s2_993, cinp1_v3s2_993, selectBar_v3, select_v3 );
bdd_MUX cnode_v6s23_963 ( cinp1_v3s12_962, cinp0_v6s23_963, cinp_v6s1_212, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s17_978 ( cinp0_v3s12_962, cinp0_v6s11_70, cinp1_v6s17_978, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s18_994 ( cinp1_v3s2_993, cinp0_v6s18_994, cinp1_v6s6_371, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s22_1009 ( cinp0_v3s2_993, cinp1_v6s11_70, cinp0_v6s6_371, selectBar_v6, select_v6 );

endmodule
