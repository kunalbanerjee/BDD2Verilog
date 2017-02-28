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
bdd_MUX unode_v0s1_1 ( uOUTPUT, uinp0_v0s1_1, uinp1_v0s1_1, selectBar_v0, select_v0 );
bdd_MUX unode_v7s1_2 ( uinp1_v0s1_1, uinp0_v7s1_2, uinp1_v7s1_2, selectBar_v7, select_v7 );
bdd_MUX unode_v7s2_513 ( uinp0_v0s1_1, uinp0_v7s2_513, uinp1_v7s2_513, selectBar_v7, select_v7 );
bdd_MUX unode_v5s1_3 ( uinp1_v7s1_2, uinp0_v5s1_3, uinp1_v5s1_3, selectBar_v5, select_v5 );
bdd_MUX unode_v5s2_258 ( uinp0_v7s1_2, uinp0_v5s2_258, uinp1_v5s2_258, selectBar_v5, select_v5 );
bdd_pre_top unode_R_4 ( uinp1_v5s1_3, uinp_R_4, pre );
bdd_pre_top unode_R_131 ( uinp0_v5s1_3, uinp_R_131, pre );
bdd_MUX unode_v6s1_68 ( uinp_R_4, uinp0_v6s1_68, uinp1_v6s1_68, selectBar_v6, select_v6 );
bdd_MUX unode_v4s13_69 ( uinp1_v6s1_68, uinp0_v4s13_69, uinp1_v4s13_69, selectBar_v4, select_v4 );
bdd_MUX unode_v4s16_100 ( uinp0_v6s1_68, uinp0_v4s16_100, uinp1_v4s16_100, selectBar_v4, select_v4 );
bdd_MUX unode_v2s22_70 ( uinp1_v4s13_69, uinp0_v2s22_70, uinp1_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX unode_v2s3_882 ( uinp0_v4s13_69, uinp0_v2s3_882, uinp1_v2s3_882, selectBar_v2, select_v2 );
bdd_MUX unode_v1s9_d_71 ( uinp1_v2s22_70, uinp_v1s9_71, uinp_v1s9_71, selectBar_v1, select_v1 );
bdd_MUX unode_v1s9_628 ( uinp0_v2s22_70, uinp0_v1s9_628, uinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX unode_v3s2_1021 ( uinp_v1s9_71, INPUT0, INPUT1, selectBar_v3, select_v3 );
bdd_MUX unode_v3s2_d_1006 ( uinp1_v1s9_628, INPUT0, INPUT0, selectBar_v3, select_v3 );
bdd_MUX unode_v1s2_d_883 ( uinp1_v2s3_882, uinp_v1s2_883, uinp_v1s2_883, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_890 ( uinp0_v2s3_882, uinp0_v1s2_890, uinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX unode_v3_d_999 ( uinp_v1s2_883, INPUT1, INPUT1, selectBar_v3, select_v3 );
bdd_MUX unode_v3s1_1018 ( uinp1_v1s2_890, INPUT1, INPUT0, selectBar_v3, select_v3 );
bdd_MUX unode_v2s9_101 ( uinp1_v4s16_100, uinp0_v2s22_70, uinp1_v2s9_101, selectBar_v2, select_v2 );
bdd_MUX unode_v2s28_116 ( uinp0_v4s16_100, uinp0_v2s28_116, uinp1_v2s28_116, selectBar_v2, select_v2 );
bdd_MUX unode_v1s9_d_1010 ( uinp1_v2s9_101, uinp_v1s9_1010, uinp_v1s9_1010, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_1014 ( uinp_v1s9_1010, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v1s11_852 ( uinp1_v2s28_116, uinp_v1s9_71, uinp1_v1s11_852, selectBar_v1, select_v1 );
bdd_MUX unode_v6s2_195 ( uinp_R_131, uinp0_v6s2_195, uinp1_v6s2_195, selectBar_v6, select_v6 );
bdd_MUX unode_v4s2_196 ( uinp1_v6s2_195, uinp0_v4s2_196, uinp1_v4s2_196, selectBar_v4, select_v4 );
bdd_MUX unode_v4s4_227 ( uinp0_v6s2_195, uinp0_v4s4_227, uinp1_v4s4_227, selectBar_v4, select_v4 );
bdd_MUX unode_v2s6_197 ( uinp1_v4s2_196, uinp0_v2s6_197, uinp1_v2s6_197, selectBar_v2, select_v2 );
bdd_MUX unode_v2s15_212 ( uinp0_v4s2_196, uinp0_v2s15_212, uinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX unode_v1s8_747 ( uinp1_v2s6_197, uinp0_v1s8_747, uinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX unode_v1s7_995 ( uinp0_v2s6_197, uinp0_v1s7_995, uinp_v1s2_883, selectBar_v1, select_v1 );
bdd_MUX unode_v2s5_d_228 ( uinp1_v4s4_227, uinp_v2s5_228, uinp_v2s5_228, selectBar_v2, select_v2 );
bdd_MUX unode_v2s5_243 ( uinp0_v4s4_227, uinp1_v2s6_197, uinp1_v2s5_243, selectBar_v2, select_v2 );
bdd_MUX unode_v2s29_236 ( uinp_v2s5_228, uinp0_v2s29_236, uinp_v1s9_71, selectBar_v2, select_v2 );
bdd_MUX unode_v1s6_968 ( uinp0_v2s29_236, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_pre_top unode_R_259 ( uinp1_v5s2_258, uinp_R_259, pre );
bdd_pre_top unode_R_386 ( uinp0_v5s2_258, uinp_R_386, pre );
bdd_MUX unode_v6s5_323 ( uinp_R_259, uinp0_v6s5_323, uinp1_v6s5_323, selectBar_v6, select_v6 );
bdd_MUX unode_v4s7_324 ( uinp1_v6s5_323, uinp0_v4s7_324, uinp1_v4s7_324, selectBar_v4, select_v4 );
bdd_MUX unode_v4s8_355 ( uinp0_v6s5_323, uinp0_v4s8_355, uinp1_v4s8_355, selectBar_v4, select_v4 );
bdd_MUX unode_v2s21_325 ( uinp1_v4s7_324, uinp0_v2s22_70, uinp1_v2s21_325, selectBar_v2, select_v2 );
bdd_MUX unode_v2s24_340 ( uinp0_v4s7_324, uinp1_v2s28_116, uinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX unode_v2s25_356 ( uinp1_v4s8_355, uinp0_v2s22_70, uinp1_v2s25_356, selectBar_v2, select_v2 );
bdd_MUX unode_v2s14_371 ( uinp0_v4s8_355, uinp0_v2s14_371, uinp0_v2s6_197, selectBar_v2, select_v2 );
bdd_MUX unode_v1s4_716 ( uinp1_v2s25_356, uinp1_v1s2_890, uinp1_v1s4_716, selectBar_v1, select_v1 );
bdd_MUX unode_v1s5_971 ( uinp0_v2s14_371, uinp1_v1s2_890, uinp_v1s9_71, selectBar_v1, select_v1 );
bdd_MUX unode_v6s6_450 ( uinp_R_386, uinp0_v6s6_450, uinp1_v6s6_450, selectBar_v6, select_v6 );
bdd_MUX unode_v4s3_451 ( uinp1_v6s6_450, uinp0_v4s3_451, uinp1_v4s3_451, selectBar_v4, select_v4 );
bdd_MUX unode_v4s6_482 ( uinp0_v6s6_450, uinp0_v4s6_482, uinp1_v4s6_482, selectBar_v4, select_v4 );
bdd_MUX unode_v2s7_723 ( uinp1_v4s3_451, uinp0_v2s14_371, uinp1_v2s7_723, selectBar_v2, select_v2 );
bdd_MUX unode_v2s20_467 ( uinp0_v4s3_451, uinp1_v2s28_116, uinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX unode_v1s5_d_724 ( uinp1_v2s7_723, uinp1_v1s2_890, uinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX unode_v1s11_d_1002 ( uinp1_v2s20_467, uinp1_v1s9_628, uinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX unode_v2s10_483 ( uinp1_v4s6_482, uinp1_v2s7_723, uinp1_v2s10_483, selectBar_v2, select_v2 );
bdd_MUX unode_v2s10_d_498 ( uinp0_v4s6_482, uinp_v2s10_498, uinp_v2s10_498, selectBar_v2, select_v2 );
bdd_MUX unode_v1s10_1017 ( uinp0_v2s10_483, uinp_v1s9_71, uinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX unode_v2s4_506 ( uinp_v2s10_498, uinp1_v1s2_890, uinp_v1s9_71, selectBar_v2, select_v2 );
bdd_MUX unode_v5s4_514 ( uinp1_v7s2_513, uinp0_v5s4_514, uinp1_v5s4_514, selectBar_v5, select_v5 );
bdd_MUX unode_v5s3_769 ( uinp0_v7s2_513, uinp0_v5s3_769, uinp1_v5s3_769, selectBar_v5, select_v5 );
bdd_pre_top unode_R_515 ( uinp1_v5s4_514, uinp_R_515, pre );
bdd_pre_top unode_R_642 ( uinp0_v5s4_514, uinp_R_642, pre );
bdd_MUX unode_v6s4_579 ( uinp_R_515, uinp0_v6s4_579, uinp1_v6s4_579, selectBar_v6, select_v6 );
bdd_MUX unode_v4s5_580 ( uinp1_v6s4_579, uinp0_v4s5_580, uinp1_v4s5_580, selectBar_v4, select_v4 );
bdd_MUX unode_v4s12_611 ( uinp0_v6s4_579, uinp0_v4s12_611, uinp1_v4s12_611, selectBar_v4, select_v4 );
bdd_MUX unode_v2s11_994 ( uinp1_v4s5_580, uinp0_v2s11_994, uinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX unode_v2s8_596 ( uinp0_v4s5_580, uinp0_v2s10_483, uinp1_v2s8_596, selectBar_v2, select_v2 );
bdd_MUX unode_v2s1_d_612 ( uinp1_v4s12_611, uinp_v2s1_612, uinp_v2s1_612, selectBar_v2, select_v2 );
bdd_MUX unode_v2s1_627 ( uinp0_v4s12_611, uinp0_v2s1_627, uinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX unode_v2s17_620 ( uinp_v2s1_612, uinp0_v2s29_236, uinp1_v2s17_620, selectBar_v2, select_v2 );
bdd_MUX unode_v1s3_635 ( uinp0_v2s1_627, uinp0_v1s3_635, uinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX unode_v6s8_706 ( uinp_R_642, uinp0_v6s8_706, uinp1_v6s8_706, selectBar_v6, select_v6 );
bdd_MUX unode_v4s15_707 ( uinp1_v6s8_706, uinp1_v4s3_451, uinp1_v4s15_707, selectBar_v4, select_v4 );
bdd_MUX unode_v4s10_738 ( uinp0_v6s8_706, uinp0_v4s10_738, uinp1_v4s10_738, selectBar_v4, select_v4 );
bdd_MUX unode_v2s23_708 ( uinp1_v4s15_707, uinp1_v2s25_356, uinp1_v2s23_708, selectBar_v2, select_v2 );
bdd_MUX unode_v1s4_d_964 ( uinp1_v2s23_708, uinp0_v2s29_236, uinp0_v2s29_236, selectBar_v1, select_v1 );
bdd_MUX unode_v2s18_739 ( uinp1_v4s10_738, uinp1_v2s6_197, uinp0_v2s10_483, selectBar_v2, select_v2 );
bdd_MUX unode_v2s13_754 ( uinp0_v4s10_738, uinp0_v2s13_754, uinp1_v2s23_708, selectBar_v2, select_v2 );
bdd_pre_top unode_R_770 ( uinp1_v5s3_769, uinp_R_770, pre );
bdd_pre_top unode_R_897 ( uinp0_v5s3_769, uinp_R_897, pre );
bdd_MUX unode_v6s7_834 ( uinp_R_770, uinp0_v6s7_834, uinp1_v6s7_834, selectBar_v6, select_v6 );
bdd_MUX unode_v4s11_835 ( uinp1_v6s7_834, uinp0_v4s11_835, uinp1_v4s11_835, selectBar_v4, select_v4 );
bdd_MUX unode_v4s9_866 ( uinp0_v6s7_834, uinp0_v4s13_69, uinp1_v4s9_866, selectBar_v4, select_v4 );
bdd_MUX unode_v2s19_836 ( uinp1_v4s11_835, uinp0_v2s6_197, uinp1_v2s19_836, selectBar_v2, select_v2 );
bdd_MUX unode_v2s12_851 ( uinp0_v4s11_835, uinp0_v2s12_851, uinp1_v2s28_116, selectBar_v2, select_v2 );
bdd_MUX unode_v1s12_859 ( uinp0_v2s12_851, uinp1_v1s2_890, uinp1_v1s12_859, selectBar_v1, select_v1 );
bdd_MUX unode_v2s26_867 ( uinp1_v4s9_866, uinp0_v2s26_867, uinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX unode_v6s3_961 ( uinp_R_897, uinp0_v6s3_961, uinp1_v6s3_961, selectBar_v6, select_v6 );
bdd_MUX unode_v4s1_962 ( uinp1_v6s3_961, uinp0_v4s1_962, uinp1_v4s1_962, selectBar_v4, select_v4 );
bdd_MUX unode_v4s14_993 ( uinp0_v6s3_961, uinp0_v4s14_993, uinp1_v4s5_580, selectBar_v4, select_v4 );
bdd_MUX unode_v2s27_963 ( uinp1_v4s1_962, uinp0_v2s14_371, uinp1_v2s27_963, selectBar_v2, select_v2 );
bdd_MUX unode_v2s27_d_978 ( uinp0_v4s1_962, uinp_v2s27_978, uinp_v2s27_978, selectBar_v2, select_v2 );
bdd_MUX unode_v2s16_986 ( uinp_v2s27_978, uinp_v1s9_71, uinp1_v1s2_890, selectBar_v2, select_v2 );
bdd_MUX unode_v2s2_1009 ( uinp0_v4s14_993, uinp0_v2s10_483, uinp1_v2s2_1009, selectBar_v2, select_v2 );


//Complemented BDD
bdd_MUX cnode_v0s1_1 ( cOUTPUT, cinp0_v0s1_1, cinp1_v0s1_1, selectBar_v0, select_v0 );
bdd_MUX cnode_v7s1_2 ( cinp1_v0s1_1, cinp0_v7s1_2, cinp1_v7s1_2, selectBar_v7, select_v7 );
bdd_MUX cnode_v7s2_513 ( cinp0_v0s1_1, cinp0_v7s2_513, cinp1_v7s2_513, selectBar_v7, select_v7 );
bdd_MUX cnode_v5s1_3 ( cinp1_v7s1_2, cinp0_v5s1_3, cinp1_v5s1_3, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s2_258 ( cinp0_v7s1_2, cinp0_v5s2_258, cinp1_v5s2_258, selectBar_v5, select_v5 );
bdd_pre_top cnode_R_4 ( cinp1_v5s1_3, cinp_R_4, pre );
bdd_pre_top cnode_R_131 ( cinp0_v5s1_3, cinp_R_131, pre );
bdd_MUX cnode_v6s1_68 ( cinp_R_4, cinp0_v6s1_68, cinp1_v6s1_68, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s13_69 ( cinp1_v6s1_68, cinp0_v4s13_69, cinp1_v4s13_69, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s16_100 ( cinp0_v6s1_68, cinp0_v4s16_100, cinp1_v4s16_100, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s22_70 ( cinp1_v4s13_69, cinp0_v2s22_70, cinp1_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s3_882 ( cinp0_v4s13_69, cinp0_v2s3_882, cinp1_v2s3_882, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s9_d_71 ( cinp1_v2s22_70, cinp_v1s9_71, cinp_v1s9_71, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s9_628 ( cinp0_v2s22_70, cinp0_v1s9_628, cinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX cnode_v3s2_1021 ( cinp_v1s9_71, INPUT1, INPUT0, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s2_d_1006 ( cinp1_v1s9_628, INPUT1, INPUT1, selectBar_v3, select_v3 );
bdd_MUX cnode_v1s2_d_883 ( cinp1_v2s3_882, cinp_v1s2_883, cinp_v1s2_883, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_890 ( cinp0_v2s3_882, cinp0_v1s2_890, cinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX cnode_v3_d_999 ( cinp_v1s2_883, INPUT0, INPUT0, selectBar_v3, select_v3 );
bdd_MUX cnode_v3s1_1018 ( cinp1_v1s2_890, INPUT0, INPUT1, selectBar_v3, select_v3 );
bdd_MUX cnode_v2s9_101 ( cinp1_v4s16_100, cinp0_v2s22_70, cinp1_v2s9_101, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s28_116 ( cinp0_v4s16_100, cinp0_v2s28_116, cinp1_v2s28_116, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s9_d_1010 ( cinp1_v2s9_101, cinp_v1s9_1010, cinp_v1s9_1010, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_1014 ( cinp_v1s9_1010, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s11_852 ( cinp1_v2s28_116, cinp_v1s9_71, cinp1_v1s11_852, selectBar_v1, select_v1 );
bdd_MUX cnode_v6s2_195 ( cinp_R_131, cinp0_v6s2_195, cinp1_v6s2_195, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s2_196 ( cinp1_v6s2_195, cinp0_v4s2_196, cinp1_v4s2_196, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s4_227 ( cinp0_v6s2_195, cinp0_v4s4_227, cinp1_v4s4_227, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s6_197 ( cinp1_v4s2_196, cinp0_v2s6_197, cinp1_v2s6_197, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s15_212 ( cinp0_v4s2_196, cinp0_v2s15_212, cinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s8_747 ( cinp1_v2s6_197, cinp0_v1s8_747, cinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s7_995 ( cinp0_v2s6_197, cinp0_v1s7_995, cinp_v1s2_883, selectBar_v1, select_v1 );
bdd_MUX cnode_v2s5_d_228 ( cinp1_v4s4_227, cinp_v2s5_228, cinp_v2s5_228, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s5_243 ( cinp0_v4s4_227, cinp1_v2s6_197, cinp1_v2s5_243, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s29_236 ( cinp_v2s5_228, cinp0_v2s29_236, cinp_v1s9_71, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s6_968 ( cinp0_v2s29_236, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_pre_top cnode_R_259 ( cinp1_v5s2_258, cinp_R_259, pre );
bdd_pre_top cnode_R_386 ( cinp0_v5s2_258, cinp_R_386, pre );
bdd_MUX cnode_v6s5_323 ( cinp_R_259, cinp0_v6s5_323, cinp1_v6s5_323, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s7_324 ( cinp1_v6s5_323, cinp0_v4s7_324, cinp1_v4s7_324, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s8_355 ( cinp0_v6s5_323, cinp0_v4s8_355, cinp1_v4s8_355, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s21_325 ( cinp1_v4s7_324, cinp0_v2s22_70, cinp1_v2s21_325, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s24_340 ( cinp0_v4s7_324, cinp1_v2s28_116, cinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s25_356 ( cinp1_v4s8_355, cinp0_v2s22_70, cinp1_v2s25_356, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s14_371 ( cinp0_v4s8_355, cinp0_v2s14_371, cinp0_v2s6_197, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s4_716 ( cinp1_v2s25_356, cinp1_v1s2_890, cinp1_v1s4_716, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s5_971 ( cinp0_v2s14_371, cinp1_v1s2_890, cinp_v1s9_71, selectBar_v1, select_v1 );
bdd_MUX cnode_v6s6_450 ( cinp_R_386, cinp0_v6s6_450, cinp1_v6s6_450, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s3_451 ( cinp1_v6s6_450, cinp0_v4s3_451, cinp1_v4s3_451, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s6_482 ( cinp0_v6s6_450, cinp0_v4s6_482, cinp1_v4s6_482, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s7_723 ( cinp1_v4s3_451, cinp0_v2s14_371, cinp1_v2s7_723, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s20_467 ( cinp0_v4s3_451, cinp1_v2s28_116, cinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s5_d_724 ( cinp1_v2s7_723, cinp1_v1s2_890, cinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s11_d_1002 ( cinp1_v2s20_467, cinp1_v1s9_628, cinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX cnode_v2s10_483 ( cinp1_v4s6_482, cinp1_v2s7_723, cinp1_v2s10_483, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s10_d_498 ( cinp0_v4s6_482, cinp_v2s10_498, cinp_v2s10_498, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s10_1017 ( cinp0_v2s10_483, cinp_v1s9_71, cinp1_v1s2_890, selectBar_v1, select_v1 );
bdd_MUX cnode_v2s4_506 ( cinp_v2s10_498, cinp1_v1s2_890, cinp_v1s9_71, selectBar_v2, select_v2 );
bdd_MUX cnode_v5s4_514 ( cinp1_v7s2_513, cinp0_v5s4_514, cinp1_v5s4_514, selectBar_v5, select_v5 );
bdd_MUX cnode_v5s3_769 ( cinp0_v7s2_513, cinp0_v5s3_769, cinp1_v5s3_769, selectBar_v5, select_v5 );
bdd_pre_top cnode_R_515 ( cinp1_v5s4_514, cinp_R_515, pre );
bdd_pre_top cnode_R_642 ( cinp0_v5s4_514, cinp_R_642, pre );
bdd_MUX cnode_v6s4_579 ( cinp_R_515, cinp0_v6s4_579, cinp1_v6s4_579, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s5_580 ( cinp1_v6s4_579, cinp0_v4s5_580, cinp1_v4s5_580, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s12_611 ( cinp0_v6s4_579, cinp0_v4s12_611, cinp1_v4s12_611, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s11_994 ( cinp1_v4s5_580, cinp0_v2s11_994, cinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s8_596 ( cinp0_v4s5_580, cinp0_v2s10_483, cinp1_v2s8_596, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s1_d_612 ( cinp1_v4s12_611, cinp_v2s1_612, cinp_v2s1_612, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s1_627 ( cinp0_v4s12_611, cinp0_v2s1_627, cinp0_v2s22_70, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s17_620 ( cinp_v2s1_612, cinp0_v2s29_236, cinp1_v2s17_620, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s3_635 ( cinp0_v2s1_627, cinp0_v1s3_635, cinp1_v1s9_628, selectBar_v1, select_v1 );
bdd_MUX cnode_v6s8_706 ( cinp_R_642, cinp0_v6s8_706, cinp1_v6s8_706, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s15_707 ( cinp1_v6s8_706, cinp1_v4s3_451, cinp1_v4s15_707, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s10_738 ( cinp0_v6s8_706, cinp0_v4s10_738, cinp1_v4s10_738, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s23_708 ( cinp1_v4s15_707, cinp1_v2s25_356, cinp1_v2s23_708, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s4_d_964 ( cinp1_v2s23_708, cinp0_v2s29_236, cinp0_v2s29_236, selectBar_v1, select_v1 );
bdd_MUX cnode_v2s18_739 ( cinp1_v4s10_738, cinp1_v2s6_197, cinp0_v2s10_483, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s13_754 ( cinp0_v4s10_738, cinp0_v2s13_754, cinp1_v2s23_708, selectBar_v2, select_v2 );
bdd_pre_top cnode_R_770 ( cinp1_v5s3_769, cinp_R_770, pre );
bdd_pre_top cnode_R_897 ( cinp0_v5s3_769, cinp_R_897, pre );
bdd_MUX cnode_v6s7_834 ( cinp_R_770, cinp0_v6s7_834, cinp1_v6s7_834, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s11_835 ( cinp1_v6s7_834, cinp0_v4s11_835, cinp1_v4s11_835, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s9_866 ( cinp0_v6s7_834, cinp0_v4s13_69, cinp1_v4s9_866, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s19_836 ( cinp1_v4s11_835, cinp0_v2s6_197, cinp1_v2s19_836, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s12_851 ( cinp0_v4s11_835, cinp0_v2s12_851, cinp1_v2s28_116, selectBar_v2, select_v2 );
bdd_MUX cnode_v1s12_859 ( cinp0_v2s12_851, cinp1_v1s2_890, cinp1_v1s12_859, selectBar_v1, select_v1 );
bdd_MUX cnode_v2s26_867 ( cinp1_v4s9_866, cinp0_v2s26_867, cinp1_v2s20_467, selectBar_v2, select_v2 );
bdd_MUX cnode_v6s3_961 ( cinp_R_897, cinp0_v6s3_961, cinp1_v6s3_961, selectBar_v6, select_v6 );
bdd_MUX cnode_v4s1_962 ( cinp1_v6s3_961, cinp0_v4s1_962, cinp1_v4s1_962, selectBar_v4, select_v4 );
bdd_MUX cnode_v4s14_993 ( cinp0_v6s3_961, cinp0_v4s14_993, cinp1_v4s5_580, selectBar_v4, select_v4 );
bdd_MUX cnode_v2s27_963 ( cinp1_v4s1_962, cinp0_v2s14_371, cinp1_v2s27_963, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s27_d_978 ( cinp0_v4s1_962, cinp_v2s27_978, cinp_v2s27_978, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s16_986 ( cinp_v2s27_978, cinp_v1s9_71, cinp1_v1s2_890, selectBar_v2, select_v2 );
bdd_MUX cnode_v2s2_1009 ( cinp0_v4s14_993, cinp0_v2s10_483, cinp1_v2s2_1009, selectBar_v2, select_v2 );

endmodule
