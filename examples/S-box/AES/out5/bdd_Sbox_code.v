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
bdd_MUX unode_v6s1_1 ( uOUTPUT, uinp0_v6s1_1, uinp1_v6s1_1, selectBar_v6, select_v6 );
bdd_MUX unode_v1s1_2 ( uinp1_v6s1_1, uinp0_v1s1_2, uinp1_v1s1_2, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_513 ( uinp0_v6s1_1, uinp0_v1s2_513, uinp1_v1s2_513, selectBar_v1, select_v1 );
bdd_MUX unode_v4s4_3 ( uinp1_v1s1_2, uinp0_v4s4_3, uinp1_v4s4_3, selectBar_v4, select_v4 );
bdd_MUX unode_v4s2_258 ( uinp0_v1s1_2, uinp0_v4s2_258, uinp1_v4s2_258, selectBar_v4, select_v4 );
bdd_pre_top unode_R_4 ( uinp1_v4s4_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v4s4_3, uinp_R_131, pre );
bdd_MUX unode_v3s6_68 ( uinp_R_4, uinp0_v3s6_68, uinp1_v3s6_68, selectBar_v3, select_v3 );
bdd_MUX unode_v0s1_69 ( uinp1_v3s6_68, uinp0_v0s1_69, uinp1_v0s1_69, selectBar_v0, select_v0 );
bdd_MUX unode_v0s5_100 ( uinp0_v3s6_68, uinp0_v0s5_100, uinp1_v0s5_100, selectBar_v0, select_v0 );
bdd_MUX unode_v2s19_739 ( uinp1_v0s1_69, uinp0_v2s19_739, uinp1_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX unode_v2s3_851 ( uinp0_v0s1_69, uinp0_v2s3_851, uinp1_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX unode_v5s7_d_964 ( uinp1_v2s19_739, uinp_v5s7_964, uinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX unode_v5s7_979 ( uinp0_v2s19_739, uinp0_v5s7_979, uinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX unode_v7_d_968 ( uinp_v5s7_964, INPUT0, INPUT0, selectBar_v7, select_v7 );
bdd_MUX unode_v7s1_1021 ( uinp1_v5s7_979, INPUT1, INPUT0, selectBar_v7, select_v7 );
bdd_MUX unode_v7s1_d_1018 ( uinp0_v5s7_979, INPUT1, INPUT1, selectBar_v7, select_v7 );
bdd_MUX unode_v5s10_d_852 ( uinp1_v2s3_851, uinp_v5s10_852, uinp_v5s10_852, selectBar_v5, select_v5 );
bdd_MUX unode_v5s10_859 ( uinp0_v2s3_851, uinp1_v5s7_979, uinp1_v5s10_859, selectBar_v5, select_v5 );
bdd_MUX unode_v5s5_856 ( uinp_v5s10_852, INPUT0, INPUT1, selectBar_v5, select_v5 );
bdd_MUX unode_v7s2_975 ( uinp1_v5s10_859, INPUT0, INPUT1, selectBar_v7, select_v7 );
bdd_MUX unode_v2s9_d_101 ( uinp1_v0s5_100, uinp_v2s9_101, uinp_v2s9_101, selectBar_v2, select_v2 );
bdd_MUX unode_v2s9_116 ( uinp0_v0s5_100, uinp0_v2s9_116, uinp0_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX unode_v2s15_109 ( uinp_v2s9_101, uinp0_v2s15_109, uinp_v5s10_852, selectBar_v2, select_v2 );
bdd_MUX unode_v5s2_891 ( uinp0_v2s15_109, INPUT1, INPUT0, selectBar_v5, select_v5 );
bdd_MUX unode_v5s3_868 ( uinp0_v2s9_116, uinp1_v5s10_859, uinp1_v5s3_868, selectBar_v5, select_v5 );
bdd_MUX unode_v3s5_195 ( uinp_R_131, uinp0_v3s5_195, uinp1_v3s5_195, selectBar_v3, select_v3 );
bdd_MUX unode_v0s8_196 ( uinp1_v3s5_195, uinp0_v0s8_196, uinp1_v0s8_196, selectBar_v0, select_v0 );
bdd_MUX unode_v0s3_227 ( uinp0_v3s5_195, uinp0_v0s3_227, uinp1_v0s3_227, selectBar_v0, select_v0 );
bdd_MUX unode_v2s18_581 ( uinp1_v0s8_196, uinp0_v2s18_581, uinp1_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX unode_v2s22_371 ( uinp0_v0s8_196, uinp0_v2s9_116, uinp0_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX unode_v5s8_582 ( uinp1_v2s18_581, uinp0_v5s8_582, uinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX unode_v5s4_1017 ( uinp0_v2s18_581, uinp1_v5s7_979, uinp1_v5s4_1017, selectBar_v5, select_v5 );
bdd_MUX unode_v2s14_228 ( uinp1_v0s3_227, uinp0_v2s14_228, uinp1_v2s14_228, selectBar_v2, select_v2 );
bdd_MUX unode_v2s5_243 ( uinp0_v0s3_227, uinp0_v2s19_739, uinp1_v2s5_243, selectBar_v2, select_v2 );
bdd_MUX unode_v5s1_468 ( uinp1_v2s14_228, uinp1_v5s7_979, uinp1_v5s1_468, selectBar_v5, select_v5 );
bdd_MUX unode_v5s9_971 ( uinp0_v2s14_228, uinp1_v5s10_859, uinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_pre_top unode_R_259 ( uinp1_v4s2_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v4s2_258, uinp_R_386, pre );
bdd_MUX unode_v3s7_323 ( uinp_R_259, uinp0_v3s7_323, uinp1_v3s7_323, selectBar_v3, select_v3 );
bdd_MUX unode_v0s13_324 ( uinp1_v3s7_323, uinp0_v0s13_324, uinp1_v0s13_324, selectBar_v0, select_v0 );
bdd_MUX unode_v0s7_355 ( uinp0_v3s7_323, uinp0_v0s8_196, uinp1_v0s7_355, selectBar_v0, select_v0 );
bdd_MUX unode_v2s24_325 ( uinp1_v0s13_324, uinp0_v2s14_228, uinp1_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX unode_v2s4_340 ( uinp0_v0s13_324, uinp0_v2s19_739, uinp1_v2s4_340, selectBar_v2, select_v2 );
bdd_MUX unode_v5s12_499 ( uinp1_v2s4_340, uinp0_v5s12_499, uinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX unode_v2s1_356 ( uinp1_v0s7_355, uinp0_v2s1_356, uinp0_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX unode_v5s6_491 ( uinp0_v2s1_356, uinp1_v5s10_859, uinp1_v5s6_491, selectBar_v5, select_v5 );
bdd_MUX unode_v3s1_450 ( uinp_R_386, uinp0_v3s1_450, uinp1_v3s1_450, selectBar_v3, select_v3 );
bdd_MUX unode_v0s4_451 ( uinp1_v3s1_450, uinp0_v0s4_451, uinp1_v0s4_451, selectBar_v0, select_v0 );
bdd_MUX unode_v0s11_482 ( uinp0_v3s1_450, uinp0_v0s11_482, uinp1_v0s11_482, selectBar_v0, select_v0 );
bdd_MUX unode_v2s13_978 ( uinp1_v0s4_451, uinp0_v2s13_978, uinp0_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX unode_v2s12_467 ( uinp0_v0s4_451, uinp0_v2s9_116, uinp1_v2s14_228, selectBar_v2, select_v2 );
bdd_MUX unode_v5s7_d_1010 ( uinp0_v2s13_978, uinp1_v5s7_979, uinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX unode_v2s21_483 ( uinp1_v0s11_482, uinp0_v2s1_356, uinp1_v2s21_483, selectBar_v2, select_v2 );
bdd_MUX unode_v2s7_498 ( uinp0_v0s11_482, uinp0_v2s7_498, uinp1_v2s4_340, selectBar_v2, select_v2 );
bdd_MUX unode_v5s6_d_484 ( uinp1_v2s21_483, uinp0_v2s15_109, uinp0_v2s15_109, selectBar_v5, select_v5 );
bdd_MUX unode_v5s12_d_506 ( uinp0_v2s7_498, uinp1_v5s10_859, uinp1_v5s10_859, selectBar_v5, select_v5 );
bdd_MUX unode_v4s3_514 ( uinp1_v1s2_513, uinp0_v4s3_514, uinp1_v4s3_514, selectBar_v4, select_v4 );
bdd_MUX unode_v4s1_769 ( uinp0_v1s2_513, uinp0_v4s1_769, uinp1_v4s1_769, selectBar_v4, select_v4 );
bdd_pre_top unode_R_515 ( uinp1_v4s3_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v4s3_514, uinp_R_642, pre );
bdd_MUX unode_v3s8_579 ( uinp_R_515, uinp0_v3s8_579, uinp1_v3s8_579, selectBar_v3, select_v3 );
bdd_MUX unode_v0s14_580 ( uinp1_v3s8_579, uinp0_v0s14_580, uinp1_v0s8_196, selectBar_v0, select_v0 );
bdd_MUX unode_v0s14_d_611 ( uinp0_v3s8_579, uinp_v0s14_611, uinp_v0s14_611, selectBar_v0, select_v0 );
bdd_MUX unode_v2s17_596 ( uinp0_v0s14_580, uinp0_v2s17_596, uinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX unode_v5s11_709 ( uinp0_v2s17_596, uinp0_v5s11_709, uinp0_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX unode_v0s10_627 ( uinp_v0s14_611, uinp0_v0s10_627, uinp0_v2s3_851, selectBar_v0, select_v0 );
bdd_MUX unode_v2s8_635 ( uinp0_v0s10_627, uinp_v5s10_852, uinp1_v2s8_635, selectBar_v2, select_v2 );
bdd_MUX unode_v3s3_706 ( uinp_R_642, uinp0_v3s3_706, uinp1_v3s3_706, selectBar_v3, select_v3 );
bdd_MUX unode_v0s12_707 ( uinp1_v3s3_706, uinp0_v0s12_707, uinp1_v0s12_707, selectBar_v0, select_v0 );
bdd_MUX unode_v0s6_738 ( uinp0_v3s3_706, uinp0_v0s6_738, uinp1_v0s1_69, selectBar_v0, select_v0 );
bdd_MUX unode_v2s25_708 ( uinp1_v0s12_707, uinp0_v2s25_708, uinp0_v2s17_596, selectBar_v2, select_v2 );
bdd_MUX unode_v2s16_723 ( uinp0_v0s12_707, uinp0_v2s16_723, uinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX unode_v5s11_d_731 ( uinp0_v2s25_708, uinp0_v5s7_979, uinp0_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX unode_v2s11_754 ( uinp0_v0s6_738, uinp0_v2s3_851, uinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_pre_top unode_R_770 ( uinp1_v4s1_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v4s1_769, uinp_R_897, pre );
bdd_MUX unode_v3s2_834 ( uinp_R_770, uinp0_v3s2_834, uinp1_v3s2_834, selectBar_v3, select_v3 );
bdd_MUX unode_v0s2_835 ( uinp1_v3s2_834, uinp0_v0s1_69, uinp1_v0s2_835, selectBar_v0, select_v0 );
bdd_MUX unode_v0s9_866 ( uinp0_v3s2_834, uinp0_v0s9_866, uinp1_v0s9_866, selectBar_v0, select_v0 );
bdd_MUX unode_v2s10_836 ( uinp1_v0s2_835, uinp0_v2s9_116, uinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX unode_v2s23_867 ( uinp1_v0s9_866, uinp0_v2s23_867, uinp1_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX unode_v2s23_d_882 ( uinp0_v0s9_866, uinp_v2s23_882, uinp_v2s23_882, selectBar_v2, select_v2 );
bdd_MUX unode_v2s20_890 ( uinp_v2s23_882, uinp1_v5s10_859, uinp0_v2s15_109, selectBar_v2, select_v2 );
bdd_MUX unode_v3s4_961 ( uinp_R_897, uinp0_v3s4_961, uinp1_v3s4_961, selectBar_v3, select_v3 );
bdd_MUX unode_v0s15_962 ( uinp1_v3s4_961, uinp1_v0s4_451, uinp1_v0s15_962, selectBar_v0, select_v0 );
bdd_MUX unode_v0s15_d_993 ( uinp0_v3s4_961, uinp_v0s15_993, uinp_v0s15_993, selectBar_v0, select_v0 );
bdd_MUX unode_v2s2_963 ( uinp1_v0s15_962, uinp0_v2s14_228, uinp1_v2s2_963, selectBar_v2, select_v2 );
bdd_MUX unode_v2s6_1009 ( uinp_v0s15_993, uinp0_v2s18_581, uinp1_v2s6_1009, selectBar_v2, select_v2 );


//Complemented BDD
bdd_MUX cnode_v6s1_1 ( cOUTPUT, cinp0_v6s1_1, cinp1_v6s1_1, selectBar_v6, select_v6 );
bdd_MUX cnode_v1s1_2 ( cinp1_v6s1_1, cinp0_v1s1_2, cinp1_v1s1_2, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_513 ( cinp0_v6s1_1, cinp0_v1s2_513, cinp1_v1s2_513, selectBar_v1, select_v1 );
bdd_MUX cnode_v4s4_3 ( cinp1_v1s1_2, cinp0_v4s4_3, cinp1_v4s4_3, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s2_258 ( cinp0_v1s1_2, cinp0_v4s2_258, cinp1_v4s2_258, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_4 ( cinp1_v4s4_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v4s4_3, cinp_R_131, pre );
bdd_MUX cnode_v3s6_68 ( cinp_R_4, cinp0_v3s6_68, cinp1_v3s6_68, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s1_69 ( cinp1_v3s6_68, cinp0_v0s1_69, cinp1_v0s1_69, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s5_100 ( cinp0_v3s6_68, cinp0_v0s5_100, cinp1_v0s5_100, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s19_739 ( cinp1_v0s1_69, cinp0_v2s19_739, cinp1_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s3_851 ( cinp0_v0s1_69, cinp0_v2s3_851, cinp1_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s7_d_964 ( cinp1_v2s19_739, cinp_v5s7_964, cinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s7_979 ( cinp0_v2s19_739, cinp0_v5s7_979, cinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX cnode_v7_d_968 ( cinp_v5s7_964, INPUT1, INPUT1, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s1_1021 ( cinp1_v5s7_979, INPUT0, INPUT1, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s1_d_1018 ( cinp0_v5s7_979, INPUT0, INPUT0, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s10_d_852 ( cinp1_v2s3_851, cinp_v5s10_852, cinp_v5s10_852, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s10_859 ( cinp0_v2s3_851, cinp1_v5s7_979, cinp1_v5s10_859, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s5_856 ( cinp_v5s10_852, INPUT1, INPUT0, selectBar_v5, select_v5 );
bdd_MUX cnode_v7s2_975 ( cinp1_v5s10_859, INPUT1, INPUT0, selectBar_v7, select_v7 );
bdd_MUX cnode_v2s9_d_101 ( cinp1_v0s5_100, cinp_v2s9_101, cinp_v2s9_101, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s9_116 ( cinp0_v0s5_100, cinp0_v2s9_116, cinp0_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s15_109 ( cinp_v2s9_101, cinp0_v2s15_109, cinp_v5s10_852, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s2_891 ( cinp0_v2s15_109, INPUT0, INPUT1, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s3_868 ( cinp0_v2s9_116, cinp1_v5s10_859, cinp1_v5s3_868, selectBar_v5, select_v5 );
bdd_MUX cnode_v3s5_195 ( cinp_R_131, cinp0_v3s5_195, cinp1_v3s5_195, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s8_196 ( cinp1_v3s5_195, cinp0_v0s8_196, cinp1_v0s8_196, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s3_227 ( cinp0_v3s5_195, cinp0_v0s3_227, cinp1_v0s3_227, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s18_581 ( cinp1_v0s8_196, cinp0_v2s18_581, cinp1_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s22_371 ( cinp0_v0s8_196, cinp0_v2s9_116, cinp0_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s8_582 ( cinp1_v2s18_581, cinp0_v5s8_582, cinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s4_1017 ( cinp0_v2s18_581, cinp1_v5s7_979, cinp1_v5s4_1017, selectBar_v5, select_v5 );
bdd_MUX cnode_v2s14_228 ( cinp1_v0s3_227, cinp0_v2s14_228, cinp1_v2s14_228, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s5_243 ( cinp0_v0s3_227, cinp0_v2s19_739, cinp1_v2s5_243, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s1_468 ( cinp1_v2s14_228, cinp1_v5s7_979, cinp1_v5s1_468, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s9_971 ( cinp0_v2s14_228, cinp1_v5s10_859, cinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_pre_top cnode_R_259 ( cinp1_v4s2_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v4s2_258, cinp_R_386, pre );
bdd_MUX cnode_v3s7_323 ( cinp_R_259, cinp0_v3s7_323, cinp1_v3s7_323, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s13_324 ( cinp1_v3s7_323, cinp0_v0s13_324, cinp1_v0s13_324, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s7_355 ( cinp0_v3s7_323, cinp0_v0s8_196, cinp1_v0s7_355, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s24_325 ( cinp1_v0s13_324, cinp0_v2s14_228, cinp1_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s4_340 ( cinp0_v0s13_324, cinp0_v2s19_739, cinp1_v2s4_340, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s12_499 ( cinp1_v2s4_340, cinp0_v5s12_499, cinp_v5s7_964, selectBar_v5, select_v5 );
bdd_MUX cnode_v2s1_356 ( cinp1_v0s7_355, cinp0_v2s1_356, cinp0_v2s3_851, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s6_491 ( cinp0_v2s1_356, cinp1_v5s10_859, cinp1_v5s6_491, selectBar_v5, select_v5 );
bdd_MUX cnode_v3s1_450 ( cinp_R_386, cinp0_v3s1_450, cinp1_v3s1_450, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s4_451 ( cinp1_v3s1_450, cinp0_v0s4_451, cinp1_v0s4_451, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s11_482 ( cinp0_v3s1_450, cinp0_v0s11_482, cinp1_v0s11_482, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s13_978 ( cinp1_v0s4_451, cinp0_v2s13_978, cinp0_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s12_467 ( cinp0_v0s4_451, cinp0_v2s9_116, cinp1_v2s14_228, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s7_d_1010 ( cinp0_v2s13_978, cinp1_v5s7_979, cinp1_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX cnode_v2s21_483 ( cinp1_v0s11_482, cinp0_v2s1_356, cinp1_v2s21_483, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s7_498 ( cinp0_v0s11_482, cinp0_v2s7_498, cinp1_v2s4_340, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s6_d_484 ( cinp1_v2s21_483, cinp0_v2s15_109, cinp0_v2s15_109, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s12_d_506 ( cinp0_v2s7_498, cinp1_v5s10_859, cinp1_v5s10_859, selectBar_v5, select_v5 );
bdd_MUX cnode_v4s3_514 ( cinp1_v1s2_513, cinp0_v4s3_514, cinp1_v4s3_514, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s1_769 ( cinp0_v1s2_513, cinp0_v4s1_769, cinp1_v4s1_769, selectBar_v4, select_v4 );
bdd_pre_top cnode_R_515 ( cinp1_v4s3_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v4s3_514, cinp_R_642, pre );
bdd_MUX cnode_v3s8_579 ( cinp_R_515, cinp0_v3s8_579, cinp1_v3s8_579, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s14_580 ( cinp1_v3s8_579, cinp0_v0s14_580, cinp1_v0s8_196, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s14_d_611 ( cinp0_v3s8_579, cinp_v0s14_611, cinp_v0s14_611, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s17_596 ( cinp0_v0s14_580, cinp0_v2s17_596, cinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s11_709 ( cinp0_v2s17_596, cinp0_v5s11_709, cinp0_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX cnode_v0s10_627 ( cinp_v0s14_611, cinp0_v0s10_627, cinp0_v2s3_851, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s8_635 ( cinp0_v0s10_627, cinp_v5s10_852, cinp1_v2s8_635, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s3_706 ( cinp_R_642, cinp0_v3s3_706, cinp1_v3s3_706, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s12_707 ( cinp1_v3s3_706, cinp0_v0s12_707, cinp1_v0s12_707, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s6_738 ( cinp0_v3s3_706, cinp0_v0s6_738, cinp1_v0s1_69, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s25_708 ( cinp1_v0s12_707, cinp0_v2s25_708, cinp0_v2s17_596, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s16_723 ( cinp0_v0s12_707, cinp0_v2s16_723, cinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s11_d_731 ( cinp0_v2s25_708, cinp0_v5s7_979, cinp0_v5s7_979, selectBar_v5, select_v5 );
bdd_MUX cnode_v2s11_754 ( cinp0_v0s6_738, cinp0_v2s3_851, cinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_pre_top cnode_R_770 ( cinp1_v4s1_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v4s1_769, cinp_R_897, pre );
bdd_MUX cnode_v3s2_834 ( cinp_R_770, cinp0_v3s2_834, cinp1_v3s2_834, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s2_835 ( cinp1_v3s2_834, cinp0_v0s1_69, cinp1_v0s2_835, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s9_866 ( cinp0_v3s2_834, cinp0_v0s9_866, cinp1_v0s9_866, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s10_836 ( cinp1_v0s2_835, cinp0_v2s9_116, cinp0_v2s18_581, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s23_867 ( cinp1_v0s9_866, cinp0_v2s23_867, cinp1_v2s19_739, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s23_d_882 ( cinp0_v0s9_866, cinp_v2s23_882, cinp_v2s23_882, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s20_890 ( cinp_v2s23_882, cinp1_v5s10_859, cinp0_v2s15_109, selectBar_v2, select_v2 );
bdd_MUX cnode_v3s4_961 ( cinp_R_897, cinp0_v3s4_961, cinp1_v3s4_961, selectBar_v3, select_v3 );
bdd_MUX cnode_v0s15_962 ( cinp1_v3s4_961, cinp1_v0s4_451, cinp1_v0s15_962, selectBar_v0, select_v0 );
bdd_MUX cnode_v0s15_d_993 ( cinp0_v3s4_961, cinp_v0s15_993, cinp_v0s15_993, selectBar_v0, select_v0 );
bdd_MUX cnode_v2s2_963 ( cinp1_v0s15_962, cinp0_v2s14_228, cinp1_v2s2_963, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s6_1009 ( cinp_v0s15_993, cinp0_v2s18_581, cinp1_v2s6_1009, selectBar_v2, select_v2 );

endmodule
