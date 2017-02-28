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
bdd_MUX unode_v3_2 ( uinp1_v0_1, uinp0_v3_2, uinp1_v3_2, selectBar_v3, select_v3 );
bdd_MUX unode_v3p_17 ( uinp0_v0_1, uinp0_v3p_17, uinp1_v3p_17, selectBar_v3, select_v3 );
bdd_MUX unode_v1s1_3 ( uinp1_v3_2, uinp0_v1s1_3, uinp1_v1s1_3, selectBar_v1, select_v1 );
bdd_MUX unode_v1s1_d_10 ( uinp0_v3_2, uinp_v1s1_10, uinp_v1s1_10, selectBar_v1, select_v1 );
bdd_MUX unode_v2p1_d_4 ( uinp1_v1s1_3, INPUT1, INPUT1, selectBar_v2, select_v2 );
bdd_MUX unode_v2p1_7 ( uinp0_v1s1_3, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX unode_v1p_14 ( uinp_v1s1_10, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_d_18 ( uinp0_v3p_17, uinp_v1s2_18, uinp_v1s2_18, selectBar_v1, select_v1 );
bdd_MUX unode_v1s2_25 ( uinp1_v3p_17, uinp0_v1s2_25, uinp1_v1s2_25, selectBar_v1, select_v1 );
bdd_MUX unode_v2p2_26 ( uinp_v1s2_18, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX unode_v2p2_d_29 ( uinp1_v1s2_25, INPUT0, INPUT0, selectBar_v2, select_v2 );


//Complemented BDD
bdd_MUX cnode_v0_1 ( cOUTPUT, cinp0_v0_1, cinp1_v0_1, selectBar_v0, select_v0 );
bdd_MUX cnode_v3_2 ( cinp1_v0_1, cinp0_v3_2, cinp1_v3_2, selectBar_v3, select_v3 );
bdd_MUX cnode_v3p_17 ( cinp0_v0_1, cinp0_v3p_17, cinp1_v3p_17, selectBar_v3, select_v3 );
bdd_MUX cnode_v1s1_3 ( cinp1_v3_2, cinp0_v1s1_3, cinp1_v1s1_3, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s1_d_10 ( cinp0_v3_2, cinp_v1s1_10, cinp_v1s1_10, selectBar_v1, select_v1 );
bdd_MUX cnode_v2p1_d_4 ( cinp1_v1s1_3, INPUT0, INPUT0, selectBar_v2, select_v2 );
bdd_MUX cnode_v2p1_7 ( cinp0_v1s1_3, INPUT0, INPUT1, selectBar_v2, select_v2 );
bdd_MUX cnode_v1p_14 ( cinp_v1s1_10, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_d_18 ( cinp0_v3p_17, cinp_v1s2_18, cinp_v1s2_18, selectBar_v1, select_v1 );
bdd_MUX cnode_v1s2_25 ( cinp1_v3p_17, cinp0_v1s2_25, cinp1_v1s2_25, selectBar_v1, select_v1 );
bdd_MUX cnode_v2p2_26 ( cinp_v1s2_18, INPUT1, INPUT0, selectBar_v2, select_v2 );
bdd_MUX cnode_v2p2_d_29 ( cinp1_v1s2_25, INPUT1, INPUT1, selectBar_v2, select_v2 );

endmodule
