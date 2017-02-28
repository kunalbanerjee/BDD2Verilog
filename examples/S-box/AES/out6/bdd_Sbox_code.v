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
bdd_MUX unode_v5s1_1 ( uOUTPUT, uinp0_v5s1_1, uinp1_v5s1_1, selectBar_v5, select_v5 );
bdd_MUX unode_v1s2_2 ( uinp1_v5s1_1, uinp0_v1s2_2, uinp1_v1s2_2, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_513 ( uinp0_v5s1_1, uinp0_v1s1_513, uinp1_v1s1_513, selectBar_v1, select_v1 );
bdd_MUX unode_v4s2_3 ( uinp1_v1s2_2, uinp0_v4s2_3, uinp1_v4s2_3, selectBar_v4, select_v4 );
bdd_MUX unode_v4s4_258 ( uinp0_v1s2_2, uinp0_v4s4_258, uinp1_v4s4_258, selectBar_v4, select_v4 );
bdd_pre_top unode_R_4 ( uinp1_v4s2_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v4s2_3, uinp_R_131, pre );
bdd_MUX unode_v3s8_68 ( uinp_R_4, uinp0_v3s8_68, uinp1_v3s8_68, selectBar_v3, select_v3 );
bdd_MUX unode_v7s3_69 ( uinp1_v3s8_68, uinp0_v7s3_69, uinp1_v7s3_69, selectBar_v7, select_v7 );
bdd_MUX unode_v7s4_100 ( uinp0_v3s8_68, uinp0_v7s4_100, uinp1_v7s4_100, selectBar_v7, select_v7 );
bdd_MUX unode_v0s25_d_70 ( uinp1_v7s3_69, uinp_v0s25_70, uinp_v0s25_70, selectBar_v0, select_v0 );
bdd_MUX unode_v0s25_85 ( uinp0_v7s3_69, uinp0_v0s25_85, uinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX unode_v2s10_372 ( uinp_v0s25_70, uinp0_v2s10_372, uinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX unode_v6s1_d_996 ( uinp1_v2s10_372, INPUT0, INPUT0, selectBar_v6, select_v6 );
bdd_MUX unode_v6s1_1021 ( uinp0_v2s10_372, INPUT1, INPUT0, selectBar_v6, select_v6 );
bdd_MUX unode_v2s3_1010 ( uinp1_v0s25_85, uinp0_v2s10_372, uinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX unode_v2s3_d_859 ( uinp0_v0s25_85, uinp_v2s3_859, uinp_v2s3_859, selectBar_v2, select_v2 );
bdd_MUX unode_v6s1_d_1011 ( uinp1_v2s3_1010, INPUT1, INPUT1, selectBar_v6, select_v6 );
bdd_MUX unode_v6s2_999 ( uinp_v2s3_859, INPUT0, INPUT1, selectBar_v6, select_v6 );
bdd_MUX unode_v0s14_101 ( uinp1_v7s4_100, uinp0_v0s14_101, uinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_116 ( uinp0_v7s4_100, uinp0_v0s9_116, uinp1_v0s9_116, selectBar_v0, select_v0 );
bdd_MUX unode_v2s12_740 ( uinp1_v0s14_101, uinp0_v2s10_372, uinp_v2s3_859, selectBar_v2, select_v2 );
bdd_MUX unode_v2s12_d_979 ( uinp0_v0s14_101, uinp_v2s12_979, uinp_v2s12_979, selectBar_v2, select_v2 );
bdd_MUX unode_v2s7_983 ( uinp_v2s12_979, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX unode_v2s1_995 ( uinp0_v0s9_116, uinp_v2s3_859, uinp1_v2s1_995, selectBar_v2, select_v2 );
bdd_MUX unode_v3s7_195 ( uinp_R_131, uinp0_v3s7_195, uinp1_v3s7_195, selectBar_v3, select_v3 );
bdd_MUX unode_v7s15_196 ( uinp1_v3s7_195, uinp0_v7s15_196, uinp1_v7s15_196, selectBar_v7, select_v7 );
bdd_MUX unode_v7s13_227 ( uinp0_v3s7_195, uinp0_v7s13_227, uinp1_v7s13_227, selectBar_v7, select_v7 );
bdd_MUX unode_v0s2_197 ( uinp1_v7s15_196, uinp0_v0s2_197, uinp1_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX unode_v0s13_212 ( uinp0_v7s15_196, uinp_v0s25_70, uinp1_v0s13_212, selectBar_v0, select_v0 );
bdd_MUX unode_v2s11_d_971 ( uinp1_v0s2_197, uinp1_v2s3_1010, uinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX unode_v2s11_747 ( uinp0_v0s2_197, uinp0_v2s11_747, uinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX unode_v2s10_d_731 ( uinp1_v0s13_212, uinp_v2s10_731, uinp_v2s10_731, selectBar_v2, select_v2 );
bdd_MUX unode_v2s2_735 ( uinp_v2s10_731, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX unode_v0s5_228 ( uinp1_v7s13_227, uinp0_v0s5_228, uinp0_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX unode_v0s24_243 ( uinp0_v7s13_227, uinp0_v0s2_197, uinp1_v0s24_243, selectBar_v0, select_v0 );
bdd_MUX unode_v2s11_d_868 ( uinp0_v0s5_228, uinp1_v2s10_372, uinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX unode_v2s8_986 ( uinp1_v0s24_243, uinp_v2s3_859, uinp0_v2s10_372, selectBar_v2, select_v2 );
bdd_pre_top unode_R_259 ( uinp1_v4s4_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v4s4_258, uinp_R_386, pre );
bdd_MUX unode_v3s2_323 ( uinp_R_259, uinp0_v3s2_323, uinp1_v3s2_323, selectBar_v3, select_v3 );
bdd_MUX unode_v7s5_324 ( uinp1_v3s2_323, uinp0_v7s5_324, uinp1_v7s5_324, selectBar_v7, select_v7 );
bdd_MUX unode_v7s10_355 ( uinp0_v3s2_323, uinp0_v7s10_355, uinp1_v7s10_355, selectBar_v7, select_v7 );
bdd_MUX unode_v0s8_836 ( uinp1_v7s5_324, uinp0_v0s8_836, uinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX unode_v0s12_340 ( uinp0_v7s5_324, uinp0_v0s2_197, uinp1_v0s12_340, selectBar_v0, select_v0 );
bdd_MUX unode_v2s9_890 ( uinp0_v0s8_836, uinp0_v2s9_890, uinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX unode_v2s5_341 ( uinp1_v0s12_340, uinp0_v2s5_341, uinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX unode_v0s26_356 ( uinp1_v7s10_355, uinp_v0s25_70, uinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX unode_v0s22_371 ( uinp0_v7s10_355, uinp0_v0s9_116, uinp_v0s25_70, selectBar_v0, select_v0 );
bdd_MUX unode_v3s3_450 ( uinp_R_386, uinp0_v3s3_450, uinp1_v3s3_450, selectBar_v3, select_v3 );
bdd_MUX unode_v7s2_451 ( uinp1_v3s3_450, uinp0_v7s2_451, uinp1_v7s2_451, selectBar_v7, select_v7 );
bdd_MUX unode_v7s14_482 ( uinp0_v3s3_450, uinp0_v7s14_482, uinp1_v7s14_482, selectBar_v7, select_v7 );
bdd_MUX unode_v0s4_d_452 ( uinp1_v7s2_451, uinp1_v0s14_101, uinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX unode_v0s4_467 ( uinp0_v7s2_451, uinp0_v0s4_467, uinp1_v0s24_243, selectBar_v0, select_v0 );
bdd_MUX unode_v2s6_883 ( uinp0_v0s4_467, uinp_v2s3_859, uinp1_v2s6_883, selectBar_v2, select_v2 );
bdd_MUX unode_v0s23_d_483 ( uinp1_v7s14_482, uinp_v0s23_483, uinp_v0s23_483, selectBar_v0, select_v0 );
bdd_MUX unode_v0s23_851 ( uinp0_v7s14_482, uinp0_v0s23_851, uinp0_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX unode_v0s7_491 ( uinp_v0s23_483, uinp0_v0s7_491, uinp1_v2s3_1010, selectBar_v0, select_v0 );
bdd_MUX unode_v2s4_875 ( uinp1_v0s23_851, uinp0_v2s4_875, uinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX unode_v4s1_514 ( uinp1_v1s1_513, uinp0_v4s1_514, uinp1_v4s1_514, selectBar_v4, select_v4 );
bdd_MUX unode_v4s3_769 ( uinp0_v1s1_513, uinp0_v4s3_769, uinp1_v4s3_769, selectBar_v4, select_v4 );
bdd_pre_top unode_R_515 ( uinp1_v4s1_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v4s1_514, uinp_R_642, pre );
bdd_MUX unode_v3s1_579 ( uinp_R_515, uinp0_v3s1_579, uinp1_v3s1_579, selectBar_v3, select_v3 );
bdd_MUX unode_v7s6_580 ( uinp1_v3s1_579, uinp0_v7s6_580, uinp1_v7s6_580, selectBar_v7, select_v7 );
bdd_MUX unode_v7s11_611 ( uinp0_v3s1_579, uinp0_v7s11_611, uinp1_v7s11_611, selectBar_v7, select_v7 );
bdd_MUX unode_v0s19_581 ( uinp1_v7s6_580, uinp0_v0s9_116, uinp0_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX unode_v0s19_d_596 ( uinp0_v7s6_580, uinp0_v0s14_101, uinp0_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_612 ( uinp1_v7s11_611, uinp1_v0s14_101, uinp1_v0s11_612, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_d_627 ( uinp0_v7s11_611, uinp_v0s11_627, uinp_v0s11_627, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_635 ( uinp_v0s11_627, uinp0_v2s10_372, uinp1_v0s6_635, selectBar_v0, select_v0 );
bdd_MUX unode_v3s5_706 ( uinp_R_642, uinp0_v3s5_706, uinp1_v3s5_706, selectBar_v3, select_v3 );
bdd_MUX unode_v7s7_d_707 ( uinp1_v3s5_706, uinp_v7s7_707, uinp_v7s7_707, selectBar_v7, select_v7 );
bdd_MUX unode_v7s7_738 ( uinp0_v3s5_706, uinp0_v7s7_738, uinp1_v7s7_738, selectBar_v7, select_v7 );
bdd_MUX unode_v0s21_723 ( uinp_v7s7_707, uinp0_v0s21_723, uinp1_v0s13_212, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_739 ( uinp1_v7s7_738, uinp0_v0s2_197, uinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX unode_v0s1_754 ( uinp0_v7s7_738, uinp1_v0s25_85, uinp1_v0s1_754, selectBar_v0, select_v0 );
bdd_MUX unode_v2s3_d_1017 ( uinp1_v0s1_754, uinp0_v2s10_372, uinp0_v2s10_372, selectBar_v2, select_v2 );
bdd_pre_top unode_R_770 ( uinp1_v4s3_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v4s3_769, uinp_R_897, pre );
bdd_MUX unode_v3s6_834 ( uinp_R_770, uinp0_v3s6_834, uinp1_v3s6_834, selectBar_v3, select_v3 );
bdd_MUX unode_v7s8_835 ( uinp1_v3s6_834, uinp0_v7s14_482, uinp1_v7s5_324, selectBar_v7, select_v7 );
bdd_MUX unode_v7s9_866 ( uinp0_v3s6_834, uinp0_v7s9_866, uinp1_v7s9_866, selectBar_v7, select_v7 );
bdd_MUX unode_v0s16_867 ( uinp1_v7s9_866, uinp1_v0s23_851, uinp1_v0s16_867, selectBar_v0, select_v0 );
bdd_MUX unode_v0s17_882 ( uinp0_v7s9_866, uinp0_v0s8_836, uinp0_v0s4_467, selectBar_v0, select_v0 );
bdd_MUX unode_v3s4_961 ( uinp_R_897, uinp0_v3s4_961, uinp1_v3s4_961, selectBar_v3, select_v3 );
bdd_MUX unode_v7s1_962 ( uinp1_v3s4_961, uinp0_v7s1_962, uinp1_v7s1_962, selectBar_v7, select_v7 );
bdd_MUX unode_v7s12_993 ( uinp0_v3s4_961, uinp0_v7s12_993, uinp1_v7s12_993, selectBar_v7, select_v7 );
bdd_MUX unode_v0s3_963 ( uinp1_v7s1_962, uinp0_v0s3_963, uinp1_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX unode_v0s18_978 ( uinp0_v7s1_962, uinp1_v0s24_243, uinp1_v0s18_978, selectBar_v0, select_v0 );
bdd_MUX unode_v0s15_994 ( uinp1_v7s12_993, uinp0_v0s15_994, uinp1_v0s1_754, selectBar_v0, select_v0 );
bdd_MUX unode_v0s20_1009 ( uinp0_v7s12_993, uinp0_v0s20_1009, uinp1_v0s1_754, selectBar_v0, select_v0 );


//Complemented BDD
bdd_MUX cnode_v5s1_1 ( cOUTPUT, cinp0_v5s1_1, cinp1_v5s1_1, selectBar_v5, select_v5 );
bdd_MUX cnode_v1s2_2 ( cinp1_v5s1_1, cinp0_v1s2_2, cinp1_v1s2_2, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_513 ( cinp0_v5s1_1, cinp0_v1s1_513, cinp1_v1s1_513, selectBar_v1, select_v1 );
bdd_MUX cnode_v4s2_3 ( cinp1_v1s2_2, cinp0_v4s2_3, cinp1_v4s2_3, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s4_258 ( cinp0_v1s2_2, cinp0_v4s4_258, cinp1_v4s4_258, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_4 ( cinp1_v4s2_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v4s2_3, cinp_R_131, pre );
bdd_MUX cnode_v3s8_68 ( cinp_R_4, cinp0_v3s8_68, cinp1_v3s8_68, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s3_69 ( cinp1_v3s8_68, cinp0_v7s3_69, cinp1_v7s3_69, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s4_100 ( cinp0_v3s8_68, cinp0_v7s4_100, cinp1_v7s4_100, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s25_d_70 ( cinp1_v7s3_69, cinp_v0s25_70, cinp_v0s25_70, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s25_85 ( cinp0_v7s3_69, cinp0_v0s25_85, cinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s10_372 ( cinp_v0s25_70, cinp0_v2s10_372, cinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX cnode_v6s1_d_996 ( cinp1_v2s10_372, INPUT1, INPUT1, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s1_1021 ( cinp0_v2s10_372, INPUT0, INPUT1, selectBar_v6, select_v6 );
bdd_MUX cnode_v2s3_1010 ( cinp1_v0s25_85, cinp0_v2s10_372, cinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s3_d_859 ( cinp0_v0s25_85, cinp_v2s3_859, cinp_v2s3_859, selectBar_v2, select_v2 );
bdd_MUX cnode_v6s1_d_1011 ( cinp1_v2s3_1010, INPUT0, INPUT0, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s2_999 ( cinp_v2s3_859, INPUT1, INPUT0, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s14_101 ( cinp1_v7s4_100, cinp0_v0s14_101, cinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_116 ( cinp0_v7s4_100, cinp0_v0s9_116, cinp1_v0s9_116, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s12_740 ( cinp1_v0s14_101, cinp0_v2s10_372, cinp_v2s3_859, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s12_d_979 ( cinp0_v0s14_101, cinp_v2s12_979, cinp_v2s12_979, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s7_983 ( cinp_v2s12_979, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s1_995 ( cinp0_v0s9_116, cinp_v2s3_859, cinp1_v2s1_995, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s7_195 ( cinp_R_131, cinp0_v3s7_195, cinp1_v3s7_195, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s15_196 ( cinp1_v3s7_195, cinp0_v7s15_196, cinp1_v7s15_196, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s13_227 ( cinp0_v3s7_195, cinp0_v7s13_227, cinp1_v7s13_227, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s2_197 ( cinp1_v7s15_196, cinp0_v0s2_197, cinp1_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s13_212 ( cinp0_v7s15_196, cinp_v0s25_70, cinp1_v0s13_212, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s11_d_971 ( cinp1_v0s2_197, cinp1_v2s3_1010, cinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s11_747 ( cinp0_v0s2_197, cinp0_v2s11_747, cinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s10_d_731 ( cinp1_v0s13_212, cinp_v2s10_731, cinp_v2s10_731, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s2_735 ( cinp_v2s10_731, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX cnode_v0s5_228 ( cinp1_v7s13_227, cinp0_v0s5_228, cinp0_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s24_243 ( cinp0_v7s13_227, cinp0_v0s2_197, cinp1_v0s24_243, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s11_d_868 ( cinp0_v0s5_228, cinp1_v2s10_372, cinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s8_986 ( cinp1_v0s24_243, cinp_v2s3_859, cinp0_v2s10_372, selectBar_v2, select_v2 );
bdd_pre_top cnode_R_259 ( cinp1_v4s4_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v4s4_258, cinp_R_386, pre );
bdd_MUX cnode_v3s2_323 ( cinp_R_259, cinp0_v3s2_323, cinp1_v3s2_323, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s5_324 ( cinp1_v3s2_323, cinp0_v7s5_324, cinp1_v7s5_324, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s10_355 ( cinp0_v3s2_323, cinp0_v7s10_355, cinp1_v7s10_355, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s8_836 ( cinp1_v7s5_324, cinp0_v0s8_836, cinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s12_340 ( cinp0_v7s5_324, cinp0_v0s2_197, cinp1_v0s12_340, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s9_890 ( cinp0_v0s8_836, cinp0_v2s9_890, cinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s5_341 ( cinp1_v0s12_340, cinp0_v2s5_341, cinp1_v2s10_372, selectBar_v2, select_v2 );
bdd_MUX cnode_v0s26_356 ( cinp1_v7s10_355, cinp_v0s25_70, cinp1_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s22_371 ( cinp0_v7s10_355, cinp0_v0s9_116, cinp_v0s25_70, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s3_450 ( cinp_R_386, cinp0_v3s3_450, cinp1_v3s3_450, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s2_451 ( cinp1_v3s3_450, cinp0_v7s2_451, cinp1_v7s2_451, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s14_482 ( cinp0_v3s3_450, cinp0_v7s14_482, cinp1_v7s14_482, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s4_d_452 ( cinp1_v7s2_451, cinp1_v0s14_101, cinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s4_467 ( cinp0_v7s2_451, cinp0_v0s4_467, cinp1_v0s24_243, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s6_883 ( cinp0_v0s4_467, cinp_v2s3_859, cinp1_v2s6_883, selectBar_v2, select_v2 );
bdd_MUX cnode_v0s23_d_483 ( cinp1_v7s14_482, cinp_v0s23_483, cinp_v0s23_483, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s23_851 ( cinp0_v7s14_482, cinp0_v0s23_851, cinp0_v0s25_85, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s7_491 ( cinp_v0s23_483, cinp0_v0s7_491, cinp1_v2s3_1010, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s4_875 ( cinp1_v0s23_851, cinp0_v2s4_875, cinp1_v2s3_1010, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s1_514 ( cinp1_v1s1_513, cinp0_v4s1_514, cinp1_v4s1_514, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s3_769 ( cinp0_v1s1_513, cinp0_v4s3_769, cinp1_v4s3_769, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_515 ( cinp1_v4s1_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v4s1_514, cinp_R_642, pre );
bdd_MUX cnode_v3s1_579 ( cinp_R_515, cinp0_v3s1_579, cinp1_v3s1_579, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s6_580 ( cinp1_v3s1_579, cinp0_v7s6_580, cinp1_v7s6_580, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s11_611 ( cinp0_v3s1_579, cinp0_v7s11_611, cinp1_v7s11_611, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s19_581 ( cinp1_v7s6_580, cinp0_v0s9_116, cinp0_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s19_d_596 ( cinp0_v7s6_580, cinp0_v0s14_101, cinp0_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_612 ( cinp1_v7s11_611, cinp1_v0s14_101, cinp1_v0s11_612, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_d_627 ( cinp0_v7s11_611, cinp_v0s11_627, cinp_v0s11_627, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_635 ( cinp_v0s11_627, cinp0_v2s10_372, cinp1_v0s6_635, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s5_706 ( cinp_R_642, cinp0_v3s5_706, cinp1_v3s5_706, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s7_d_707 ( cinp1_v3s5_706, cinp_v7s7_707, cinp_v7s7_707, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s7_738 ( cinp0_v3s5_706, cinp0_v7s7_738, cinp1_v7s7_738, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s21_723 ( cinp_v7s7_707, cinp0_v0s21_723, cinp1_v0s13_212, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_739 ( cinp1_v7s7_738, cinp0_v0s2_197, cinp1_v0s14_101, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s1_754 ( cinp0_v7s7_738, cinp1_v0s25_85, cinp1_v0s1_754, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s3_d_1017 ( cinp1_v0s1_754, cinp0_v2s10_372, cinp0_v2s10_372, selectBar_v2, select_v2 );
bdd_pre_top cnode_R_770 ( cinp1_v4s3_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v4s3_769, cinp_R_897, pre );
bdd_MUX cnode_v3s6_834 ( cinp_R_770, cinp0_v3s6_834, cinp1_v3s6_834, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s8_835 ( cinp1_v3s6_834, cinp0_v7s14_482, cinp1_v7s5_324, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s9_866 ( cinp0_v3s6_834, cinp0_v7s9_866, cinp1_v7s9_866, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s16_867 ( cinp1_v7s9_866, cinp1_v0s23_851, cinp1_v0s16_867, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s17_882 ( cinp0_v7s9_866, cinp0_v0s8_836, cinp0_v0s4_467, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s4_961 ( cinp_R_897, cinp0_v3s4_961, cinp1_v3s4_961, selectBar_v3, select_v3 );
bdd_MUX cnode_v7s1_962 ( cinp1_v3s4_961, cinp0_v7s1_962, cinp1_v7s1_962, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s12_993 ( cinp0_v3s4_961, cinp0_v7s12_993, cinp1_v7s12_993, selectBar_v7, select_v7 );
bdd_MUX cnode_v0s3_963 ( cinp1_v7s1_962, cinp0_v0s3_963, cinp1_v0s2_197, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s18_978 ( cinp0_v7s1_962, cinp1_v0s24_243, cinp1_v0s18_978, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s15_994 ( cinp1_v7s12_993, cinp0_v0s15_994, cinp1_v0s1_754, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s20_1009 ( cinp0_v7s12_993, cinp0_v0s20_1009, cinp1_v0s1_754, selectBar_v0, select_v0 );

endmodule
