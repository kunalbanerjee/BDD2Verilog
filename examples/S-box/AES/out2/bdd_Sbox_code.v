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
bdd_MUX unode_v6s4_3 ( uinp1_v5s1_2, uinp0_v6s4_3, uinp1_v6s4_3, selectBar_v6, select_v6 );
bdd_MUX unode_v6s2_258 ( uinp0_v5s1_2, uinp0_v6s2_258, uinp1_v6s2_258, selectBar_v6, select_v6 );
bdd_pre_top unode_R_4 ( uinp1_v6s4_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v6s4_3, uinp_R_131, pre );
bdd_MUX unode_v3s1_68 ( uinp_R_4, uinp0_v3s1_68, uinp1_v3s1_68, selectBar_v3, select_v3 );
bdd_MUX unode_v2s14_69 ( uinp1_v3s1_68, uinp0_v2s14_69, uinp1_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX unode_v2s2_100 ( uinp0_v3s1_68, uinp0_v2s2_100, uinp1_v2s2_100, selectBar_v2, select_v2 );
bdd_MUX unode_v4s1_70 ( uinp1_v2s14_69, uinp0_v4s1_70, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s27_867 ( uinp0_v2s14_69, uinp0_v4s27_867, uinp1_v4s27_867, selectBar_v4, select_v4 );
bdd_MUX unode_v0s4_d_986 ( uinp1_v4s1_70, uinp_v0s4_986, uinp_v0s4_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0s4_837 ( uinp0_v4s1_70, uinp0_v0s4_837, uinp1_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX unode_v1s1_1018 ( uinp_v0s4_986, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_1014 ( uinp0_v0s4_837, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v0s6_868 ( uinp1_v4s27_867, uinp0_v0s6_868, uinp_v0s4_986, selectBar_v0, select_v0 );
bdd_MUX unode_v0s2_1002 ( uinp0_v4s27_867, uinp0_v0s2_1002, uinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX unode_v1s1_d_965 ( uinp0_v0s6_868, INPUT0, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_d_1021 ( uinp0_v0s2_1002, INPUT1, INPUT1, selectBar_v1, select_v1 );
bdd_MUX unode_v4s13_101 ( uinp1_v2s2_100, uinp0_v4s13_101, uinp0_v4s27_867, selectBar_v4, select_v4 );
bdd_MUX unode_v4s13_d_116 ( uinp0_v2s2_100, uinp_v4s13_116, uinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX unode_v0s8_964 ( uinp0_v4s13_101, uinp_v0s4_986, uinp1_v0s8_964, selectBar_v0, select_v0 );
bdd_MUX unode_v0_d_731 ( uinp_v4s13_116, uinp0_v0s6_868, uinp0_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX unode_v3s6_195 ( uinp_R_131, uinp0_v3s6_195, uinp1_v3s6_195, selectBar_v3, select_v3 );
bdd_MUX unode_v2s4_196 ( uinp1_v3s6_195, uinp0_v2s4_196, uinp1_v2s4_196, selectBar_v2, select_v2 );
bdd_MUX unode_v2s13_227 ( uinp0_v3s6_195, uinp0_v2s13_227, uinp1_v2s13_227, selectBar_v2, select_v2 );
bdd_MUX unode_v4s20_197 ( uinp1_v2s4_196, uinp0_v4s20_197, uinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s3_212 ( uinp0_v2s4_196, uinp0_v4s3_212, uinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX unode_v0s12_844 ( uinp1_v4s20_197, uinp_v0s4_986, uinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_d_890 ( uinp1_v4s3_212, uinp_v0s10_890, uinp_v0s10_890, selectBar_v0, select_v0 );
bdd_MUX unode_v0s10_724 ( uinp0_v4s3_212, uinp0_v0s4_837, uinp1_v0s10_724, selectBar_v0, select_v0 );
bdd_MUX unode_v0s1_894 ( uinp_v0s10_890, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_MUX unode_v4s8_228 ( uinp1_v2s13_227, uinp0_v4s8_228, uinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX unode_v4s18_243 ( uinp0_v2s13_227, uinp0_v4s18_243, uinp1_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX unode_v0s3_236 ( uinp0_v4s8_228, uinp0_v0s3_236, uinp0_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_d_995 ( uinp1_v4s18_243, uinp_v0s11_995, uinp_v0s11_995, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_755 ( uinp0_v4s18_243, uinp_v0s4_986, uinp1_v0s11_755, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_999 ( uinp_v0s11_995, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_pre_top unode_R_259 ( uinp1_v6s2_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v6s2_258, uinp_R_386, pre );
bdd_MUX unode_v3s4_323 ( uinp_R_259, uinp0_v3s4_323, uinp1_v3s4_323, selectBar_v3, select_v3 );
bdd_MUX unode_v2s10_324 ( uinp1_v3s4_323, uinp0_v2s10_324, uinp1_v2s10_324, selectBar_v2, select_v2 );
bdd_MUX unode_v2s5_355 ( uinp0_v3s4_323, uinp0_v2s5_355, uinp1_v2s5_355, selectBar_v2, select_v2 );
bdd_MUX unode_v4s6_325 ( uinp1_v2s10_324, uinp0_v4s6_325, uinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s2_340 ( uinp0_v2s10_324, uinp1_v4s27_867, uinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX unode_v0s5_1017 ( uinp0_v4s6_325, uinp0_v0s5_1017, uinp0_v0s2_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v4s11_356 ( uinp1_v2s5_355, uinp0_v4s11_356, uinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX unode_v4s24_371 ( uinp0_v2s5_355, uinp0_v4s1_70, uinp1_v4s24_371, selectBar_v4, select_v4 );
bdd_MUX unode_v3s7_450 ( uinp_R_386, uinp0_v3s7_450, uinp1_v3s7_450, selectBar_v3, select_v3 );
bdd_MUX unode_v2s7_451 ( uinp1_v3s7_450, uinp0_v2s7_451, uinp1_v2s7_451, selectBar_v2, select_v2 );
bdd_MUX unode_v2s11_482 ( uinp0_v3s7_450, uinp0_v2s11_482, uinp1_v2s11_482, selectBar_v2, select_v2 );
bdd_MUX unode_v4s22_452 ( uinp1_v2s7_451, uinp1_v4s27_867, uinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s26_467 ( uinp0_v2s7_451, uinp1_v4s20_197, uinp1_v4s26_467, selectBar_v4, select_v4 );
bdd_MUX unode_v0s6_d_971 ( uinp1_v4s22_452, uinp0_v0s2_1002, uinp0_v0s2_1002, selectBar_v0, select_v0 );
bdd_MUX unode_v0s12_d_1010 ( uinp1_v4s26_467, uinp0_v0s4_837, uinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX unode_v4s23_483 ( uinp1_v2s11_482, uinp0_v4s3_212, uinp1_v4s23_483, selectBar_v4, select_v4 );
bdd_MUX unode_v4s23_d_498 ( uinp0_v2s11_482, uinp0_v4s13_101, uinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX unode_v6s1_514 ( uinp1_v5s2_513, uinp0_v6s1_514, uinp1_v6s1_514, selectBar_v6, select_v6 );
bdd_MUX unode_v6s3_769 ( uinp0_v5s2_513, uinp0_v6s3_769, uinp1_v6s3_769, selectBar_v6, select_v6 );
bdd_pre_top unode_R_515 ( uinp1_v6s1_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v6s1_514, uinp_R_642, pre );
bdd_MUX unode_v3s2_579 ( uinp_R_515, uinp0_v3s2_579, uinp1_v3s2_579, selectBar_v3, select_v3 );
bdd_MUX unode_v2s1_580 ( uinp1_v3s2_579, uinp0_v2s1_580, uinp1_v2s1_580, selectBar_v2, select_v2 );
bdd_MUX unode_v2s6_611 ( uinp0_v3s2_579, uinp0_v2s6_611, uinp1_v2s6_611, selectBar_v2, select_v2 );
bdd_MUX unode_v4s12_581 ( uinp1_v2s1_580, uinp0_v4s13_101, uinp0_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX unode_v4s15_596 ( uinp0_v2s1_580, uinp0_v4s15_596, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s14_612 ( uinp1_v2s6_611, uinp0_v4s14_612, uinp1_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX unode_v4s4_627 ( uinp0_v2s6_611, uinp0_v4s18_243, uinp1_v4s4_627, selectBar_v4, select_v4 );
bdd_MUX unode_v0s7_883 ( uinp1_v4s14_612, uinp0_v0s4_837, uinp1_v0s7_883, selectBar_v0, select_v0 );
bdd_MUX unode_v3s5_706 ( uinp_R_642, uinp0_v3s5_706, uinp1_v3s5_706, selectBar_v3, select_v3 );
bdd_MUX unode_v2s15_707 ( uinp1_v3s5_706, uinp0_v2s15_707, uinp1_v2s15_707, selectBar_v2, select_v2 );
bdd_MUX unode_v2s12_738 ( uinp0_v3s5_706, uinp0_v2s12_738, uinp1_v2s12_738, selectBar_v2, select_v2 );
bdd_MUX unode_v4s17_708 ( uinp1_v2s15_707, uinp0_v4s17_708, uinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s10_723 ( uinp0_v2s15_707, uinp0_v4s10_723, uinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX unode_v4s5_739 ( uinp1_v2s12_738, uinp0_v4s27_867, uinp1_v4s5_739, selectBar_v4, select_v4 );
bdd_MUX unode_v4s21_754 ( uinp0_v2s12_738, uinp0_v4s6_325, uinp0_v4s18_243, selectBar_v4, select_v4 );
bdd_pre_top unode_R_770 ( uinp1_v6s3_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v6s3_769, uinp_R_897, pre );
bdd_MUX unode_v3s3_834 ( uinp_R_770, uinp0_v3s3_834, uinp1_v3s3_834, selectBar_v3, select_v3 );
bdd_MUX unode_v2s3_835 ( uinp1_v3s3_834, uinp0_v2s3_835, uinp1_v2s3_835, selectBar_v2, select_v2 );
bdd_MUX unode_v2s16_866 ( uinp0_v3s3_834, uinp0_v2s16_866, uinp0_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX unode_v4s25_836 ( uinp1_v2s3_835, uinp1_v4s20_197, uinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s16_851 ( uinp0_v2s3_835, uinp0_v4s16_851, uinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s28_882 ( uinp0_v2s16_866, uinp0_v4s28_882, uinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX unode_v3s8_961 ( uinp_R_897, uinp0_v3s8_961, uinp1_v3s8_961, selectBar_v3, select_v3 );
bdd_MUX unode_v2s8_962 ( uinp1_v3s8_961, uinp0_v2s8_962, uinp1_v2s8_962, selectBar_v2, select_v2 );
bdd_MUX unode_v2s9_993 ( uinp0_v3s8_961, uinp0_v2s9_993, uinp1_v2s9_993, selectBar_v2, select_v2 );
bdd_MUX unode_v4s9_963 ( uinp1_v2s8_962, uinp0_v4s9_963, uinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX unode_v4s9_d_978 ( uinp0_v2s8_962, uinp1_v4s1_70, uinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX unode_v4s19_994 ( uinp1_v2s9_993, uinp0_v4s27_867, uinp1_v4s19_994, selectBar_v4, select_v4 );
bdd_MUX unode_v4s7_1009 ( uinp0_v2s9_993, uinp0_v4s6_325, uinp1_v4s7_1009, selectBar_v4, select_v4 );


//Complemented BDD
bdd_MUX cnode_v7s1_1 ( cOUTPUT, cinp0_v7s1_1, cinp1_v7s1_1, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s1_2 ( cinp1_v7s1_1, cinp0_v5s1_2, cinp1_v5s1_2, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s2_513 ( cinp0_v7s1_1, cinp0_v5s2_513, cinp1_v5s2_513, selectBar_v5, select_v5 );
bdd_MUX cnode_v6s4_3 ( cinp1_v5s1_2, cinp0_v6s4_3, cinp1_v6s4_3, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s2_258 ( cinp0_v5s1_2, cinp0_v6s2_258, cinp1_v6s2_258, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_4 ( cinp1_v6s4_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v6s4_3, cinp_R_131, pre );
bdd_MUX cnode_v3s1_68 ( cinp_R_4, cinp0_v3s1_68, cinp1_v3s1_68, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s14_69 ( cinp1_v3s1_68, cinp0_v2s14_69, cinp1_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s2_100 ( cinp0_v3s1_68, cinp0_v2s2_100, cinp1_v2s2_100, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s1_70 ( cinp1_v2s14_69, cinp0_v4s1_70, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s27_867 ( cinp0_v2s14_69, cinp0_v4s27_867, cinp1_v4s27_867, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s4_d_986 ( cinp1_v4s1_70, cinp_v0s4_986, cinp_v0s4_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s4_837 ( cinp0_v4s1_70, cinp0_v0s4_837, cinp1_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v1s1_1018 ( cinp_v0s4_986, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_1014 ( cinp0_v0s4_837, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v0s6_868 ( cinp1_v4s27_867, cinp0_v0s6_868, cinp_v0s4_986, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s2_1002 ( cinp0_v4s27_867, cinp0_v0s2_1002, cinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v1s1_d_965 ( cinp0_v0s6_868, INPUT1, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_d_1021 ( cinp0_v0s2_1002, INPUT0, INPUT0, selectBar_v1, select_v1 );
bdd_MUX cnode_v4s13_101 ( cinp1_v2s2_100, cinp0_v4s13_101, cinp0_v4s27_867, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s13_d_116 ( cinp0_v2s2_100, cinp_v4s13_116, cinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s8_964 ( cinp0_v4s13_101, cinp_v0s4_986, cinp1_v0s8_964, selectBar_v0, select_v0 );
bdd_MUX cnode_v0_d_731 ( cinp_v4s13_116, cinp0_v0s6_868, cinp0_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s6_195 ( cinp_R_131, cinp0_v3s6_195, cinp1_v3s6_195, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s4_196 ( cinp1_v3s6_195, cinp0_v2s4_196, cinp1_v2s4_196, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s13_227 ( cinp0_v3s6_195, cinp0_v2s13_227, cinp1_v2s13_227, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s20_197 ( cinp1_v2s4_196, cinp0_v4s20_197, cinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s3_212 ( cinp0_v2s4_196, cinp0_v4s3_212, cinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s12_844 ( cinp1_v4s20_197, cinp_v0s4_986, cinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_d_890 ( cinp1_v4s3_212, cinp_v0s10_890, cinp_v0s10_890, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s10_724 ( cinp0_v4s3_212, cinp0_v0s4_837, cinp1_v0s10_724, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s1_894 ( cinp_v0s10_890, INPUT1, INPUT0, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s8_228 ( cinp1_v2s13_227, cinp0_v4s8_228, cinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s18_243 ( cinp0_v2s13_227, cinp0_v4s18_243, cinp1_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s3_236 ( cinp0_v4s8_228, cinp0_v0s3_236, cinp0_v0s6_868, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_d_995 ( cinp1_v4s18_243, cinp_v0s11_995, cinp_v0s11_995, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_755 ( cinp0_v4s18_243, cinp_v0s4_986, cinp1_v0s11_755, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_999 ( cinp_v0s11_995, INPUT0, INPUT1, selectBar_v0, select_v0 );
bdd_pre_top cnode_R_259 ( cinp1_v6s2_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v6s2_258, cinp_R_386, pre );
bdd_MUX cnode_v3s4_323 ( cinp_R_259, cinp0_v3s4_323, cinp1_v3s4_323, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s10_324 ( cinp1_v3s4_323, cinp0_v2s10_324, cinp1_v2s10_324, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s5_355 ( cinp0_v3s4_323, cinp0_v2s5_355, cinp1_v2s5_355, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s6_325 ( cinp1_v2s10_324, cinp0_v4s6_325, cinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s2_340 ( cinp0_v2s10_324, cinp1_v4s27_867, cinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s5_1017 ( cinp0_v4s6_325, cinp0_v0s5_1017, cinp0_v0s2_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s11_356 ( cinp1_v2s5_355, cinp0_v4s11_356, cinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s24_371 ( cinp0_v2s5_355, cinp0_v4s1_70, cinp1_v4s24_371, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s7_450 ( cinp_R_386, cinp0_v3s7_450, cinp1_v3s7_450, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s7_451 ( cinp1_v3s7_450, cinp0_v2s7_451, cinp1_v2s7_451, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s11_482 ( cinp0_v3s7_450, cinp0_v2s11_482, cinp1_v2s11_482, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s22_452 ( cinp1_v2s7_451, cinp1_v4s27_867, cinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s26_467 ( cinp0_v2s7_451, cinp1_v4s20_197, cinp1_v4s26_467, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s6_d_971 ( cinp1_v4s22_452, cinp0_v0s2_1002, cinp0_v0s2_1002, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s12_d_1010 ( cinp1_v4s26_467, cinp0_v0s4_837, cinp0_v0s4_837, selectBar_v0, select_v0 );
bdd_MUX cnode_v4s23_483 ( cinp1_v2s11_482, cinp0_v4s3_212, cinp1_v4s23_483, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s23_d_498 ( cinp0_v2s11_482, cinp0_v4s13_101, cinp0_v4s13_101, selectBar_v4, select_v4 );
bdd_MUX cnode_v6s1_514 ( cinp1_v5s2_513, cinp0_v6s1_514, cinp1_v6s1_514, selectBar_v6, select_v6 );
bdd_MUX cnode_v6s3_769 ( cinp0_v5s2_513, cinp0_v6s3_769, cinp1_v6s3_769, selectBar_v6, select_v6 );
bdd_pre_top cnode_R_515 ( cinp1_v6s1_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v6s1_514, cinp_R_642, pre );
bdd_MUX cnode_v3s2_579 ( cinp_R_515, cinp0_v3s2_579, cinp1_v3s2_579, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s1_580 ( cinp1_v3s2_579, cinp0_v2s1_580, cinp1_v2s1_580, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s6_611 ( cinp0_v3s2_579, cinp0_v2s6_611, cinp1_v2s6_611, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s12_581 ( cinp1_v2s1_580, cinp0_v4s13_101, cinp0_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s15_596 ( cinp0_v2s1_580, cinp0_v4s15_596, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s14_612 ( cinp1_v2s6_611, cinp0_v4s14_612, cinp1_v4s18_243, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s4_627 ( cinp0_v2s6_611, cinp0_v4s18_243, cinp1_v4s4_627, selectBar_v4, select_v4 );
bdd_MUX cnode_v0s7_883 ( cinp1_v4s14_612, cinp0_v0s4_837, cinp1_v0s7_883, selectBar_v0, select_v0 );
bdd_MUX cnode_v3s5_706 ( cinp_R_642, cinp0_v3s5_706, cinp1_v3s5_706, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s15_707 ( cinp1_v3s5_706, cinp0_v2s15_707, cinp1_v2s15_707, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s12_738 ( cinp0_v3s5_706, cinp0_v2s12_738, cinp1_v2s12_738, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s17_708 ( cinp1_v2s15_707, cinp0_v4s17_708, cinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s10_723 ( cinp0_v2s15_707, cinp0_v4s10_723, cinp_v4s13_116, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s5_739 ( cinp1_v2s12_738, cinp0_v4s27_867, cinp1_v4s5_739, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s21_754 ( cinp0_v2s12_738, cinp0_v4s6_325, cinp0_v4s18_243, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_770 ( cinp1_v6s3_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v6s3_769, cinp_R_897, pre );
bdd_MUX cnode_v3s3_834 ( cinp_R_770, cinp0_v3s3_834, cinp1_v3s3_834, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s3_835 ( cinp1_v3s3_834, cinp0_v2s3_835, cinp1_v2s3_835, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s16_866 ( cinp0_v3s3_834, cinp0_v2s16_866, cinp0_v2s14_69, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s25_836 ( cinp1_v2s3_835, cinp1_v4s20_197, cinp0_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s16_851 ( cinp0_v2s3_835, cinp0_v4s16_851, cinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s28_882 ( cinp0_v2s16_866, cinp0_v4s28_882, cinp1_v4s3_212, selectBar_v4, select_v4 );
bdd_MUX cnode_v3s8_961 ( cinp_R_897, cinp0_v3s8_961, cinp1_v3s8_961, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s8_962 ( cinp1_v3s8_961, cinp0_v2s8_962, cinp1_v2s8_962, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s9_993 ( cinp0_v3s8_961, cinp0_v2s9_993, cinp1_v2s9_993, selectBar_v2, select_v2 );
bdd_MUX cnode_v4s9_963 ( cinp1_v2s8_962, cinp0_v4s9_963, cinp1_v4s22_452, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s9_d_978 ( cinp0_v2s8_962, cinp1_v4s1_70, cinp1_v4s1_70, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s19_994 ( cinp1_v2s9_993, cinp0_v4s27_867, cinp1_v4s19_994, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s7_1009 ( cinp0_v2s9_993, cinp0_v4s6_325, cinp1_v4s7_1009, selectBar_v4, select_v4 );

endmodule
