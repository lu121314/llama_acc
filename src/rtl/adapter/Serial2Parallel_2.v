// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module Serial2Parallel_2 (
  input  wire          input_valid,
  input  wire [15:0]   input_tdata,
  input  wire [5:0]    input_tuser,
  output wire          output_tvalid,
  output wire [2047:0] output_tdata,
  output wire [5:0]    output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire       [1791:0] t_output_tdata_128;
  wire       [1535:0] t_output_tdata_129;
  wire       [1279:0] t_output_tdata_130;
  wire       [1023:0] t_output_tdata_131;
  wire       [767:0]  t_output_tdata_132;
  wire       [511:0]  t_output_tdata_133;
  wire       [255:0]  t_output_tdata_134;
  reg        [15:0]   dataDly;
  reg        [5:0]    userDly;
  (* max_fanout = 100 , keep = "true" *) reg                 vldDly;
  (* max_fanout = 100 , keep = "true" *) reg                 outVld;
  (* max_fanout = 100 *) reg                 outVldCond;
  reg        [6:0]    cnt;
  wire                cntAboutToOvf;
  wire                cntOvf;
  wire       [15:0]   t_output_tdata;
  reg        [15:0]   t_output_tdata_1;
  reg        [15:0]   t_output_tdata_2;
  reg        [15:0]   t_output_tdata_3;
  reg        [15:0]   t_output_tdata_4;
  reg        [15:0]   t_output_tdata_5;
  reg        [15:0]   t_output_tdata_6;
  reg        [15:0]   t_output_tdata_7;
  reg        [15:0]   t_output_tdata_8;
  reg        [15:0]   t_output_tdata_9;
  reg        [15:0]   t_output_tdata_10;
  reg        [15:0]   t_output_tdata_11;
  reg        [15:0]   t_output_tdata_12;
  reg        [15:0]   t_output_tdata_13;
  reg        [15:0]   t_output_tdata_14;
  reg        [15:0]   t_output_tdata_15;
  reg        [15:0]   t_output_tdata_16;
  reg        [15:0]   t_output_tdata_17;
  reg        [15:0]   t_output_tdata_18;
  reg        [15:0]   t_output_tdata_19;
  reg        [15:0]   t_output_tdata_20;
  reg        [15:0]   t_output_tdata_21;
  reg        [15:0]   t_output_tdata_22;
  reg        [15:0]   t_output_tdata_23;
  reg        [15:0]   t_output_tdata_24;
  reg        [15:0]   t_output_tdata_25;
  reg        [15:0]   t_output_tdata_26;
  reg        [15:0]   t_output_tdata_27;
  reg        [15:0]   t_output_tdata_28;
  reg        [15:0]   t_output_tdata_29;
  reg        [15:0]   t_output_tdata_30;
  reg        [15:0]   t_output_tdata_31;
  reg        [15:0]   t_output_tdata_32;
  reg        [15:0]   t_output_tdata_33;
  reg        [15:0]   t_output_tdata_34;
  reg        [15:0]   t_output_tdata_35;
  reg        [15:0]   t_output_tdata_36;
  reg        [15:0]   t_output_tdata_37;
  reg        [15:0]   t_output_tdata_38;
  reg        [15:0]   t_output_tdata_39;
  reg        [15:0]   t_output_tdata_40;
  reg        [15:0]   t_output_tdata_41;
  reg        [15:0]   t_output_tdata_42;
  reg        [15:0]   t_output_tdata_43;
  reg        [15:0]   t_output_tdata_44;
  reg        [15:0]   t_output_tdata_45;
  reg        [15:0]   t_output_tdata_46;
  reg        [15:0]   t_output_tdata_47;
  reg        [15:0]   t_output_tdata_48;
  reg        [15:0]   t_output_tdata_49;
  reg        [15:0]   t_output_tdata_50;
  reg        [15:0]   t_output_tdata_51;
  reg        [15:0]   t_output_tdata_52;
  reg        [15:0]   t_output_tdata_53;
  reg        [15:0]   t_output_tdata_54;
  reg        [15:0]   t_output_tdata_55;
  reg        [15:0]   t_output_tdata_56;
  reg        [15:0]   t_output_tdata_57;
  reg        [15:0]   t_output_tdata_58;
  reg        [15:0]   t_output_tdata_59;
  reg        [15:0]   t_output_tdata_60;
  reg        [15:0]   t_output_tdata_61;
  reg        [15:0]   t_output_tdata_62;
  reg        [15:0]   t_output_tdata_63;
  reg        [15:0]   t_output_tdata_64;
  reg        [15:0]   t_output_tdata_65;
  reg        [15:0]   t_output_tdata_66;
  reg        [15:0]   t_output_tdata_67;
  reg        [15:0]   t_output_tdata_68;
  reg        [15:0]   t_output_tdata_69;
  reg        [15:0]   t_output_tdata_70;
  reg        [15:0]   t_output_tdata_71;
  reg        [15:0]   t_output_tdata_72;
  reg        [15:0]   t_output_tdata_73;
  reg        [15:0]   t_output_tdata_74;
  reg        [15:0]   t_output_tdata_75;
  reg        [15:0]   t_output_tdata_76;
  reg        [15:0]   t_output_tdata_77;
  reg        [15:0]   t_output_tdata_78;
  reg        [15:0]   t_output_tdata_79;
  reg        [15:0]   t_output_tdata_80;
  reg        [15:0]   t_output_tdata_81;
  reg        [15:0]   t_output_tdata_82;
  reg        [15:0]   t_output_tdata_83;
  reg        [15:0]   t_output_tdata_84;
  reg        [15:0]   t_output_tdata_85;
  reg        [15:0]   t_output_tdata_86;
  reg        [15:0]   t_output_tdata_87;
  reg        [15:0]   t_output_tdata_88;
  reg        [15:0]   t_output_tdata_89;
  reg        [15:0]   t_output_tdata_90;
  reg        [15:0]   t_output_tdata_91;
  reg        [15:0]   t_output_tdata_92;
  reg        [15:0]   t_output_tdata_93;
  reg        [15:0]   t_output_tdata_94;
  reg        [15:0]   t_output_tdata_95;
  reg        [15:0]   t_output_tdata_96;
  reg        [15:0]   t_output_tdata_97;
  reg        [15:0]   t_output_tdata_98;
  reg        [15:0]   t_output_tdata_99;
  reg        [15:0]   t_output_tdata_100;
  reg        [15:0]   t_output_tdata_101;
  reg        [15:0]   t_output_tdata_102;
  reg        [15:0]   t_output_tdata_103;
  reg        [15:0]   t_output_tdata_104;
  reg        [15:0]   t_output_tdata_105;
  reg        [15:0]   t_output_tdata_106;
  reg        [15:0]   t_output_tdata_107;
  reg        [15:0]   t_output_tdata_108;
  reg        [15:0]   t_output_tdata_109;
  reg        [15:0]   t_output_tdata_110;
  reg        [15:0]   t_output_tdata_111;
  reg        [15:0]   t_output_tdata_112;
  reg        [15:0]   t_output_tdata_113;
  reg        [15:0]   t_output_tdata_114;
  reg        [15:0]   t_output_tdata_115;
  reg        [15:0]   t_output_tdata_116;
  reg        [15:0]   t_output_tdata_117;
  reg        [15:0]   t_output_tdata_118;
  reg        [15:0]   t_output_tdata_119;
  reg        [15:0]   t_output_tdata_120;
  reg        [15:0]   t_output_tdata_121;
  reg        [15:0]   t_output_tdata_122;
  reg        [15:0]   t_output_tdata_123;
  reg        [15:0]   t_output_tdata_124;
  reg        [15:0]   t_output_tdata_125;
  reg        [15:0]   t_output_tdata_126;
  reg        [15:0]   t_output_tdata_127;

  assign t_output_tdata_128 = {t_output_tdata_16,{t_output_tdata_17,{t_output_tdata_18,{t_output_tdata_19,{t_output_tdata_20,{t_output_tdata_21,{t_output_tdata_22,{t_output_tdata_23,{t_output_tdata_24,{t_output_tdata_25,{t_output_tdata_26,{t_output_tdata_27,{t_output_tdata_28,{t_output_tdata_29,{t_output_tdata_30,{t_output_tdata_31,t_output_tdata_129}}}}}}}}}}}}}}}};
  assign t_output_tdata_129 = {t_output_tdata_32,{t_output_tdata_33,{t_output_tdata_34,{t_output_tdata_35,{t_output_tdata_36,{t_output_tdata_37,{t_output_tdata_38,{t_output_tdata_39,{t_output_tdata_40,{t_output_tdata_41,{t_output_tdata_42,{t_output_tdata_43,{t_output_tdata_44,{t_output_tdata_45,{t_output_tdata_46,{t_output_tdata_47,t_output_tdata_130}}}}}}}}}}}}}}}};
  assign t_output_tdata_130 = {t_output_tdata_48,{t_output_tdata_49,{t_output_tdata_50,{t_output_tdata_51,{t_output_tdata_52,{t_output_tdata_53,{t_output_tdata_54,{t_output_tdata_55,{t_output_tdata_56,{t_output_tdata_57,{t_output_tdata_58,{t_output_tdata_59,{t_output_tdata_60,{t_output_tdata_61,{t_output_tdata_62,{t_output_tdata_63,t_output_tdata_131}}}}}}}}}}}}}}}};
  assign t_output_tdata_131 = {t_output_tdata_64,{t_output_tdata_65,{t_output_tdata_66,{t_output_tdata_67,{t_output_tdata_68,{t_output_tdata_69,{t_output_tdata_70,{t_output_tdata_71,{t_output_tdata_72,{t_output_tdata_73,{t_output_tdata_74,{t_output_tdata_75,{t_output_tdata_76,{t_output_tdata_77,{t_output_tdata_78,{t_output_tdata_79,t_output_tdata_132}}}}}}}}}}}}}}}};
  assign t_output_tdata_132 = {t_output_tdata_80,{t_output_tdata_81,{t_output_tdata_82,{t_output_tdata_83,{t_output_tdata_84,{t_output_tdata_85,{t_output_tdata_86,{t_output_tdata_87,{t_output_tdata_88,{t_output_tdata_89,{t_output_tdata_90,{t_output_tdata_91,{t_output_tdata_92,{t_output_tdata_93,{t_output_tdata_94,{t_output_tdata_95,t_output_tdata_133}}}}}}}}}}}}}}}};
  assign t_output_tdata_133 = {t_output_tdata_96,{t_output_tdata_97,{t_output_tdata_98,{t_output_tdata_99,{t_output_tdata_100,{t_output_tdata_101,{t_output_tdata_102,{t_output_tdata_103,{t_output_tdata_104,{t_output_tdata_105,{t_output_tdata_106,{t_output_tdata_107,{t_output_tdata_108,{t_output_tdata_109,{t_output_tdata_110,{t_output_tdata_111,t_output_tdata_134}}}}}}}}}}}}}}}};
  assign t_output_tdata_134 = {t_output_tdata_112,{t_output_tdata_113,{t_output_tdata_114,{t_output_tdata_115,{t_output_tdata_116,{t_output_tdata_117,{t_output_tdata_118,{t_output_tdata_119,{t_output_tdata_120,{t_output_tdata_121,{t_output_tdata_122,{t_output_tdata_123,{t_output_tdata_124,{t_output_tdata_125,{t_output_tdata_126,t_output_tdata_127}}}}}}}}}}}}}}};
  assign cntAboutToOvf = (cnt == 7'h7e);
  assign cntOvf = (cnt == 7'h7f);
  assign t_output_tdata = dataDly;
  assign output_tdata = {t_output_tdata,{t_output_tdata_1,{t_output_tdata_2,{t_output_tdata_3,{t_output_tdata_4,{t_output_tdata_5,{t_output_tdata_6,{t_output_tdata_7,{t_output_tdata_8,{t_output_tdata_9,{t_output_tdata_10,{t_output_tdata_11,{t_output_tdata_12,{t_output_tdata_13,{t_output_tdata_14,{t_output_tdata_15,t_output_tdata_128}}}}}}}}}}}}}}}};
  assign output_tvalid = (outVldCond && vldDly);
  assign output_tuser = userDly;
  always @(posedge clk_0_clk) begin
    dataDly <= input_tdata;
    userDly <= input_tuser;
    if(vldDly) begin
      t_output_tdata_1 <= t_output_tdata;
    end
    if(vldDly) begin
      t_output_tdata_2 <= t_output_tdata_1;
    end
    if(vldDly) begin
      t_output_tdata_3 <= t_output_tdata_2;
    end
    if(vldDly) begin
      t_output_tdata_4 <= t_output_tdata_3;
    end
    if(vldDly) begin
      t_output_tdata_5 <= t_output_tdata_4;
    end
    if(vldDly) begin
      t_output_tdata_6 <= t_output_tdata_5;
    end
    if(vldDly) begin
      t_output_tdata_7 <= t_output_tdata_6;
    end
    if(vldDly) begin
      t_output_tdata_8 <= t_output_tdata_7;
    end
    if(vldDly) begin
      t_output_tdata_9 <= t_output_tdata_8;
    end
    if(vldDly) begin
      t_output_tdata_10 <= t_output_tdata_9;
    end
    if(vldDly) begin
      t_output_tdata_11 <= t_output_tdata_10;
    end
    if(vldDly) begin
      t_output_tdata_12 <= t_output_tdata_11;
    end
    if(vldDly) begin
      t_output_tdata_13 <= t_output_tdata_12;
    end
    if(vldDly) begin
      t_output_tdata_14 <= t_output_tdata_13;
    end
    if(vldDly) begin
      t_output_tdata_15 <= t_output_tdata_14;
    end
    if(vldDly) begin
      t_output_tdata_16 <= t_output_tdata_15;
    end
    if(vldDly) begin
      t_output_tdata_17 <= t_output_tdata_16;
    end
    if(vldDly) begin
      t_output_tdata_18 <= t_output_tdata_17;
    end
    if(vldDly) begin
      t_output_tdata_19 <= t_output_tdata_18;
    end
    if(vldDly) begin
      t_output_tdata_20 <= t_output_tdata_19;
    end
    if(vldDly) begin
      t_output_tdata_21 <= t_output_tdata_20;
    end
    if(vldDly) begin
      t_output_tdata_22 <= t_output_tdata_21;
    end
    if(vldDly) begin
      t_output_tdata_23 <= t_output_tdata_22;
    end
    if(vldDly) begin
      t_output_tdata_24 <= t_output_tdata_23;
    end
    if(vldDly) begin
      t_output_tdata_25 <= t_output_tdata_24;
    end
    if(vldDly) begin
      t_output_tdata_26 <= t_output_tdata_25;
    end
    if(vldDly) begin
      t_output_tdata_27 <= t_output_tdata_26;
    end
    if(vldDly) begin
      t_output_tdata_28 <= t_output_tdata_27;
    end
    if(vldDly) begin
      t_output_tdata_29 <= t_output_tdata_28;
    end
    if(vldDly) begin
      t_output_tdata_30 <= t_output_tdata_29;
    end
    if(vldDly) begin
      t_output_tdata_31 <= t_output_tdata_30;
    end
    if(vldDly) begin
      t_output_tdata_32 <= t_output_tdata_31;
    end
    if(vldDly) begin
      t_output_tdata_33 <= t_output_tdata_32;
    end
    if(vldDly) begin
      t_output_tdata_34 <= t_output_tdata_33;
    end
    if(vldDly) begin
      t_output_tdata_35 <= t_output_tdata_34;
    end
    if(vldDly) begin
      t_output_tdata_36 <= t_output_tdata_35;
    end
    if(vldDly) begin
      t_output_tdata_37 <= t_output_tdata_36;
    end
    if(vldDly) begin
      t_output_tdata_38 <= t_output_tdata_37;
    end
    if(vldDly) begin
      t_output_tdata_39 <= t_output_tdata_38;
    end
    if(vldDly) begin
      t_output_tdata_40 <= t_output_tdata_39;
    end
    if(vldDly) begin
      t_output_tdata_41 <= t_output_tdata_40;
    end
    if(vldDly) begin
      t_output_tdata_42 <= t_output_tdata_41;
    end
    if(vldDly) begin
      t_output_tdata_43 <= t_output_tdata_42;
    end
    if(vldDly) begin
      t_output_tdata_44 <= t_output_tdata_43;
    end
    if(vldDly) begin
      t_output_tdata_45 <= t_output_tdata_44;
    end
    if(vldDly) begin
      t_output_tdata_46 <= t_output_tdata_45;
    end
    if(vldDly) begin
      t_output_tdata_47 <= t_output_tdata_46;
    end
    if(vldDly) begin
      t_output_tdata_48 <= t_output_tdata_47;
    end
    if(vldDly) begin
      t_output_tdata_49 <= t_output_tdata_48;
    end
    if(vldDly) begin
      t_output_tdata_50 <= t_output_tdata_49;
    end
    if(vldDly) begin
      t_output_tdata_51 <= t_output_tdata_50;
    end
    if(vldDly) begin
      t_output_tdata_52 <= t_output_tdata_51;
    end
    if(vldDly) begin
      t_output_tdata_53 <= t_output_tdata_52;
    end
    if(vldDly) begin
      t_output_tdata_54 <= t_output_tdata_53;
    end
    if(vldDly) begin
      t_output_tdata_55 <= t_output_tdata_54;
    end
    if(vldDly) begin
      t_output_tdata_56 <= t_output_tdata_55;
    end
    if(vldDly) begin
      t_output_tdata_57 <= t_output_tdata_56;
    end
    if(vldDly) begin
      t_output_tdata_58 <= t_output_tdata_57;
    end
    if(vldDly) begin
      t_output_tdata_59 <= t_output_tdata_58;
    end
    if(vldDly) begin
      t_output_tdata_60 <= t_output_tdata_59;
    end
    if(vldDly) begin
      t_output_tdata_61 <= t_output_tdata_60;
    end
    if(vldDly) begin
      t_output_tdata_62 <= t_output_tdata_61;
    end
    if(vldDly) begin
      t_output_tdata_63 <= t_output_tdata_62;
    end
    if(vldDly) begin
      t_output_tdata_64 <= t_output_tdata_63;
    end
    if(vldDly) begin
      t_output_tdata_65 <= t_output_tdata_64;
    end
    if(vldDly) begin
      t_output_tdata_66 <= t_output_tdata_65;
    end
    if(vldDly) begin
      t_output_tdata_67 <= t_output_tdata_66;
    end
    if(vldDly) begin
      t_output_tdata_68 <= t_output_tdata_67;
    end
    if(vldDly) begin
      t_output_tdata_69 <= t_output_tdata_68;
    end
    if(vldDly) begin
      t_output_tdata_70 <= t_output_tdata_69;
    end
    if(vldDly) begin
      t_output_tdata_71 <= t_output_tdata_70;
    end
    if(vldDly) begin
      t_output_tdata_72 <= t_output_tdata_71;
    end
    if(vldDly) begin
      t_output_tdata_73 <= t_output_tdata_72;
    end
    if(vldDly) begin
      t_output_tdata_74 <= t_output_tdata_73;
    end
    if(vldDly) begin
      t_output_tdata_75 <= t_output_tdata_74;
    end
    if(vldDly) begin
      t_output_tdata_76 <= t_output_tdata_75;
    end
    if(vldDly) begin
      t_output_tdata_77 <= t_output_tdata_76;
    end
    if(vldDly) begin
      t_output_tdata_78 <= t_output_tdata_77;
    end
    if(vldDly) begin
      t_output_tdata_79 <= t_output_tdata_78;
    end
    if(vldDly) begin
      t_output_tdata_80 <= t_output_tdata_79;
    end
    if(vldDly) begin
      t_output_tdata_81 <= t_output_tdata_80;
    end
    if(vldDly) begin
      t_output_tdata_82 <= t_output_tdata_81;
    end
    if(vldDly) begin
      t_output_tdata_83 <= t_output_tdata_82;
    end
    if(vldDly) begin
      t_output_tdata_84 <= t_output_tdata_83;
    end
    if(vldDly) begin
      t_output_tdata_85 <= t_output_tdata_84;
    end
    if(vldDly) begin
      t_output_tdata_86 <= t_output_tdata_85;
    end
    if(vldDly) begin
      t_output_tdata_87 <= t_output_tdata_86;
    end
    if(vldDly) begin
      t_output_tdata_88 <= t_output_tdata_87;
    end
    if(vldDly) begin
      t_output_tdata_89 <= t_output_tdata_88;
    end
    if(vldDly) begin
      t_output_tdata_90 <= t_output_tdata_89;
    end
    if(vldDly) begin
      t_output_tdata_91 <= t_output_tdata_90;
    end
    if(vldDly) begin
      t_output_tdata_92 <= t_output_tdata_91;
    end
    if(vldDly) begin
      t_output_tdata_93 <= t_output_tdata_92;
    end
    if(vldDly) begin
      t_output_tdata_94 <= t_output_tdata_93;
    end
    if(vldDly) begin
      t_output_tdata_95 <= t_output_tdata_94;
    end
    if(vldDly) begin
      t_output_tdata_96 <= t_output_tdata_95;
    end
    if(vldDly) begin
      t_output_tdata_97 <= t_output_tdata_96;
    end
    if(vldDly) begin
      t_output_tdata_98 <= t_output_tdata_97;
    end
    if(vldDly) begin
      t_output_tdata_99 <= t_output_tdata_98;
    end
    if(vldDly) begin
      t_output_tdata_100 <= t_output_tdata_99;
    end
    if(vldDly) begin
      t_output_tdata_101 <= t_output_tdata_100;
    end
    if(vldDly) begin
      t_output_tdata_102 <= t_output_tdata_101;
    end
    if(vldDly) begin
      t_output_tdata_103 <= t_output_tdata_102;
    end
    if(vldDly) begin
      t_output_tdata_104 <= t_output_tdata_103;
    end
    if(vldDly) begin
      t_output_tdata_105 <= t_output_tdata_104;
    end
    if(vldDly) begin
      t_output_tdata_106 <= t_output_tdata_105;
    end
    if(vldDly) begin
      t_output_tdata_107 <= t_output_tdata_106;
    end
    if(vldDly) begin
      t_output_tdata_108 <= t_output_tdata_107;
    end
    if(vldDly) begin
      t_output_tdata_109 <= t_output_tdata_108;
    end
    if(vldDly) begin
      t_output_tdata_110 <= t_output_tdata_109;
    end
    if(vldDly) begin
      t_output_tdata_111 <= t_output_tdata_110;
    end
    if(vldDly) begin
      t_output_tdata_112 <= t_output_tdata_111;
    end
    if(vldDly) begin
      t_output_tdata_113 <= t_output_tdata_112;
    end
    if(vldDly) begin
      t_output_tdata_114 <= t_output_tdata_113;
    end
    if(vldDly) begin
      t_output_tdata_115 <= t_output_tdata_114;
    end
    if(vldDly) begin
      t_output_tdata_116 <= t_output_tdata_115;
    end
    if(vldDly) begin
      t_output_tdata_117 <= t_output_tdata_116;
    end
    if(vldDly) begin
      t_output_tdata_118 <= t_output_tdata_117;
    end
    if(vldDly) begin
      t_output_tdata_119 <= t_output_tdata_118;
    end
    if(vldDly) begin
      t_output_tdata_120 <= t_output_tdata_119;
    end
    if(vldDly) begin
      t_output_tdata_121 <= t_output_tdata_120;
    end
    if(vldDly) begin
      t_output_tdata_122 <= t_output_tdata_121;
    end
    if(vldDly) begin
      t_output_tdata_123 <= t_output_tdata_122;
    end
    if(vldDly) begin
      t_output_tdata_124 <= t_output_tdata_123;
    end
    if(vldDly) begin
      t_output_tdata_125 <= t_output_tdata_124;
    end
    if(vldDly) begin
      t_output_tdata_126 <= t_output_tdata_125;
    end
    if(vldDly) begin
      t_output_tdata_127 <= t_output_tdata_126;
    end
  end

  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      vldDly <= 1'b0;
      outVld <= 1'b0;
      outVldCond <= 1'b0;
      cnt <= 7'h0;
    end else begin
      vldDly <= input_valid;
      outVld <= input_valid;
      if(vldDly) begin
        cnt <= (cnt + 7'h01);
        if(cntAboutToOvf) begin
          outVldCond <= 1'b1;
        end
        if(cntOvf) begin
          outVldCond <= 1'b0;
          cnt <= 7'h0;
        end
      end
    end
  end


endmodule

//StreamFifo_34 replaced by StreamFifo_103

