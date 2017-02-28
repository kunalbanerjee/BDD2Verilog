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
bdd_MUX unode_v1s1_3 ( uinp1_v5s1_2, uinp0_v1s1_3, uinp1_v1s1_3, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_258 ( uinp0_v5s1_2, uinp0_v1s2_258, uinp1_v1s2_258, selectBar_v1, select_v1 );
bdd_pre_top unode_R_4 ( uinp1_v1s1_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v1s1_3, uinp_R_131, pre );
bdd_MUX unode_v4s7_68 ( uinp_R_4, uinp0_v4s7_68, uinp1_v4s7_68, selectBar_v4, select_v4 );
bdd_MUX unode_v2s14_69 ( uinp1_v4s7_68, uinp0_v2s14_69, uinp1_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX unode_v2s9_100 ( uinp0_v4s7_68, uinp0_v2s9_100, uinp1_v2s9_100, selectBar_v2, select_v2 );
bdd_MUX unode_v3s23_70 ( uinp1_v2s14_69, uinp0_v3s23_70, uinp1_v3s23_70, selectBar_v3, select_v3 );
bdd_MUX unode_v3s23_d_85 ( uinp0_v2s14_69, uinp_v3s23_85, uinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX unode_v0s8_124 ( uinp1_v3s23_70, uinp0_v0s8_124, uinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX unode_v0s2_971 ( uinp0_v3s23_70, uinp0_v0s2_971, uinp1_v0s2_971, selectBar_v0, select_v0 );
bdd_MUX unode_v6s1_1018 ( uinp1_v0s8_124, INPUT1, INPUT0, selectBar_v6, select_v6 );
bdd_MUX unode_v6s1_d_1003 ( uinp0_v0s8_124, INPUT1, INPUT1, selectBar_v6, select_v6 );
bdd_MUX unode_v0s4_1002 ( uinp_v3s23_85, uinp0_v0s8_124, uinp1_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v6s2_1021 ( uinp0_v0s4_1002, INPUT0, INPUT1, selectBar_v6, select_v6 );
bdd_MUX unode_v3s6_101 ( uinp1_v2s9_100, uinp0_v3s6_101, uinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX unode_v3s2_116 ( uinp0_v2s9_100, uinp1_v3s23_70, uinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX unode_v0s3_1017 ( uinp0_v3s6_101, uinp0_v0s4_1002, uinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX unode_v0s12_716 ( uinp1_v3s2_116, uinp1_v0s8_124, uinp0_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v4s3_195 ( uinp_R_131, uinp0_v4s3_195, uinp1_v4s3_195, selectBar_v4, select_v4 );
bdd_MUX unode_v2s2_196 ( uinp1_v4s3_195, uinp0_v2s2_196, uinp1_v2s2_196, selectBar_v2, select_v2 );
bdd_MUX unode_v2s15_227 ( uinp0_v4s3_195, uinp0_v2s15_227, uinp1_v2s15_227, selectBar_v2, select_v2 );
bdd_MUX unode_v3s9_197 ( uinp1_v2s2_196, uinp0_v3s9_197, uinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX unode_v3s7_212 ( uinp0_v2s2_196, uinp0_v3s6_101, uinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX unode_v0s9_883 ( uinp1_v3s9_197, uinp0_v0s9_883, uinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_d_995 ( uinp0_v3s9_197, uinp_v0s9_995, uinp_v0s9_995, selectBar_v0, select_v0 );
bdd_MUX unode_v6s1_d_1014 ( uinp0_v0s9_883, INPUT0, INPUT0, selectBar_v6, select_v6 );
bdd_MUX unode_v0s5_999 ( uinp_v0s9_995, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX unode_v3s4_228 ( uinp1_v2s15_227, uinp0_v3s4_228, uinp1_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX unode_v3s27_836 ( uinp0_v2s15_227, uinp0_v3s27_836, uinp1_v3s27_836, selectBar_v3, select_v3 );
bdd_MUX unode_v0s1_724 ( uinp1_v3s4_228, uinp0_v0s4_1002, uinp1_v0s1_724, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_979 ( uinp0_v3s4_228, uinp0_v0s6_979, uinp0_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX unode_v0s7_d_837 ( uinp1_v3s27_836, uinp0_v0s4_1002, uinp0_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v0s7_1010 ( uinp0_v3s27_836, uinp0_v0s7_1010, uinp0_v0s9_883, selectBar_v0, select_v0 );
bdd_pre_top unode_R_259 ( uinp1_v1s2_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v1s2_258, uinp_R_386, pre );
bdd_MUX unode_v4s8_323 ( uinp_R_259, uinp0_v4s8_323, uinp1_v4s8_323, selectBar_v4, select_v4 );
bdd_MUX unode_v2s6_324 ( uinp1_v4s8_323, uinp0_v2s6_324, uinp1_v2s6_324, selectBar_v2, select_v2 );
bdd_MUX unode_v2s10_355 ( uinp0_v4s8_323, uinp0_v2s10_355, uinp1_v2s10_355, selectBar_v2, select_v2 );
bdd_MUX unode_v3s17_d_325 ( uinp1_v2s6_324, uinp_v3s17_325, uinp_v3s17_325, selectBar_v3, select_v3 );
bdd_MUX unode_v3s17_340 ( uinp0_v2s6_324, uinp0_v3s17_340, uinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX unode_v3s16_333 ( uinp_v3s17_325, uinp0_v0s8_124, uinp1_v3s16_333, selectBar_v3, select_v3 );
bdd_MUX unode_v0s10_766 ( uinp0_v3s16_333, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX unode_v0s12_d_453 ( uinp0_v3s17_340, uinp1_v0s8_124, uinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX unode_v3s5_356 ( uinp1_v2s10_355, uinp0_v3s5_356, uinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX unode_v3s11_371 ( uinp0_v2s10_355, uinp0_v3s11_371, uinp0_v3s23_70, selectBar_v3, select_v3 );
bdd_MUX unode_v0s6_d_731 ( uinp0_v3s5_356, uinp0_v0s9_883, uinp0_v0s9_883, selectBar_v0, select_v0 );
bdd_MUX unode_v0s2_d_762 ( uinp0_v3s11_371, uinp0_v3s16_333, uinp0_v3s16_333, selectBar_v0, select_v0 );
bdd_MUX unode_v4s4_450 ( uinp_R_386, uinp0_v4s4_450, uinp1_v4s4_450, selectBar_v4, select_v4 );
bdd_MUX unode_v2s3_451 ( uinp1_v4s4_450, uinp0_v2s3_451, uinp1_v2s3_451, selectBar_v2, select_v2 );
bdd_MUX unode_v2s13_482 ( uinp0_v4s4_450, uinp0_v2s13_482, uinp1_v2s13_482, selectBar_v2, select_v2 );
bdd_MUX unode_v3s19_452 ( uinp1_v2s3_451, uinp0_v3s6_101, uinp1_v3s19_452, selectBar_v3, select_v3 );
bdd_MUX unode_v3s18_467 ( uinp0_v2s3_451, uinp0_v3s27_836, uinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX unode_v3s12_483 ( uinp1_v2s13_482, uinp0_v3s12_483, uinp0_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX unode_v3s12_d_498 ( uinp0_v2s13_482, uinp_v3s12_498, uinp_v3s12_498, selectBar_v3, select_v3 );
bdd_MUX unode_v3s10_506 ( uinp_v3s12_498, uinp0_v3s10_506, uinp0_v0s8_124, selectBar_v3, select_v3 );
bdd_MUX unode_v1s3_514 ( uinp1_v5s2_513, uinp0_v1s3_514, uinp1_v1s3_514, selectBar_v1, select_v1 );
bdd_MUX unode_v1s4_769 ( uinp0_v5s2_513, uinp0_v1s4_769, uinp1_v1s4_769, selectBar_v1, select_v1 );
bdd_pre_top unode_R_515 ( uinp1_v1s3_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v1s3_514, uinp_R_642, pre );
bdd_MUX unode_v4s5_579 ( uinp_R_515, uinp0_v4s5_579, uinp1_v4s5_579, selectBar_v4, select_v4 );
bdd_MUX unode_v2s1_580 ( uinp1_v4s5_579, uinp0_v2s1_580, uinp1_v2s1_580, selectBar_v2, select_v2 );
bdd_MUX unode_v2s4_611 ( uinp0_v4s5_579, uinp0_v2s4_611, uinp1_v2s4_611, selectBar_v2, select_v2 );
bdd_MUX unode_v3s15_581 ( uinp1_v2s1_580, uinp0_v3s6_101, uinp1_v3s15_581, selectBar_v3, select_v3 );
bdd_MUX unode_v3s1_596 ( uinp0_v2s1_580, uinp0_v3s27_836, uinp1_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX unode_v3s21_612 ( uinp1_v2s4_611, uinp1_v3s9_197, uinp1_v3s21_612, selectBar_v3, select_v3 );
bdd_MUX unode_v3s8_627 ( uinp0_v2s4_611, uinp0_v3s8_627, uinp1_v3s27_836, selectBar_v3, select_v3 );
bdd_MUX unode_v4s1_706 ( uinp_R_642, uinp0_v4s1_706, uinp1_v4s1_706, selectBar_v4, select_v4 );
bdd_MUX unode_v2s16_707 ( uinp1_v4s1_706, uinp0_v2s16_707, uinp1_v2s16_707, selectBar_v2, select_v2 );
bdd_MUX unode_v2s11_738 ( uinp0_v4s1_706, uinp0_v2s11_738, uinp1_v2s11_738, selectBar_v2, select_v2 );
bdd_MUX unode_v3s14_d_708 ( uinp1_v2s16_707, uinp1_v3s2_116, uinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX unode_v3s14_723 ( uinp0_v2s16_707, uinp0_v3s14_723, uinp0_v3s5_356, selectBar_v3, select_v3 );
bdd_MUX unode_v3s20_d_739 ( uinp1_v2s11_738, uinp0_v3s11_371, uinp0_v3s11_371, selectBar_v3, select_v3 );
bdd_MUX unode_v3s20_754 ( uinp0_v2s11_738, uinp0_v3s20_754, uinp0_v3s11_371, selectBar_v3, select_v3 );
bdd_pre_top unode_R_770 ( uinp1_v1s4_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v1s4_769, uinp_R_897, pre );
bdd_MUX unode_v4s6_834 ( uinp_R_770, uinp0_v4s6_834, uinp1_v4s6_834, selectBar_v4, select_v4 );
bdd_MUX unode_v2s8_835 ( uinp1_v4s6_834, uinp0_v2s8_835, uinp0_v2s15_227, selectBar_v2, select_v2 );
bdd_MUX unode_v2s12_866 ( uinp0_v4s6_834, uinp0_v2s12_866, uinp1_v2s12_866, selectBar_v2, select_v2 );
bdd_MUX unode_v3s22_851 ( uinp0_v2s8_835, uinp0_v3s23_70, uinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX unode_v3s26_d_867 ( uinp1_v2s12_866, uinp0_v3s9_197, uinp0_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX unode_v3s26_882 ( uinp0_v2s12_866, uinp_v3s23_85, uinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX unode_v4s2_961 ( uinp_R_897, uinp0_v4s2_961, uinp1_v4s2_961, selectBar_v4, select_v4 );
bdd_MUX unode_v2s5_962 ( uinp1_v4s2_961, uinp0_v2s5_962, uinp1_v2s5_962, selectBar_v2, select_v2 );
bdd_MUX unode_v2s7_993 ( uinp0_v4s2_961, uinp0_v2s7_993, uinp1_v2s7_993, selectBar_v2, select_v2 );
bdd_MUX unode_v3s24_963 ( uinp1_v2s5_962, uinp0_v3s23_70, uinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX unode_v3s3_978 ( uinp0_v2s5_962, uinp0_v3s3_978, uinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX unode_v0s11_986 ( uinp0_v3s3_978, uinp1_v0s8_124, uinp1_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX unode_v3s13_994 ( uinp1_v2s7_993, uinp_v3s23_85, uinp1_v3s13_994, selectBar_v3, select_v3 );
bdd_MUX unode_v3s25_1009 ( uinp0_v2s7_993, uinp0_v3s6_101, uinp0_v3s27_836, selectBar_v3, select_v3 );


//Complemented BDD
bdd_MUX cnode_v7s1_1 ( cOUTPUT, cinp0_v7s1_1, cinp1_v7s1_1, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s1_2 ( cinp1_v7s1_1, cinp0_v5s1_2, cinp1_v5s1_2, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s2_513 ( cinp0_v7s1_1, cinp0_v5s2_513, cinp1_v5s2_513, selectBar_v5, select_v5 );
bdd_MUX cnode_v1s1_3 ( cinp1_v5s1_2, cinp0_v1s1_3, cinp1_v1s1_3, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_258 ( cinp0_v5s1_2, cinp0_v1s2_258, cinp1_v1s2_258, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_4 ( cinp1_v1s1_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v1s1_3, cinp_R_131, pre );
bdd_MUX cnode_v4s7_68 ( cinp_R_4, cinp0_v4s7_68, cinp1_v4s7_68, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s14_69 ( cinp1_v4s7_68, cinp0_v2s14_69, cinp1_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s9_100 ( cinp0_v4s7_68, cinp0_v2s9_100, cinp1_v2s9_100, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s23_70 ( cinp1_v2s14_69, cinp0_v3s23_70, cinp1_v3s23_70, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s23_d_85 ( cinp0_v2s14_69, cinp_v3s23_85, cinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s8_124 ( cinp1_v3s23_70, cinp0_v0s8_124, cinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s2_971 ( cinp0_v3s23_70, cinp0_v0s2_971, cinp1_v0s2_971, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s1_1018 ( cinp1_v0s8_124, INPUT0, INPUT1, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s1_d_1003 ( cinp0_v0s8_124, INPUT0, INPUT0, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s4_1002 ( cinp_v3s23_85, cinp0_v0s8_124, cinp1_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s2_1021 ( cinp0_v0s4_1002, INPUT1, INPUT0, selectBar_v6, select_v6 );
bdd_MUX cnode_v3s6_101 ( cinp1_v2s9_100, cinp0_v3s6_101, cinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s2_116 ( cinp0_v2s9_100, cinp1_v3s23_70, cinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s3_1017 ( cinp0_v3s6_101, cinp0_v0s4_1002, cinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s12_716 ( cinp1_v3s2_116, cinp1_v0s8_124, cinp0_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s3_195 ( cinp_R_131, cinp0_v4s3_195, cinp1_v4s3_195, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s2_196 ( cinp1_v4s3_195, cinp0_v2s2_196, cinp1_v2s2_196, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s15_227 ( cinp0_v4s3_195, cinp0_v2s15_227, cinp1_v2s15_227, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s9_197 ( cinp1_v2s2_196, cinp0_v3s9_197, cinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s7_212 ( cinp0_v2s2_196, cinp0_v3s6_101, cinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s9_883 ( cinp1_v3s9_197, cinp0_v0s9_883, cinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_d_995 ( cinp0_v3s9_197, cinp_v0s9_995, cinp_v0s9_995, selectBar_v0, select_v0 );
bdd_MUX cnode_v6s1_d_1014 ( cinp0_v0s9_883, INPUT1, INPUT1, selectBar_v6, select_v6 );
bdd_MUX cnode_v0s5_999 ( cinp_v0s9_995, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s4_228 ( cinp1_v2s15_227, cinp0_v3s4_228, cinp1_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s27_836 ( cinp0_v2s15_227, cinp0_v3s27_836, cinp1_v3s27_836, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s1_724 ( cinp1_v3s4_228, cinp0_v0s4_1002, cinp1_v0s1_724, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_979 ( cinp0_v3s4_228, cinp0_v0s6_979, cinp0_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s7_d_837 ( cinp1_v3s27_836, cinp0_v0s4_1002, cinp0_v0s4_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s7_1010 ( cinp0_v3s27_836, cinp0_v0s7_1010, cinp0_v0s9_883, selectBar_v0, select_v0 );
bdd_pre_top cnode_R_259 ( cinp1_v1s2_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v1s2_258, cinp_R_386, pre );
bdd_MUX cnode_v4s8_323 ( cinp_R_259, cinp0_v4s8_323, cinp1_v4s8_323, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s6_324 ( cinp1_v4s8_323, cinp0_v2s6_324, cinp1_v2s6_324, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s10_355 ( cinp0_v4s8_323, cinp0_v2s10_355, cinp1_v2s10_355, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s17_d_325 ( cinp1_v2s6_324, cinp_v3s17_325, cinp_v3s17_325, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s17_340 ( cinp0_v2s6_324, cinp0_v3s17_340, cinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s16_333 ( cinp_v3s17_325, cinp0_v0s8_124, cinp1_v3s16_333, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s10_766 ( cinp0_v3s16_333, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s12_d_453 ( cinp0_v3s17_340, cinp1_v0s8_124, cinp1_v0s8_124, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s5_356 ( cinp1_v2s10_355, cinp0_v3s5_356, cinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s11_371 ( cinp0_v2s10_355, cinp0_v3s11_371, cinp0_v3s23_70, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s6_d_731 ( cinp0_v3s5_356, cinp0_v0s9_883, cinp0_v0s9_883, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s2_d_762 ( cinp0_v3s11_371, cinp0_v3s16_333, cinp0_v3s16_333, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s4_450 ( cinp_R_386, cinp0_v4s4_450, cinp1_v4s4_450, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s3_451 ( cinp1_v4s4_450, cinp0_v2s3_451, cinp1_v2s3_451, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s13_482 ( cinp0_v4s4_450, cinp0_v2s13_482, cinp1_v2s13_482, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s19_452 ( cinp1_v2s3_451, cinp0_v3s6_101, cinp1_v3s19_452, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s18_467 ( cinp0_v2s3_451, cinp0_v3s27_836, cinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s12_483 ( cinp1_v2s13_482, cinp0_v3s12_483, cinp0_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s12_d_498 ( cinp0_v2s13_482, cinp_v3s12_498, cinp_v3s12_498, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s10_506 ( cinp_v3s12_498, cinp0_v3s10_506, cinp0_v0s8_124, selectBar_v3, select_v3 );
bdd_MUX cnode_v1s3_514 ( cinp1_v5s2_513, cinp0_v1s3_514, cinp1_v1s3_514, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s4_769 ( cinp0_v5s2_513, cinp0_v1s4_769, cinp1_v1s4_769, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_515 ( cinp1_v1s3_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v1s3_514, cinp_R_642, pre );
bdd_MUX cnode_v4s5_579 ( cinp_R_515, cinp0_v4s5_579, cinp1_v4s5_579, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s1_580 ( cinp1_v4s5_579, cinp0_v2s1_580, cinp1_v2s1_580, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s4_611 ( cinp0_v4s5_579, cinp0_v2s4_611, cinp1_v2s4_611, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s15_581 ( cinp1_v2s1_580, cinp0_v3s6_101, cinp1_v3s15_581, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s1_596 ( cinp0_v2s1_580, cinp0_v3s27_836, cinp1_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s21_612 ( cinp1_v2s4_611, cinp1_v3s9_197, cinp1_v3s21_612, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s8_627 ( cinp0_v2s4_611, cinp0_v3s8_627, cinp1_v3s27_836, selectBar_v3, select_v3 );
bdd_MUX cnode_v4s1_706 ( cinp_R_642, cinp0_v4s1_706, cinp1_v4s1_706, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s16_707 ( cinp1_v4s1_706, cinp0_v2s16_707, cinp1_v2s16_707, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s11_738 ( cinp0_v4s1_706, cinp0_v2s11_738, cinp1_v2s11_738, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s14_d_708 ( cinp1_v2s16_707, cinp1_v3s2_116, cinp1_v3s2_116, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s14_723 ( cinp0_v2s16_707, cinp0_v3s14_723, cinp0_v3s5_356, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s20_d_739 ( cinp1_v2s11_738, cinp0_v3s11_371, cinp0_v3s11_371, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s20_754 ( cinp0_v2s11_738, cinp0_v3s20_754, cinp0_v3s11_371, selectBar_v3, select_v3 );
bdd_pre_top cnode_R_770 ( cinp1_v1s4_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v1s4_769, cinp_R_897, pre );
bdd_MUX cnode_v4s6_834 ( cinp_R_770, cinp0_v4s6_834, cinp1_v4s6_834, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s8_835 ( cinp1_v4s6_834, cinp0_v2s8_835, cinp0_v2s15_227, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s12_866 ( cinp0_v4s6_834, cinp0_v2s12_866, cinp1_v2s12_866, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s22_851 ( cinp0_v2s8_835, cinp0_v3s23_70, cinp_v3s23_85, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s26_d_867 ( cinp1_v2s12_866, cinp0_v3s9_197, cinp0_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s26_882 ( cinp0_v2s12_866, cinp_v3s23_85, cinp1_v3s9_197, selectBar_v3, select_v3 );
bdd_MUX cnode_v4s2_961 ( cinp_R_897, cinp0_v4s2_961, cinp1_v4s2_961, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s5_962 ( cinp1_v4s2_961, cinp0_v2s5_962, cinp1_v2s5_962, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s7_993 ( cinp0_v4s2_961, cinp0_v2s7_993, cinp1_v2s7_993, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s24_963 ( cinp1_v2s5_962, cinp0_v3s23_70, cinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s3_978 ( cinp0_v2s5_962, cinp0_v3s3_978, cinp0_v3s4_228, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s11_986 ( cinp0_v3s3_978, cinp1_v0s8_124, cinp1_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s13_994 ( cinp1_v2s7_993, cinp_v3s23_85, cinp1_v3s13_994, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s25_1009 ( cinp0_v2s7_993, cinp0_v3s6_101, cinp0_v3s27_836, selectBar_v3, select_v3 );

endmodule
