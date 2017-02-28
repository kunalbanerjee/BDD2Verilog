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
bdd_MUX unode_v3_1 ( uOUTPUT, uinp0_v3_1, uinp1_v3_1, selectBar_v3, select_v3 );
bdd_MUX unode_v2_2 ( uinp1_v3_1, uinp0_v2_2, uinp1_v2_2, selectBar_v2, select_v2 );
bdd_MUX unode_v2_d_17 ( uinp0_v3_1, uinp_v2_17, uinp_v2_17, selectBar_v2, select_v2 );
bdd_MUX unode_v0_d_3 ( uinp0_v2_2, uinp_v0_3, uinp_v0_3, selectBar_v0, select_v0 );
bdd_MUX unode_v0_10 ( uinp1_v2_2, uinp0_v0_10, uinp1_v0_10, selectBar_v0, select_v0 );
bdd_MUX unode_v1_d_7 ( uinp_v0_3, INPUT0, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v1_11 ( uinp1_v0_10, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX unode_v1p_26 ( uinp0_v0_10, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX unode_v0p_25 ( uinp_v2_17, uinp0_v0p_25, uinp0_v0_10, selectBar_v0, select_v0 );
bdd_MUX unode_v1p_d_29 ( uinp0_v0p_25, INPUT1, INPUT1, selectBar_v1, select_v1 );


//Complemented BDD
bdd_MUX cnode_v3_1 ( cOUTPUT, cinp0_v3_1, cinp1_v3_1, selectBar_v3, select_v3 );
bdd_MUX cnode_v2_2 ( cinp1_v3_1, cinp0_v2_2, cinp1_v2_2, selectBar_v2, select_v2 );
bdd_MUX cnode_v2_d_17 ( cinp0_v3_1, cinp_v2_17, cinp_v2_17, selectBar_v2, select_v2 );
bdd_MUX cnode_v0_d_3 ( cinp0_v2_2, cinp_v0_3, cinp_v0_3, selectBar_v0, select_v0 );
bdd_MUX cnode_v0_10 ( cinp1_v2_2, cinp0_v0_10, cinp1_v0_10, selectBar_v0, select_v0 );
bdd_MUX cnode_v1_d_7 ( cinp_v0_3, INPUT1, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v1_11 ( cinp1_v0_10, INPUT1, INPUT0, selectBar_v1, select_v1 );
bdd_MUX cnode_v1p_26 ( cinp0_v0_10, INPUT0, INPUT1, selectBar_v1, select_v1 );
bdd_MUX cnode_v0p_25 ( cinp_v2_17, cinp0_v0p_25, cinp0_v0_10, selectBar_v0, select_v0 );
bdd_MUX cnode_v1p_d_29 ( cinp0_v0p_25, INPUT0, INPUT0, selectBar_v1, select_v1 );

endmodule
