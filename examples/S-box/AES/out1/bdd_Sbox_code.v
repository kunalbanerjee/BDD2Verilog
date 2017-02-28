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
bdd_MUX unode_v7_1 ( uOUTPUT, uinp0_v7_1, uinp1_v7_1, selectBar_v7, select_v7 );
bdd_MUX unode_v5s2_2 ( uinp1_v7_1, uinp0_v5s2_2, uinp1_v5s2_2, selectBar_v5, select_v5 );
bdd_MUX unode_v5s1_513 ( uinp0_v7_1, uinp0_v5s1_513, uinp1_v5s1_513, selectBar_v5, select_v5 );
bdd_MUX unode_v6s4_3 ( uinp1_v5s2_2, uinp0_v6s4_3, uinp1_v6s4_3, selectBar_v6, select_v6 );
bdd_MUX unode_v6s1_258 ( uinp0_v5s2_2, uinp0_v6s1_258, uinp1_v6s1_258, selectBar_v6, select_v6 );
bdd_pre_top unode_R_4 ( uinp1_v6s4_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v6s4_3, uinp_R_131, pre );
bdd_MUX unode_v3s6_68 ( uinp_R_4, uinp0_v3s6_68, uinp1_v3s6_68, selectBar_v3, select_v3 );
bdd_MUX unode_v2s1_69 ( uinp1_v3s6_68, uinp0_v2s1_69, uinp1_v2s1_69, selectBar_v2, select_v2 );
bdd_MUX unode_v2s15_100 ( uinp0_v3s6_68, uinp0_v2s15_100, uinp1_v2s15_100, selectBar_v2, select_v2 );
bdd_MUX unode_v4s1_70 ( uinp1_v2s1_69, uinp0_v4s1_70, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s17_867 ( uinp0_v2s1_69, uinp0_v4s17_867, uinp1_v4s17_867, selectBar_v4, select_v4 );
bdd_MUX unode_v0s11_d_986 ( uinp1_v4s1_70, uinp_v0s11_986, uinp_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_837 ( uinp0_v4s1_70, uinp0_v0s11_837, uinp1_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX unode_v1s2_1018 ( uinp_v0s11_986, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_1014 ( uinp0_v0s11_837, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v0s5_868 ( uinp1_v4s17_867, uinp0_v0s5_868, uinp_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0s1_1002 ( uinp0_v4s17_867, uinp0_v0s1_1002, uinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX unode_v1s2_d_965 ( uinp0_v0s5_868, INPUT0, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_d_1021 ( uinp0_v0s1_1002, INPUT1, INPUT1, selectBar_v1, select_v1 );
bdd_MUX unode_v4s15_101 ( uinp1_v2s15_100, uinp0_v4s15_101, uinp0_v4s17_867, selectBar_v4, select_v4 );
bdd_MUX unode_v4s15_d_116 ( uinp0_v2s15_100, uinp_v4s15_116, uinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX unode_v0s8_964 ( uinp0_v4s15_101, uinp_v0s11_986, uinp1_v0s8_964, selectBar_v0, select_v0 );
bdd_MUX unode_v0_d_731 ( uinp_v4s15_116, uinp0_v0s5_868, uinp0_v0s5_868, selectBar_v0, select_v0 );
bdd_MUX unode_v3s7_195 ( uinp_R_131, uinp0_v3s7_195, uinp1_v3s7_195, selectBar_v3, select_v3 );
bdd_MUX unode_v2s10_196 ( uinp1_v3s7_195, uinp0_v2s10_196, uinp1_v2s10_196, selectBar_v2, select_v2 );
bdd_MUX unode_v2s8_227 ( uinp0_v3s7_195, uinp0_v2s8_227, uinp1_v2s8_227, selectBar_v2, select_v2 );
bdd_MUX unode_v4s10_197 ( uinp1_v2s10_196, uinp0_v4s10_197, uinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s5_212 ( uinp0_v2s10_196, uinp0_v4s5_212, uinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX unode_v0s4_844 ( uinp1_v4s10_197, uinp_v0s11_986, uinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_d_890 ( uinp1_v4s5_212, uinp_v0s6_890, uinp_v0s6_890, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_724 ( uinp0_v4s5_212, uinp0_v0s11_837, uinp1_v0s6_724, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_894 ( uinp_v0s6_890, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX unode_v4s9_228 ( uinp1_v2s8_227, uinp0_v4s9_228, uinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX unode_v4s27_243 ( uinp0_v2s8_227, uinp0_v4s27_243, uinp1_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX unode_v0s2_236 ( uinp0_v4s9_228, uinp0_v0s2_236, uinp0_v0s5_868, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_d_995 ( uinp1_v4s27_243, uinp_v0s10_995, uinp_v0s10_995, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_755 ( uinp0_v4s27_243, uinp_v0s11_986, uinp1_v0s10_755, selectBar_v0, select_v0 );
bdd_MUX unode_v0s7_999 ( uinp_v0s10_995, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_pre_top unode_R_259 ( uinp1_v6s1_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v6s1_258, uinp_R_386, pre );
bdd_MUX unode_v3s2_323 ( uinp_R_259, uinp0_v3s2_323, uinp1_v3s2_323, selectBar_v3, select_v3 );
bdd_MUX unode_v2s5_324 ( uinp1_v3s2_323, uinp0_v2s5_324, uinp1_v2s5_324, selectBar_v2, select_v2 );
bdd_MUX unode_v2s13_355 ( uinp0_v3s2_323, uinp0_v2s13_355, uinp1_v2s13_355, selectBar_v2, select_v2 );
bdd_MUX unode_v4s20_325 ( uinp1_v2s5_324, uinp0_v4s20_325, uinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s4_340 ( uinp0_v2s5_324, uinp1_v4s17_867, uinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX unode_v0s3_1017 ( uinp0_v4s20_325, uinp0_v0s3_1017, uinp0_v0s1_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v4s28_356 ( uinp1_v2s13_355, uinp0_v4s28_356, uinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX unode_v4s7_371 ( uinp0_v2s13_355, uinp0_v4s1_70, uinp1_v4s7_371, selectBar_v4, select_v4 );
bdd_MUX unode_v3s4_450 ( uinp_R_386, uinp0_v3s4_450, uinp1_v3s4_450, selectBar_v3, select_v3 );
bdd_MUX unode_v2s16_451 ( uinp1_v3s4_450, uinp0_v2s16_451, uinp1_v2s16_451, selectBar_v2, select_v2 );
bdd_MUX unode_v2s2_482 ( uinp0_v3s4_450, uinp0_v2s2_482, uinp1_v2s2_482, selectBar_v2, select_v2 );
bdd_MUX unode_v4s12_452 ( uinp1_v2s16_451, uinp1_v4s17_867, uinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s18_467 ( uinp0_v2s16_451, uinp1_v4s10_197, uinp1_v4s18_467, selectBar_v4, select_v4 );
bdd_MUX unode_v0s5_d_971 ( uinp1_v4s12_452, uinp0_v0s1_1002, uinp0_v0s1_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v0s4_d_1010 ( uinp1_v4s18_467, uinp0_v0s11_837, uinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX unode_v4s25_483 ( uinp1_v2s2_482, uinp0_v4s5_212, uinp1_v4s25_483, selectBar_v4, select_v4 );
bdd_MUX unode_v4s25_d_498 ( uinp0_v2s2_482, uinp0_v4s15_101, uinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX unode_v6s3_514 ( uinp1_v5s1_513, uinp0_v6s3_514, uinp1_v6s3_514, selectBar_v6, select_v6 );
bdd_MUX unode_v6s2_769 ( uinp0_v5s1_513, uinp0_v6s2_769, uinp1_v6s2_769, selectBar_v6, select_v6 );
bdd_pre_top unode_R_515 ( uinp1_v6s3_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v6s3_514, uinp_R_642, pre );
bdd_MUX unode_v3s8_579 ( uinp_R_515, uinp0_v3s8_579, uinp1_v3s8_579, selectBar_v3, select_v3 );
bdd_MUX unode_v2s11_580 ( uinp1_v3s8_579, uinp0_v2s11_580, uinp1_v2s11_580, selectBar_v2, select_v2 );
bdd_MUX unode_v2s14_611 ( uinp0_v3s8_579, uinp0_v2s14_611, uinp1_v2s14_611, selectBar_v2, select_v2 );
bdd_MUX unode_v4s14_581 ( uinp1_v2s11_580, uinp0_v4s15_101, uinp0_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX unode_v4s13_596 ( uinp0_v2s11_580, uinp0_v4s13_596, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s3_612 ( uinp1_v2s14_611, uinp0_v4s3_612, uinp1_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX unode_v4s22_627 ( uinp0_v2s14_611, uinp0_v4s27_243, uinp1_v4s22_627, selectBar_v4, select_v4 );
bdd_MUX unode_v0s12_883 ( uinp1_v4s3_612, uinp0_v0s11_837, uinp1_v0s12_883, selectBar_v0, select_v0 );
bdd_MUX unode_v3s3_706 ( uinp_R_642, uinp0_v3s3_706, uinp1_v3s3_706, selectBar_v3, select_v3 );
bdd_MUX unode_v2s9_707 ( uinp1_v3s3_706, uinp0_v2s9_707, uinp1_v2s9_707, selectBar_v2, select_v2 );
bdd_MUX unode_v2s6_738 ( uinp0_v3s3_706, uinp0_v2s6_738, uinp1_v2s6_738, selectBar_v2, select_v2 );
bdd_MUX unode_v4s24_708 ( uinp1_v2s9_707, uinp0_v4s24_708, uinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s19_723 ( uinp0_v2s9_707, uinp0_v4s19_723, uinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s2_739 ( uinp1_v2s6_738, uinp0_v4s17_867, uinp1_v4s2_739, selectBar_v4, select_v4 );
bdd_MUX unode_v4s21_754 ( uinp0_v2s6_738, uinp0_v4s20_325, uinp0_v4s27_243, selectBar_v4, select_v4 );
bdd_pre_top unode_R_770 ( uinp1_v6s2_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v6s2_769, uinp_R_897, pre );
bdd_MUX unode_v3s1_834 ( uinp_R_770, uinp0_v3s1_834, uinp1_v3s1_834, selectBar_v3, select_v3 );
bdd_MUX unode_v2s12_835 ( uinp1_v3s1_834, uinp0_v2s12_835, uinp1_v2s12_835, selectBar_v2, select_v2 );
bdd_MUX unode_v2s7_866 ( uinp0_v3s1_834, uinp0_v2s7_866, uinp0_v2s1_69, selectBar_v2, select_v2 );
bdd_MUX unode_v4s8_836 ( uinp1_v2s12_835, uinp1_v4s10_197, uinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s23_851 ( uinp0_v2s12_835, uinp0_v4s23_851, uinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s16_882 ( uinp0_v2s7_866, uinp0_v4s16_882, uinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX unode_v3s5_961 ( uinp_R_897, uinp0_v3s5_961, uinp1_v3s5_961, selectBar_v3, select_v3 );
bdd_MUX unode_v2s3_962 ( uinp1_v3s5_961, uinp0_v2s3_962, uinp1_v2s3_962, selectBar_v2, select_v2 );
bdd_MUX unode_v2s4_993 ( uinp0_v3s5_961, uinp0_v2s4_993, uinp1_v2s4_993, selectBar_v2, select_v2 );
bdd_MUX unode_v4s11_963 ( uinp1_v2s3_962, uinp0_v4s11_963, uinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s11_d_978 ( uinp0_v2s3_962, uinp1_v4s1_70, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s6_994 ( uinp1_v2s4_993, uinp0_v4s17_867, uinp1_v4s6_994, selectBar_v4, select_v4 );
bdd_MUX unode_v4s26_1009 ( uinp0_v2s4_993, uinp0_v4s20_325, uinp1_v4s26_1009, selectBar_v4, select_v4 );


//Complemented BDD
bdd_MUX cnode_v7_1 ( cOUTPUT, cinp0_v7_1, cinp1_v7_1, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s2_2 ( cinp1_v7_1, cinp0_v5s2_2, cinp1_v5s2_2, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s1_513 ( cinp0_v7_1, cinp0_v5s1_513, cinp1_v5s1_513, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s4_3 ( cinp1_v5s2_2, cinp0_v6s4_3, cinp1_v6s4_3, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s1_258 ( cinp0_v5s2_2, cinp0_v6s1_258, cinp1_v6s1_258, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_4 ( cinp1_v6s4_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v6s4_3, cinp_R_131, pre );
bdd_MUX cnode_v3s6_68 ( cinp_R_4, cinp0_v3s6_68, cinp1_v3s6_68, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s1_69 ( cinp1_v3s6_68, cinp0_v2s1_69, cinp1_v2s1_69, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s15_100 ( cinp0_v3s6_68, cinp0_v2s15_100, cinp1_v2s15_100, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s1_70 ( cinp1_v2s1_69, cinp0_v4s1_70, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s17_867 ( cinp0_v2s1_69, cinp0_v4s17_867, cinp1_v4s17_867, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s11_d_986 ( cinp1_v4s1_70, cinp_v0s11_986, cinp_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_837 ( cinp0_v4s1_70, cinp0_v0s11_837, cinp1_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v1s2_1018 ( cinp_v0s11_986, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_1014 ( cinp0_v0s11_837, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v0s5_868 ( cinp1_v4s17_867, cinp0_v0s5_868, cinp_v0s11_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s1_1002 ( cinp0_v4s17_867, cinp0_v0s1_1002, cinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v1s2_d_965 ( cinp0_v0s5_868, INPUT1, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_d_1021 ( cinp0_v0s1_1002, INPUT0, INPUT0, selectBar_v1, select_v1 );
bdd_MUX cnode_v4s15_101 ( cinp1_v2s15_100, cinp0_v4s15_101, cinp0_v4s17_867, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s15_d_116 ( cinp0_v2s15_100, cinp_v4s15_116, cinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s8_964 ( cinp0_v4s15_101, cinp_v0s11_986, cinp1_v0s8_964, selectBar_v0, select_v0 );
bdd_MUX cnode_v0_d_731 ( cinp_v4s15_116, cinp0_v0s5_868, cinp0_v0s5_868, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s7_195 ( cinp_R_131, cinp0_v3s7_195, cinp1_v3s7_195, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s10_196 ( cinp1_v3s7_195, cinp0_v2s10_196, cinp1_v2s10_196, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s8_227 ( cinp0_v3s7_195, cinp0_v2s8_227, cinp1_v2s8_227, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s10_197 ( cinp1_v2s10_196, cinp0_v4s10_197, cinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s5_212 ( cinp0_v2s10_196, cinp0_v4s5_212, cinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s4_844 ( cinp1_v4s10_197, cinp_v0s11_986, cinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_d_890 ( cinp1_v4s5_212, cinp_v0s6_890, cinp_v0s6_890, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_724 ( cinp0_v4s5_212, cinp0_v0s11_837, cinp1_v0s6_724, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_894 ( cinp_v0s6_890, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s9_228 ( cinp1_v2s8_227, cinp0_v4s9_228, cinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s27_243 ( cinp0_v2s8_227, cinp0_v4s27_243, cinp1_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s2_236 ( cinp0_v4s9_228, cinp0_v0s2_236, cinp0_v0s5_868, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_d_995 ( cinp1_v4s27_243, cinp_v0s10_995, cinp_v0s10_995, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_755 ( cinp0_v4s27_243, cinp_v0s11_986, cinp1_v0s10_755, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s7_999 ( cinp_v0s10_995, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_pre_top cnode_R_259 ( cinp1_v6s1_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v6s1_258, cinp_R_386, pre );
bdd_MUX cnode_v3s2_323 ( cinp_R_259, cinp0_v3s2_323, cinp1_v3s2_323, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s5_324 ( cinp1_v3s2_323, cinp0_v2s5_324, cinp1_v2s5_324, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s13_355 ( cinp0_v3s2_323, cinp0_v2s13_355, cinp1_v2s13_355, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s20_325 ( cinp1_v2s5_324, cinp0_v4s20_325, cinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s4_340 ( cinp0_v2s5_324, cinp1_v4s17_867, cinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s3_1017 ( cinp0_v4s20_325, cinp0_v0s3_1017, cinp0_v0s1_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s28_356 ( cinp1_v2s13_355, cinp0_v4s28_356, cinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s7_371 ( cinp0_v2s13_355, cinp0_v4s1_70, cinp1_v4s7_371, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s4_450 ( cinp_R_386, cinp0_v3s4_450, cinp1_v3s4_450, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s16_451 ( cinp1_v3s4_450, cinp0_v2s16_451, cinp1_v2s16_451, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s2_482 ( cinp0_v3s4_450, cinp0_v2s2_482, cinp1_v2s2_482, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s12_452 ( cinp1_v2s16_451, cinp1_v4s17_867, cinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s18_467 ( cinp0_v2s16_451, cinp1_v4s10_197, cinp1_v4s18_467, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s5_d_971 ( cinp1_v4s12_452, cinp0_v0s1_1002, cinp0_v0s1_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s4_d_1010 ( cinp1_v4s18_467, cinp0_v0s11_837, cinp0_v0s11_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s25_483 ( cinp1_v2s2_482, cinp0_v4s5_212, cinp1_v4s25_483, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s25_d_498 ( cinp0_v2s2_482, cinp0_v4s15_101, cinp0_v4s15_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v6s3_514 ( cinp1_v5s1_513, cinp0_v6s3_514, cinp1_v6s3_514, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s2_769 ( cinp0_v5s1_513, cinp0_v6s2_769, cinp1_v6s2_769, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_515 ( cinp1_v6s3_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v6s3_514, cinp_R_642, pre );
bdd_MUX cnode_v3s8_579 ( cinp_R_515, cinp0_v3s8_579, cinp1_v3s8_579, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s11_580 ( cinp1_v3s8_579, cinp0_v2s11_580, cinp1_v2s11_580, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s14_611 ( cinp0_v3s8_579, cinp0_v2s14_611, cinp1_v2s14_611, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s14_581 ( cinp1_v2s11_580, cinp0_v4s15_101, cinp0_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s13_596 ( cinp0_v2s11_580, cinp0_v4s13_596, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s3_612 ( cinp1_v2s14_611, cinp0_v4s3_612, cinp1_v4s27_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s22_627 ( cinp0_v2s14_611, cinp0_v4s27_243, cinp1_v4s22_627, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s12_883 ( cinp1_v4s3_612, cinp0_v0s11_837, cinp1_v0s12_883, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s3_706 ( cinp_R_642, cinp0_v3s3_706, cinp1_v3s3_706, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s9_707 ( cinp1_v3s3_706, cinp0_v2s9_707, cinp1_v2s9_707, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s6_738 ( cinp0_v3s3_706, cinp0_v2s6_738, cinp1_v2s6_738, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s24_708 ( cinp1_v2s9_707, cinp0_v4s24_708, cinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s19_723 ( cinp0_v2s9_707, cinp0_v4s19_723, cinp_v4s15_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s2_739 ( cinp1_v2s6_738, cinp0_v4s17_867, cinp1_v4s2_739, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s21_754 ( cinp0_v2s6_738, cinp0_v4s20_325, cinp0_v4s27_243, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_770 ( cinp1_v6s2_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v6s2_769, cinp_R_897, pre );
bdd_MUX cnode_v3s1_834 ( cinp_R_770, cinp0_v3s1_834, cinp1_v3s1_834, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s12_835 ( cinp1_v3s1_834, cinp0_v2s12_835, cinp1_v2s12_835, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s7_866 ( cinp0_v3s1_834, cinp0_v2s7_866, cinp0_v2s1_69, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s8_836 ( cinp1_v2s12_835, cinp1_v4s10_197, cinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s23_851 ( cinp0_v2s12_835, cinp0_v4s23_851, cinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s16_882 ( cinp0_v2s7_866, cinp0_v4s16_882, cinp1_v4s5_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s5_961 ( cinp_R_897, cinp0_v3s5_961, cinp1_v3s5_961, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s3_962 ( cinp1_v3s5_961, cinp0_v2s3_962, cinp1_v2s3_962, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s4_993 ( cinp0_v3s5_961, cinp0_v2s4_993, cinp1_v2s4_993, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s11_963 ( cinp1_v2s3_962, cinp0_v4s11_963, cinp1_v4s12_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s11_d_978 ( cinp0_v2s3_962, cinp1_v4s1_70, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s6_994 ( cinp1_v2s4_993, cinp0_v4s17_867, cinp1_v4s6_994, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s26_1009 ( cinp0_v2s4_993, cinp0_v4s20_325, cinp1_v4s26_1009, selectBar_v4, select_v4 );

endmodule
