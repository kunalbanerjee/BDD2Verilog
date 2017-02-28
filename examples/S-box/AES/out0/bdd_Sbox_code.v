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
bdd_MUX unode_v0_1 ( uOUTPUT, uinp0_v0_1, uinp1_v0_1, selectBar_v0, select_v0 );
bdd_MUX unode_v4s1_2 ( uinp1_v0_1, uinp0_v4s1_2, uinp1_v4s1_2, selectBar_v4, select_v4 );
bdd_MUX unode_v4s2_513 ( uinp0_v0_1, uinp0_v4s2_513, uinp1_v4s2_513, selectBar_v4, select_v4 );
bdd_MUX unode_v1s4_3 ( uinp1_v4s1_2, uinp0_v1s4_3, uinp1_v1s4_3, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_258 ( uinp0_v4s1_2, uinp0_v1s2_258, uinp1_v1s2_258, selectBar_v1, select_v1 );
bdd_pre_top unode_R_4 ( uinp1_v1s4_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v1s4_3, uinp_R_131, pre );
bdd_MUX unode_v2s3_68 ( uinp_R_4, uinp0_v2s3_68, uinp1_v2s3_68, selectBar_v2, select_v2 );
bdd_MUX unode_v5s12_69 ( uinp1_v2s3_68, uinp0_v5s12_69, uinp1_v5s12_69, selectBar_v5, select_v5 );
bdd_MUX unode_v5s7_100 ( uinp0_v2s3_68, uinp0_v5s7_100, uinp1_v5s7_100, selectBar_v5, select_v5 );
bdd_MUX unode_v6s15_70 ( uinp1_v5s12_69, uinp0_v6s15_70, uinp1_v6s15_70, selectBar_v6, select_v6 );
bdd_MUX unode_v6s12_85 ( uinp0_v5s12_69, uinp0_v6s12_85, uinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX unode_v7s5_1010 ( uinp1_v6s15_70, uinp0_v7s5_1010, uinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX unode_v7s1_747 ( uinp0_v6s15_70, uinp0_v7s1_747, uinp1_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX unode_v3s2_d_1011 ( uinp1_v7s5_1010, INPUT0, INPUT0, selectBar_v3, select_v3 );
bdd_MUX unode_v3s2_1021 ( uinp0_v7s5_1010, INPUT1, INPUT0, selectBar_v3, select_v3 );
bdd_MUX unode_v3s1_999 ( uinp0_v7s1_747, INPUT0, INPUT1, selectBar_v3, select_v3 );
bdd_MUX unode_v7s4_d_875 ( uinp1_v6s12_85, uinp_v7s4_875, uinp_v7s4_875, selectBar_v7, select_v7 );
bdd_MUX unode_v7s4_868 ( uinp0_v6s12_85, uinp0_v7s4_868, uinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX unode_v7s12_879 ( uinp_v7s4_875, INPUT1, INPUT0, selectBar_v7, select_v7 );
bdd_MUX unode_v6s17_d_101 ( uinp1_v5s7_100, uinp_v6s17_101, uinp_v6s17_101, selectBar_v6, select_v6 );
bdd_MUX unode_v6s17_116 ( uinp0_v5s7_100, uinp0_v6s17_116, uinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX unode_v6s18_109 ( uinp_v6s17_101, uinp0_v7s5_1010, uinp1_v6s18_109, selectBar_v6, select_v6 );
bdd_MUX unode_v3s2_d_996 ( uinp1_v6s18_109, INPUT1, INPUT1, selectBar_v3, select_v3 );
bdd_MUX unode_v7s3_979 ( uinp1_v6s17_116, uinp0_v7s3_979, uinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX unode_v2s5_195 ( uinp_R_131, uinp0_v2s5_195, uinp1_v2s5_195, selectBar_v2, select_v2 );
bdd_MUX unode_v5s15_196 ( uinp1_v2s5_195, uinp0_v5s15_196, uinp1_v5s15_196, selectBar_v5, select_v5 );
bdd_MUX unode_v5s9_227 ( uinp0_v2s5_195, uinp0_v5s9_227, uinp1_v5s9_227, selectBar_v5, select_v5 );
bdd_MUX unode_v6s14_197 ( uinp1_v5s15_196, uinp0_v6s15_70, uinp1_v6s14_197, selectBar_v6, select_v6 );
bdd_MUX unode_v6s23_212 ( uinp0_v5s15_196, uinp1_v6s15_70, uinp1_v6s23_212, selectBar_v6, select_v6 );
bdd_MUX unode_v7s5_d_213 ( uinp1_v6s23_212, uinp_v7s5_213, uinp_v7s5_213, selectBar_v7, select_v7 );
bdd_MUX unode_v7s2_636 ( uinp_v7s5_213, INPUT0, INPUT1, selectBar_v7, select_v7 );
bdd_MUX unode_v6s24_228 ( uinp1_v5s9_227, uinp1_v6s15_70, uinp1_v6s24_228, selectBar_v6, select_v6 );
bdd_MUX unode_v6s26_978 ( uinp0_v5s9_227, uinp0_v6s26_978, uinp1_v6s17_116, selectBar_v6, select_v6 );
bdd_MUX unode_v7s9_453 ( uinp1_v6s24_228, uinp0_v7s5_1010, uinp1_v7s9_453, selectBar_v7, select_v7 );
bdd_MUX unode_v7s8_986 ( uinp0_v6s26_978, uinp0_v7s8_986, uinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_pre_top unode_R_259 ( uinp1_v1s2_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v1s2_258, uinp_R_386, pre );
bdd_MUX unode_v2s7_323 ( uinp_R_259, uinp0_v2s7_323, uinp1_v2s7_323, selectBar_v2, select_v2 );
bdd_MUX unode_v5s8_324 ( uinp1_v2s7_323, uinp0_v5s8_324, uinp1_v5s8_324, selectBar_v5, select_v5 );
bdd_MUX unode_v5s5_355 ( uinp0_v2s7_323, uinp0_v5s5_355, uinp1_v5s5_355, selectBar_v5, select_v5 );
bdd_MUX unode_v6s1_325 ( uinp1_v5s8_324, uinp0_v6s1_325, uinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s3_340 ( uinp0_v5s8_324, uinp1_v6s24_228, uinp1_v6s3_340, selectBar_v6, select_v6 );
bdd_MUX unode_v7s10_755 ( uinp1_v6s1_325, uinp0_v7s5_1010, uinp0_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX unode_v7s10_d_852 ( uinp0_v6s1_325, uinp0_v7s1_747, uinp0_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX unode_v7s9_d_731 ( uinp1_v6s3_340, uinp1_v7s5_1010, uinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX unode_v6s16_356 ( uinp1_v5s5_355, uinp0_v6s16_356, uinp1_v6s16_356, selectBar_v6, select_v6 );
bdd_MUX unode_v6s21_851 ( uinp0_v5s5_355, uinp1_v6s17_116, uinp1_v6s21_851, selectBar_v6, select_v6 );
bdd_MUX unode_v7s7_d_357 ( uinp1_v6s16_356, uinp1_v6s18_109, uinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX unode_v7s7_762 ( uinp0_v6s16_356, uinp0_v7s1_747, uinp1_v7s7_762, selectBar_v7, select_v7 );
bdd_MUX unode_v2s2_450 ( uinp_R_386, uinp0_v2s2_450, uinp1_v2s2_450, selectBar_v2, select_v2 );
bdd_MUX unode_v5s14_451 ( uinp1_v2s2_450, uinp0_v5s14_451, uinp1_v5s14_451, selectBar_v5, select_v5 );
bdd_MUX unode_v5s4_482 ( uinp0_v2s2_450, uinp0_v5s4_482, uinp1_v5s4_482, selectBar_v5, select_v5 );
bdd_MUX unode_v6s11_452 ( uinp1_v5s14_451, uinp1_v6s1_325, uinp1_v6s24_228, selectBar_v6, select_v6 );
bdd_MUX unode_v6s11_d_467 ( uinp0_v5s14_451, uinp_v6s11_467, uinp_v6s11_467, selectBar_v6, select_v6 );
bdd_MUX unode_v6s8_475 ( uinp_v6s11_467, uinp0_v6s8_475, uinp1_v6s18_109, selectBar_v6, select_v6 );
bdd_MUX unode_v6s5_483 ( uinp1_v5s4_482, uinp1_v6s17_116, uinp1_v6s5_483, selectBar_v6, select_v6 );
bdd_MUX unode_v6s19_498 ( uinp0_v5s4_482, uinp0_v6s19_498, uinp0_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX unode_v1s3_514 ( uinp1_v4s2_513, uinp0_v1s3_514, uinp1_v1s3_514, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_769 ( uinp0_v4s2_513, uinp0_v1s1_769, uinp1_v1s1_769, selectBar_v1, select_v1 );
bdd_pre_top unode_R_515 ( uinp1_v1s3_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v1s3_514, uinp_R_642, pre );
bdd_MUX unode_v2s6_579 ( uinp_R_515, uinp0_v2s6_579, uinp1_v2s6_579, selectBar_v2, select_v2 );
bdd_MUX unode_v5s11_580 ( uinp1_v2s6_579, uinp0_v5s11_580, uinp1_v5s11_580, selectBar_v5, select_v5 );
bdd_MUX unode_v5s11_d_611 ( uinp0_v2s6_579, uinp_v5s11_611, uinp_v5s11_611, selectBar_v5, select_v5 );
bdd_MUX unode_v6s13_581 ( uinp1_v5s11_580, uinp1_v6s15_70, uinp1_v6s13_581, selectBar_v6, select_v6 );
bdd_MUX unode_v6s13_d_596 ( uinp0_v5s11_580, uinp1_v6s1_325, uinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6_d_627 ( uinp_v5s11_611, uinp_v6_627, uinp_v6_627, selectBar_v6, select_v6 );
bdd_MUX unode_v6s4_635 ( uinp_v6_627, uinp0_v7s5_1010, uinp_v7s5_213, selectBar_v6, select_v6 );
bdd_MUX unode_v2s4_706 ( uinp_R_642, uinp0_v2s4_706, uinp1_v2s4_706, selectBar_v2, select_v2 );
bdd_MUX unode_v5s3_707 ( uinp1_v2s4_706, uinp0_v5s3_707, uinp1_v5s3_707, selectBar_v5, select_v5 );
bdd_MUX unode_v5s10_738 ( uinp0_v2s4_706, uinp0_v5s10_738, uinp1_v5s10_738, selectBar_v5, select_v5 );
bdd_MUX unode_v6s9_708 ( uinp1_v5s3_707, uinp0_v6s9_708, uinp0_v6s26_978, selectBar_v6, select_v6 );
bdd_MUX unode_v6s9_d_723 ( uinp0_v5s3_707, uinp1_v6s3_340, uinp1_v6s3_340, selectBar_v6, select_v6 );
bdd_MUX unode_v7s11_995 ( uinp0_v6s9_708, uinp0_v7s1_747, uinp1_v7s11_995, selectBar_v7, select_v7 );
bdd_MUX unode_v6s2_739 ( uinp1_v5s10_738, uinp0_v6s15_70, uinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX unode_v6s20_754 ( uinp0_v5s10_738, uinp0_v6s16_356, uinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_pre_top unode_R_770 ( uinp1_v1s1_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v1s1_769, uinp_R_897, pre );
bdd_MUX unode_v2s8_834 ( uinp_R_770, uinp0_v2s8_834, uinp1_v2s8_834, selectBar_v2, select_v2 );
bdd_MUX unode_v5s1_835 ( uinp1_v2s8_834, uinp0_v5s5_355, uinp1_v5s1_835, selectBar_v5, select_v5 );
bdd_MUX unode_v5s13_866 ( uinp0_v2s8_834, uinp0_v5s13_866, uinp1_v5s13_866, selectBar_v5, select_v5 );
bdd_MUX unode_v6s21_d_836 ( uinp1_v5s1_835, uinp1_v6s12_85, uinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX unode_v6s7_867 ( uinp1_v5s13_866, uinp0_v6s7_867, uinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX unode_v6s25_882 ( uinp0_v5s13_866, uinp0_v6s25_882, uinp0_v6s26_978, selectBar_v6, select_v6 );
bdd_MUX unode_v7s6_890 ( uinp0_v6s25_882, uinp0_v7s6_890, uinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX unode_v2s1_961 ( uinp_R_897, uinp0_v2s1_961, uinp1_v2s1_961, selectBar_v2, select_v2 );
bdd_MUX unode_v5s6_962 ( uinp1_v2s1_961, uinp0_v5s9_227, uinp1_v5s6_962, selectBar_v5, select_v5 );
bdd_MUX unode_v5s2_993 ( uinp0_v2s1_961, uinp0_v5s2_993, uinp1_v5s2_993, selectBar_v5, select_v5 );
bdd_MUX unode_v6s10_963 ( uinp1_v5s6_962, uinp0_v6s9_708, uinp1_v6s10_963, selectBar_v6, select_v6 );
bdd_MUX unode_v7s11_d_1017 ( uinp1_v6s10_963, uinp0_v7s5_1010, uinp0_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX unode_v6s22_994 ( uinp1_v5s2_993, uinp1_v6s15_70, uinp0_v6s9_708, selectBar_v6, select_v6 );
bdd_MUX unode_v6s6_1009 ( uinp0_v5s2_993, uinp0_v6s6_1009, uinp1_v6s10_963, selectBar_v6, select_v6 );


//Complemented BDD
bdd_MUX cnode_v0_1 ( cOUTPUT, cinp0_v0_1, cinp1_v0_1, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s1_2 ( cinp1_v0_1, cinp0_v4s1_2, cinp1_v4s1_2, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s2_513 ( cinp0_v0_1, cinp0_v4s2_513, cinp1_v4s2_513, selectBar_v4, select_v4 );
bdd_MUX cnode_v1s4_3 ( cinp1_v4s1_2, cinp0_v1s4_3, cinp1_v1s4_3, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_258 ( cinp0_v4s1_2, cinp0_v1s2_258, cinp1_v1s2_258, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_4 ( cinp1_v1s4_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v1s4_3, cinp_R_131, pre );
bdd_MUX cnode_v2s3_68 ( cinp_R_4, cinp0_v2s3_68, cinp1_v2s3_68, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s12_69 ( cinp1_v2s3_68, cinp0_v5s12_69, cinp1_v5s12_69, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s7_100 ( cinp0_v2s3_68, cinp0_v5s7_100, cinp1_v5s7_100, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s15_70 ( cinp1_v5s12_69, cinp0_v6s15_70, cinp1_v6s15_70, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s12_85 ( cinp0_v5s12_69, cinp0_v6s12_85, cinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s5_1010 ( cinp1_v6s15_70, cinp0_v7s5_1010, cinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s1_747 ( cinp0_v6s15_70, cinp0_v7s1_747, cinp1_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX cnode_v3s2_d_1011 ( cinp1_v7s5_1010, INPUT1, INPUT1, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s2_1021 ( cinp0_v7s5_1010, INPUT0, INPUT1, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s1_999 ( cinp0_v7s1_747, INPUT1, INPUT0, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s4_d_875 ( cinp1_v6s12_85, cinp_v7s4_875, cinp_v7s4_875, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s4_868 ( cinp0_v6s12_85, cinp0_v7s4_868, cinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s12_879 ( cinp_v7s4_875, INPUT0, INPUT1, selectBar_v7, select_v7 );
bdd_MUX cnode_v6s17_d_101 ( cinp1_v5s7_100, cinp_v6s17_101, cinp_v6s17_101, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s17_116 ( cinp0_v5s7_100, cinp0_v6s17_116, cinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s18_109 ( cinp_v6s17_101, cinp0_v7s5_1010, cinp1_v6s18_109, selectBar_v6, select_v6 );
bdd_MUX cnode_v3s2_d_996 ( cinp1_v6s18_109, INPUT0, INPUT0, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s3_979 ( cinp1_v6s17_116, cinp0_v7s3_979, cinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX cnode_v2s5_195 ( cinp_R_131, cinp0_v2s5_195, cinp1_v2s5_195, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s15_196 ( cinp1_v2s5_195, cinp0_v5s15_196, cinp1_v5s15_196, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s9_227 ( cinp0_v2s5_195, cinp0_v5s9_227, cinp1_v5s9_227, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s14_197 ( cinp1_v5s15_196, cinp0_v6s15_70, cinp1_v6s14_197, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s23_212 ( cinp0_v5s15_196, cinp1_v6s15_70, cinp1_v6s23_212, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s5_d_213 ( cinp1_v6s23_212, cinp_v7s5_213, cinp_v7s5_213, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s2_636 ( cinp_v7s5_213, INPUT1, INPUT0, selectBar_v7, select_v7 );
bdd_MUX cnode_v6s24_228 ( cinp1_v5s9_227, cinp1_v6s15_70, cinp1_v6s24_228, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s26_978 ( cinp0_v5s9_227, cinp0_v6s26_978, cinp1_v6s17_116, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s9_453 ( cinp1_v6s24_228, cinp0_v7s5_1010, cinp1_v7s9_453, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s8_986 ( cinp0_v6s26_978, cinp0_v7s8_986, cinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_pre_top cnode_R_259 ( cinp1_v1s2_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v1s2_258, cinp_R_386, pre );
bdd_MUX cnode_v2s7_323 ( cinp_R_259, cinp0_v2s7_323, cinp1_v2s7_323, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s8_324 ( cinp1_v2s7_323, cinp0_v5s8_324, cinp1_v5s8_324, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s5_355 ( cinp0_v2s7_323, cinp0_v5s5_355, cinp1_v5s5_355, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s1_325 ( cinp1_v5s8_324, cinp0_v6s1_325, cinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s3_340 ( cinp0_v5s8_324, cinp1_v6s24_228, cinp1_v6s3_340, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s10_755 ( cinp1_v6s1_325, cinp0_v7s5_1010, cinp0_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s10_d_852 ( cinp0_v6s1_325, cinp0_v7s1_747, cinp0_v7s1_747, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s9_d_731 ( cinp1_v6s3_340, cinp1_v7s5_1010, cinp1_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX cnode_v6s16_356 ( cinp1_v5s5_355, cinp0_v6s16_356, cinp1_v6s16_356, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s21_851 ( cinp0_v5s5_355, cinp1_v6s17_116, cinp1_v6s21_851, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s7_d_357 ( cinp1_v6s16_356, cinp1_v6s18_109, cinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s7_762 ( cinp0_v6s16_356, cinp0_v7s1_747, cinp1_v7s7_762, selectBar_v7, select_v7 );
bdd_MUX cnode_v2s2_450 ( cinp_R_386, cinp0_v2s2_450, cinp1_v2s2_450, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s14_451 ( cinp1_v2s2_450, cinp0_v5s14_451, cinp1_v5s14_451, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s4_482 ( cinp0_v2s2_450, cinp0_v5s4_482, cinp1_v5s4_482, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s11_452 ( cinp1_v5s14_451, cinp1_v6s1_325, cinp1_v6s24_228, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s11_d_467 ( cinp0_v5s14_451, cinp_v6s11_467, cinp_v6s11_467, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s8_475 ( cinp_v6s11_467, cinp0_v6s8_475, cinp1_v6s18_109, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s5_483 ( cinp1_v5s4_482, cinp1_v6s17_116, cinp1_v6s5_483, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s19_498 ( cinp0_v5s4_482, cinp0_v6s19_498, cinp0_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v1s3_514 ( cinp1_v4s2_513, cinp0_v1s3_514, cinp1_v1s3_514, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_769 ( cinp0_v4s2_513, cinp0_v1s1_769, cinp1_v1s1_769, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_515 ( cinp1_v1s3_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v1s3_514, cinp_R_642, pre );
bdd_MUX cnode_v2s6_579 ( cinp_R_515, cinp0_v2s6_579, cinp1_v2s6_579, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s11_580 ( cinp1_v2s6_579, cinp0_v5s11_580, cinp1_v5s11_580, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s11_d_611 ( cinp0_v2s6_579, cinp_v5s11_611, cinp_v5s11_611, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s13_581 ( cinp1_v5s11_580, cinp1_v6s15_70, cinp1_v6s13_581, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s13_d_596 ( cinp0_v5s11_580, cinp1_v6s1_325, cinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6_d_627 ( cinp_v5s11_611, cinp_v6_627, cinp_v6_627, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s4_635 ( cinp_v6_627, cinp0_v7s5_1010, cinp_v7s5_213, selectBar_v6, select_v6 );
bdd_MUX cnode_v2s4_706 ( cinp_R_642, cinp0_v2s4_706, cinp1_v2s4_706, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s3_707 ( cinp1_v2s4_706, cinp0_v5s3_707, cinp1_v5s3_707, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s10_738 ( cinp0_v2s4_706, cinp0_v5s10_738, cinp1_v5s10_738, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s9_708 ( cinp1_v5s3_707, cinp0_v6s9_708, cinp0_v6s26_978, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s9_d_723 ( cinp0_v5s3_707, cinp1_v6s3_340, cinp1_v6s3_340, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s11_995 ( cinp0_v6s9_708, cinp0_v7s1_747, cinp1_v7s11_995, selectBar_v7, select_v7 );
bdd_MUX cnode_v6s2_739 ( cinp1_v5s10_738, cinp0_v6s15_70, cinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s20_754 ( cinp0_v5s10_738, cinp0_v6s16_356, cinp1_v6s1_325, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_770 ( cinp1_v1s1_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v1s1_769, cinp_R_897, pre );
bdd_MUX cnode_v2s8_834 ( cinp_R_770, cinp0_v2s8_834, cinp1_v2s8_834, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s1_835 ( cinp1_v2s8_834, cinp0_v5s5_355, cinp1_v5s1_835, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s13_866 ( cinp0_v2s8_834, cinp0_v5s13_866, cinp1_v5s13_866, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s21_d_836 ( cinp1_v5s1_835, cinp1_v6s12_85, cinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s7_867 ( cinp1_v5s13_866, cinp0_v6s7_867, cinp1_v6s12_85, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s25_882 ( cinp0_v5s13_866, cinp0_v6s25_882, cinp0_v6s26_978, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s6_890 ( cinp0_v6s25_882, cinp0_v7s6_890, cinp1_v6s18_109, selectBar_v7, select_v7 );
bdd_MUX cnode_v2s1_961 ( cinp_R_897, cinp0_v2s1_961, cinp1_v2s1_961, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s6_962 ( cinp1_v2s1_961, cinp0_v5s9_227, cinp1_v5s6_962, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s2_993 ( cinp0_v2s1_961, cinp0_v5s2_993, cinp1_v5s2_993, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s10_963 ( cinp1_v5s6_962, cinp0_v6s9_708, cinp1_v6s10_963, selectBar_v6, select_v6 );
bdd_MUX cnode_v7s11_d_1017 ( cinp1_v6s10_963, cinp0_v7s5_1010, cinp0_v7s5_1010, selectBar_v7, select_v7 );
bdd_MUX cnode_v6s22_994 ( cinp1_v5s2_993, cinp1_v6s15_70, cinp0_v6s9_708, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s6_1009 ( cinp0_v5s2_993, cinp0_v6s6_1009, cinp1_v6s10_963, selectBar_v6, select_v6 );

endmodule
