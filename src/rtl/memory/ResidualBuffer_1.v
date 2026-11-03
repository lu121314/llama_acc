// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module ResidualBuffer_1 (
  input  wire          serialIn_tvalid,
  input  wire [15:0]   serialIn_tdata,
  input  wire          parallelIn_tvalid,
  input  wire [2047:0] parallelIn_tdata,
  output wire          serialOut_tvalid,
  input  wire          serialOut_tready,
  output wire [15:0]   serialOut_tdata,
  output wire          parallelOut_tvalid,
  input  wire          parallelOut_tready,
  output wire [2047:0] parallelOut_tdata,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                resBuf_io_push_valid;
  wire       [2047:0] resBuf_io_push_payload;
  wire       [0:0]    deMux_io_select;
  wire                deMux_io_outputs_0_ready;
  wire                resBuf_io_push_ready;
  wire                resBuf_io_pop_valid;
  wire       [2047:0] resBuf_io_pop_payload;
  wire       [3:0]    resBuf_io_occupancy;
  wire       [3:0]    resBuf_io_availability;
  wire                deMux_io_input_ready;
  wire                deMux_io_outputs_0_valid;
  wire       [2047:0] deMux_io_outputs_0_payload;
  wire                deMux_io_outputs_1_valid;
  wire       [2047:0] deMux_io_outputs_1_payload;
  wire       [1791:0] t_adaptedSerial_payload_128;
  wire       [1535:0] t_adaptedSerial_payload_129;
  wire       [1279:0] t_adaptedSerial_payload_130;
  wire       [1023:0] t_adaptedSerial_payload_131;
  wire       [767:0]  t_adaptedSerial_payload_132;
  wire       [511:0]  t_adaptedSerial_payload_133;
  wire       [255:0]  t_adaptedSerial_payload_134;
  wire       [6:0]    t_t_serialOut_payload_1;
  wire       [0:0]    t_t_serialOut_payload_1_1;
  reg        [15:0]   t_serialOut_payload_4;
  (* max_fanout = 100 *) reg                 serialIn_valid;
  reg        [15:0]   serialIn_payload;
  (* max_fanout = 100 *) reg                 parallelIn_valid;
  reg        [2047:0] parallelIn_payload;
  reg                 inMuxSel;
  reg                 outMuxSel;
  reg        [7:0]    cnt;
  wire                cntAbout2Ovf;
  reg                 cntOvfReg;
  wire                adaptedSerial_valid;
  wire       [2047:0] adaptedSerial_payload;
  wire       [15:0]   t_adaptedSerial_payload;
  reg        [15:0]   t_adaptedSerial_payload_1;
  reg        [15:0]   t_adaptedSerial_payload_2;
  reg        [15:0]   t_adaptedSerial_payload_3;
  reg        [15:0]   t_adaptedSerial_payload_4;
  reg        [15:0]   t_adaptedSerial_payload_5;
  reg        [15:0]   t_adaptedSerial_payload_6;
  reg        [15:0]   t_adaptedSerial_payload_7;
  reg        [15:0]   t_adaptedSerial_payload_8;
  reg        [15:0]   t_adaptedSerial_payload_9;
  reg        [15:0]   t_adaptedSerial_payload_10;
  reg        [15:0]   t_adaptedSerial_payload_11;
  reg        [15:0]   t_adaptedSerial_payload_12;
  reg        [15:0]   t_adaptedSerial_payload_13;
  reg        [15:0]   t_adaptedSerial_payload_14;
  reg        [15:0]   t_adaptedSerial_payload_15;
  reg        [15:0]   t_adaptedSerial_payload_16;
  reg        [15:0]   t_adaptedSerial_payload_17;
  reg        [15:0]   t_adaptedSerial_payload_18;
  reg        [15:0]   t_adaptedSerial_payload_19;
  reg        [15:0]   t_adaptedSerial_payload_20;
  reg        [15:0]   t_adaptedSerial_payload_21;
  reg        [15:0]   t_adaptedSerial_payload_22;
  reg        [15:0]   t_adaptedSerial_payload_23;
  reg        [15:0]   t_adaptedSerial_payload_24;
  reg        [15:0]   t_adaptedSerial_payload_25;
  reg        [15:0]   t_adaptedSerial_payload_26;
  reg        [15:0]   t_adaptedSerial_payload_27;
  reg        [15:0]   t_adaptedSerial_payload_28;
  reg        [15:0]   t_adaptedSerial_payload_29;
  reg        [15:0]   t_adaptedSerial_payload_30;
  reg        [15:0]   t_adaptedSerial_payload_31;
  reg        [15:0]   t_adaptedSerial_payload_32;
  reg        [15:0]   t_adaptedSerial_payload_33;
  reg        [15:0]   t_adaptedSerial_payload_34;
  reg        [15:0]   t_adaptedSerial_payload_35;
  reg        [15:0]   t_adaptedSerial_payload_36;
  reg        [15:0]   t_adaptedSerial_payload_37;
  reg        [15:0]   t_adaptedSerial_payload_38;
  reg        [15:0]   t_adaptedSerial_payload_39;
  reg        [15:0]   t_adaptedSerial_payload_40;
  reg        [15:0]   t_adaptedSerial_payload_41;
  reg        [15:0]   t_adaptedSerial_payload_42;
  reg        [15:0]   t_adaptedSerial_payload_43;
  reg        [15:0]   t_adaptedSerial_payload_44;
  reg        [15:0]   t_adaptedSerial_payload_45;
  reg        [15:0]   t_adaptedSerial_payload_46;
  reg        [15:0]   t_adaptedSerial_payload_47;
  reg        [15:0]   t_adaptedSerial_payload_48;
  reg        [15:0]   t_adaptedSerial_payload_49;
  reg        [15:0]   t_adaptedSerial_payload_50;
  reg        [15:0]   t_adaptedSerial_payload_51;
  reg        [15:0]   t_adaptedSerial_payload_52;
  reg        [15:0]   t_adaptedSerial_payload_53;
  reg        [15:0]   t_adaptedSerial_payload_54;
  reg        [15:0]   t_adaptedSerial_payload_55;
  reg        [15:0]   t_adaptedSerial_payload_56;
  reg        [15:0]   t_adaptedSerial_payload_57;
  reg        [15:0]   t_adaptedSerial_payload_58;
  reg        [15:0]   t_adaptedSerial_payload_59;
  reg        [15:0]   t_adaptedSerial_payload_60;
  reg        [15:0]   t_adaptedSerial_payload_61;
  reg        [15:0]   t_adaptedSerial_payload_62;
  reg        [15:0]   t_adaptedSerial_payload_63;
  reg        [15:0]   t_adaptedSerial_payload_64;
  reg        [15:0]   t_adaptedSerial_payload_65;
  reg        [15:0]   t_adaptedSerial_payload_66;
  reg        [15:0]   t_adaptedSerial_payload_67;
  reg        [15:0]   t_adaptedSerial_payload_68;
  reg        [15:0]   t_adaptedSerial_payload_69;
  reg        [15:0]   t_adaptedSerial_payload_70;
  reg        [15:0]   t_adaptedSerial_payload_71;
  reg        [15:0]   t_adaptedSerial_payload_72;
  reg        [15:0]   t_adaptedSerial_payload_73;
  reg        [15:0]   t_adaptedSerial_payload_74;
  reg        [15:0]   t_adaptedSerial_payload_75;
  reg        [15:0]   t_adaptedSerial_payload_76;
  reg        [15:0]   t_adaptedSerial_payload_77;
  reg        [15:0]   t_adaptedSerial_payload_78;
  reg        [15:0]   t_adaptedSerial_payload_79;
  reg        [15:0]   t_adaptedSerial_payload_80;
  reg        [15:0]   t_adaptedSerial_payload_81;
  reg        [15:0]   t_adaptedSerial_payload_82;
  reg        [15:0]   t_adaptedSerial_payload_83;
  reg        [15:0]   t_adaptedSerial_payload_84;
  reg        [15:0]   t_adaptedSerial_payload_85;
  reg        [15:0]   t_adaptedSerial_payload_86;
  reg        [15:0]   t_adaptedSerial_payload_87;
  reg        [15:0]   t_adaptedSerial_payload_88;
  reg        [15:0]   t_adaptedSerial_payload_89;
  reg        [15:0]   t_adaptedSerial_payload_90;
  reg        [15:0]   t_adaptedSerial_payload_91;
  reg        [15:0]   t_adaptedSerial_payload_92;
  reg        [15:0]   t_adaptedSerial_payload_93;
  reg        [15:0]   t_adaptedSerial_payload_94;
  reg        [15:0]   t_adaptedSerial_payload_95;
  reg        [15:0]   t_adaptedSerial_payload_96;
  reg        [15:0]   t_adaptedSerial_payload_97;
  reg        [15:0]   t_adaptedSerial_payload_98;
  reg        [15:0]   t_adaptedSerial_payload_99;
  reg        [15:0]   t_adaptedSerial_payload_100;
  reg        [15:0]   t_adaptedSerial_payload_101;
  reg        [15:0]   t_adaptedSerial_payload_102;
  reg        [15:0]   t_adaptedSerial_payload_103;
  reg        [15:0]   t_adaptedSerial_payload_104;
  reg        [15:0]   t_adaptedSerial_payload_105;
  reg        [15:0]   t_adaptedSerial_payload_106;
  reg        [15:0]   t_adaptedSerial_payload_107;
  reg        [15:0]   t_adaptedSerial_payload_108;
  reg        [15:0]   t_adaptedSerial_payload_109;
  reg        [15:0]   t_adaptedSerial_payload_110;
  reg        [15:0]   t_adaptedSerial_payload_111;
  reg        [15:0]   t_adaptedSerial_payload_112;
  reg        [15:0]   t_adaptedSerial_payload_113;
  reg        [15:0]   t_adaptedSerial_payload_114;
  reg        [15:0]   t_adaptedSerial_payload_115;
  reg        [15:0]   t_adaptedSerial_payload_116;
  reg        [15:0]   t_adaptedSerial_payload_117;
  reg        [15:0]   t_adaptedSerial_payload_118;
  reg        [15:0]   t_adaptedSerial_payload_119;
  reg        [15:0]   t_adaptedSerial_payload_120;
  reg        [15:0]   t_adaptedSerial_payload_121;
  reg        [15:0]   t_adaptedSerial_payload_122;
  reg        [15:0]   t_adaptedSerial_payload_123;
  reg        [15:0]   t_adaptedSerial_payload_124;
  reg        [15:0]   t_adaptedSerial_payload_125;
  reg        [15:0]   t_adaptedSerial_payload_126;
  reg        [15:0]   t_adaptedSerial_payload_127;
  wire                serialOut_valid;
  wire                serialOut_ready;
  wire       [15:0]   serialOut_payload;
  wire                parallelOut_valid;
  wire                parallelOut_ready;
  wire       [2047:0] parallelOut_payload;
  wire                serialOut_fire;
  reg                 t_serialOut_payload;
  reg        [6:0]    t_serialOut_payload_1;
  reg        [6:0]    t_serialOut_payload_2;
  wire                t_io_outputs_0_ready;
  wire       [2047:0] t_serialOut_payload_3;
  reg        [3:0]    bufInCnt;
  wire                bufInCntOvf;
  wire                resBuf_resBuf_io_push_fire;
  reg        [3:0]    bufOutCnt;
  wire                bufOutCntOvf;
  wire                resBuf_resBuf_io_pop_fire;

  assign t_t_serialOut_payload_1_1 = t_serialOut_payload;
  assign t_t_serialOut_payload_1 = {6'd0, t_t_serialOut_payload_1_1};
  assign t_adaptedSerial_payload_128 = {t_adaptedSerial_payload_16,{t_adaptedSerial_payload_17,{t_adaptedSerial_payload_18,{t_adaptedSerial_payload_19,{t_adaptedSerial_payload_20,{t_adaptedSerial_payload_21,{t_adaptedSerial_payload_22,{t_adaptedSerial_payload_23,{t_adaptedSerial_payload_24,{t_adaptedSerial_payload_25,{t_adaptedSerial_payload_26,{t_adaptedSerial_payload_27,{t_adaptedSerial_payload_28,{t_adaptedSerial_payload_29,{t_adaptedSerial_payload_30,{t_adaptedSerial_payload_31,t_adaptedSerial_payload_129}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_129 = {t_adaptedSerial_payload_32,{t_adaptedSerial_payload_33,{t_adaptedSerial_payload_34,{t_adaptedSerial_payload_35,{t_adaptedSerial_payload_36,{t_adaptedSerial_payload_37,{t_adaptedSerial_payload_38,{t_adaptedSerial_payload_39,{t_adaptedSerial_payload_40,{t_adaptedSerial_payload_41,{t_adaptedSerial_payload_42,{t_adaptedSerial_payload_43,{t_adaptedSerial_payload_44,{t_adaptedSerial_payload_45,{t_adaptedSerial_payload_46,{t_adaptedSerial_payload_47,t_adaptedSerial_payload_130}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_130 = {t_adaptedSerial_payload_48,{t_adaptedSerial_payload_49,{t_adaptedSerial_payload_50,{t_adaptedSerial_payload_51,{t_adaptedSerial_payload_52,{t_adaptedSerial_payload_53,{t_adaptedSerial_payload_54,{t_adaptedSerial_payload_55,{t_adaptedSerial_payload_56,{t_adaptedSerial_payload_57,{t_adaptedSerial_payload_58,{t_adaptedSerial_payload_59,{t_adaptedSerial_payload_60,{t_adaptedSerial_payload_61,{t_adaptedSerial_payload_62,{t_adaptedSerial_payload_63,t_adaptedSerial_payload_131}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_131 = {t_adaptedSerial_payload_64,{t_adaptedSerial_payload_65,{t_adaptedSerial_payload_66,{t_adaptedSerial_payload_67,{t_adaptedSerial_payload_68,{t_adaptedSerial_payload_69,{t_adaptedSerial_payload_70,{t_adaptedSerial_payload_71,{t_adaptedSerial_payload_72,{t_adaptedSerial_payload_73,{t_adaptedSerial_payload_74,{t_adaptedSerial_payload_75,{t_adaptedSerial_payload_76,{t_adaptedSerial_payload_77,{t_adaptedSerial_payload_78,{t_adaptedSerial_payload_79,t_adaptedSerial_payload_132}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_132 = {t_adaptedSerial_payload_80,{t_adaptedSerial_payload_81,{t_adaptedSerial_payload_82,{t_adaptedSerial_payload_83,{t_adaptedSerial_payload_84,{t_adaptedSerial_payload_85,{t_adaptedSerial_payload_86,{t_adaptedSerial_payload_87,{t_adaptedSerial_payload_88,{t_adaptedSerial_payload_89,{t_adaptedSerial_payload_90,{t_adaptedSerial_payload_91,{t_adaptedSerial_payload_92,{t_adaptedSerial_payload_93,{t_adaptedSerial_payload_94,{t_adaptedSerial_payload_95,t_adaptedSerial_payload_133}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_133 = {t_adaptedSerial_payload_96,{t_adaptedSerial_payload_97,{t_adaptedSerial_payload_98,{t_adaptedSerial_payload_99,{t_adaptedSerial_payload_100,{t_adaptedSerial_payload_101,{t_adaptedSerial_payload_102,{t_adaptedSerial_payload_103,{t_adaptedSerial_payload_104,{t_adaptedSerial_payload_105,{t_adaptedSerial_payload_106,{t_adaptedSerial_payload_107,{t_adaptedSerial_payload_108,{t_adaptedSerial_payload_109,{t_adaptedSerial_payload_110,{t_adaptedSerial_payload_111,t_adaptedSerial_payload_134}}}}}}}}}}}}}}}};
  assign t_adaptedSerial_payload_134 = {t_adaptedSerial_payload_112,{t_adaptedSerial_payload_113,{t_adaptedSerial_payload_114,{t_adaptedSerial_payload_115,{t_adaptedSerial_payload_116,{t_adaptedSerial_payload_117,{t_adaptedSerial_payload_118,{t_adaptedSerial_payload_119,{t_adaptedSerial_payload_120,{t_adaptedSerial_payload_121,{t_adaptedSerial_payload_122,{t_adaptedSerial_payload_123,{t_adaptedSerial_payload_124,{t_adaptedSerial_payload_125,{t_adaptedSerial_payload_126,t_adaptedSerial_payload_127}}}}}}}}}}}}}}};
  LargeBankFifo_5 resBuf (
    .io_push_valid   (resBuf_io_push_valid          ), //i
    .io_push_ready   (resBuf_io_push_ready          ), //o
    .io_push_payload (resBuf_io_push_payload[2047:0]), //i
    .io_pop_valid    (resBuf_io_pop_valid           ), //o
    .io_pop_ready    (deMux_io_input_ready          ), //i
    .io_pop_payload  (resBuf_io_pop_payload[2047:0] ), //o
    .io_occupancy    (resBuf_io_occupancy[3:0]      ), //o
    .io_availability (resBuf_io_availability[3:0]   ), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamDemux_6 deMux (
    .io_select            (deMux_io_select                   ), //i
    .io_input_valid       (resBuf_io_pop_valid               ), //i
    .io_input_ready       (deMux_io_input_ready              ), //o
    .io_input_payload     (resBuf_io_pop_payload[2047:0]     ), //i
    .io_outputs_0_valid   (deMux_io_outputs_0_valid          ), //o
    .io_outputs_0_ready   (deMux_io_outputs_0_ready          ), //i
    .io_outputs_0_payload (deMux_io_outputs_0_payload[2047:0]), //o
    .io_outputs_1_valid   (deMux_io_outputs_1_valid          ), //o
    .io_outputs_1_ready   (parallelOut_ready                 ), //i
    .io_outputs_1_payload (deMux_io_outputs_1_payload[2047:0])  //o
  );
  always @(*) begin
    case(t_serialOut_payload_2)
      7'b0000000 : t_serialOut_payload_4 = t_serialOut_payload_3[15 : 0];
      7'b0000001 : t_serialOut_payload_4 = t_serialOut_payload_3[31 : 16];
      7'b0000010 : t_serialOut_payload_4 = t_serialOut_payload_3[47 : 32];
      7'b0000011 : t_serialOut_payload_4 = t_serialOut_payload_3[63 : 48];
      7'b0000100 : t_serialOut_payload_4 = t_serialOut_payload_3[79 : 64];
      7'b0000101 : t_serialOut_payload_4 = t_serialOut_payload_3[95 : 80];
      7'b0000110 : t_serialOut_payload_4 = t_serialOut_payload_3[111 : 96];
      7'b0000111 : t_serialOut_payload_4 = t_serialOut_payload_3[127 : 112];
      7'b0001000 : t_serialOut_payload_4 = t_serialOut_payload_3[143 : 128];
      7'b0001001 : t_serialOut_payload_4 = t_serialOut_payload_3[159 : 144];
      7'b0001010 : t_serialOut_payload_4 = t_serialOut_payload_3[175 : 160];
      7'b0001011 : t_serialOut_payload_4 = t_serialOut_payload_3[191 : 176];
      7'b0001100 : t_serialOut_payload_4 = t_serialOut_payload_3[207 : 192];
      7'b0001101 : t_serialOut_payload_4 = t_serialOut_payload_3[223 : 208];
      7'b0001110 : t_serialOut_payload_4 = t_serialOut_payload_3[239 : 224];
      7'b0001111 : t_serialOut_payload_4 = t_serialOut_payload_3[255 : 240];
      7'b0010000 : t_serialOut_payload_4 = t_serialOut_payload_3[271 : 256];
      7'b0010001 : t_serialOut_payload_4 = t_serialOut_payload_3[287 : 272];
      7'b0010010 : t_serialOut_payload_4 = t_serialOut_payload_3[303 : 288];
      7'b0010011 : t_serialOut_payload_4 = t_serialOut_payload_3[319 : 304];
      7'b0010100 : t_serialOut_payload_4 = t_serialOut_payload_3[335 : 320];
      7'b0010101 : t_serialOut_payload_4 = t_serialOut_payload_3[351 : 336];
      7'b0010110 : t_serialOut_payload_4 = t_serialOut_payload_3[367 : 352];
      7'b0010111 : t_serialOut_payload_4 = t_serialOut_payload_3[383 : 368];
      7'b0011000 : t_serialOut_payload_4 = t_serialOut_payload_3[399 : 384];
      7'b0011001 : t_serialOut_payload_4 = t_serialOut_payload_3[415 : 400];
      7'b0011010 : t_serialOut_payload_4 = t_serialOut_payload_3[431 : 416];
      7'b0011011 : t_serialOut_payload_4 = t_serialOut_payload_3[447 : 432];
      7'b0011100 : t_serialOut_payload_4 = t_serialOut_payload_3[463 : 448];
      7'b0011101 : t_serialOut_payload_4 = t_serialOut_payload_3[479 : 464];
      7'b0011110 : t_serialOut_payload_4 = t_serialOut_payload_3[495 : 480];
      7'b0011111 : t_serialOut_payload_4 = t_serialOut_payload_3[511 : 496];
      7'b0100000 : t_serialOut_payload_4 = t_serialOut_payload_3[527 : 512];
      7'b0100001 : t_serialOut_payload_4 = t_serialOut_payload_3[543 : 528];
      7'b0100010 : t_serialOut_payload_4 = t_serialOut_payload_3[559 : 544];
      7'b0100011 : t_serialOut_payload_4 = t_serialOut_payload_3[575 : 560];
      7'b0100100 : t_serialOut_payload_4 = t_serialOut_payload_3[591 : 576];
      7'b0100101 : t_serialOut_payload_4 = t_serialOut_payload_3[607 : 592];
      7'b0100110 : t_serialOut_payload_4 = t_serialOut_payload_3[623 : 608];
      7'b0100111 : t_serialOut_payload_4 = t_serialOut_payload_3[639 : 624];
      7'b0101000 : t_serialOut_payload_4 = t_serialOut_payload_3[655 : 640];
      7'b0101001 : t_serialOut_payload_4 = t_serialOut_payload_3[671 : 656];
      7'b0101010 : t_serialOut_payload_4 = t_serialOut_payload_3[687 : 672];
      7'b0101011 : t_serialOut_payload_4 = t_serialOut_payload_3[703 : 688];
      7'b0101100 : t_serialOut_payload_4 = t_serialOut_payload_3[719 : 704];
      7'b0101101 : t_serialOut_payload_4 = t_serialOut_payload_3[735 : 720];
      7'b0101110 : t_serialOut_payload_4 = t_serialOut_payload_3[751 : 736];
      7'b0101111 : t_serialOut_payload_4 = t_serialOut_payload_3[767 : 752];
      7'b0110000 : t_serialOut_payload_4 = t_serialOut_payload_3[783 : 768];
      7'b0110001 : t_serialOut_payload_4 = t_serialOut_payload_3[799 : 784];
      7'b0110010 : t_serialOut_payload_4 = t_serialOut_payload_3[815 : 800];
      7'b0110011 : t_serialOut_payload_4 = t_serialOut_payload_3[831 : 816];
      7'b0110100 : t_serialOut_payload_4 = t_serialOut_payload_3[847 : 832];
      7'b0110101 : t_serialOut_payload_4 = t_serialOut_payload_3[863 : 848];
      7'b0110110 : t_serialOut_payload_4 = t_serialOut_payload_3[879 : 864];
      7'b0110111 : t_serialOut_payload_4 = t_serialOut_payload_3[895 : 880];
      7'b0111000 : t_serialOut_payload_4 = t_serialOut_payload_3[911 : 896];
      7'b0111001 : t_serialOut_payload_4 = t_serialOut_payload_3[927 : 912];
      7'b0111010 : t_serialOut_payload_4 = t_serialOut_payload_3[943 : 928];
      7'b0111011 : t_serialOut_payload_4 = t_serialOut_payload_3[959 : 944];
      7'b0111100 : t_serialOut_payload_4 = t_serialOut_payload_3[975 : 960];
      7'b0111101 : t_serialOut_payload_4 = t_serialOut_payload_3[991 : 976];
      7'b0111110 : t_serialOut_payload_4 = t_serialOut_payload_3[1007 : 992];
      7'b0111111 : t_serialOut_payload_4 = t_serialOut_payload_3[1023 : 1008];
      7'b1000000 : t_serialOut_payload_4 = t_serialOut_payload_3[1039 : 1024];
      7'b1000001 : t_serialOut_payload_4 = t_serialOut_payload_3[1055 : 1040];
      7'b1000010 : t_serialOut_payload_4 = t_serialOut_payload_3[1071 : 1056];
      7'b1000011 : t_serialOut_payload_4 = t_serialOut_payload_3[1087 : 1072];
      7'b1000100 : t_serialOut_payload_4 = t_serialOut_payload_3[1103 : 1088];
      7'b1000101 : t_serialOut_payload_4 = t_serialOut_payload_3[1119 : 1104];
      7'b1000110 : t_serialOut_payload_4 = t_serialOut_payload_3[1135 : 1120];
      7'b1000111 : t_serialOut_payload_4 = t_serialOut_payload_3[1151 : 1136];
      7'b1001000 : t_serialOut_payload_4 = t_serialOut_payload_3[1167 : 1152];
      7'b1001001 : t_serialOut_payload_4 = t_serialOut_payload_3[1183 : 1168];
      7'b1001010 : t_serialOut_payload_4 = t_serialOut_payload_3[1199 : 1184];
      7'b1001011 : t_serialOut_payload_4 = t_serialOut_payload_3[1215 : 1200];
      7'b1001100 : t_serialOut_payload_4 = t_serialOut_payload_3[1231 : 1216];
      7'b1001101 : t_serialOut_payload_4 = t_serialOut_payload_3[1247 : 1232];
      7'b1001110 : t_serialOut_payload_4 = t_serialOut_payload_3[1263 : 1248];
      7'b1001111 : t_serialOut_payload_4 = t_serialOut_payload_3[1279 : 1264];
      7'b1010000 : t_serialOut_payload_4 = t_serialOut_payload_3[1295 : 1280];
      7'b1010001 : t_serialOut_payload_4 = t_serialOut_payload_3[1311 : 1296];
      7'b1010010 : t_serialOut_payload_4 = t_serialOut_payload_3[1327 : 1312];
      7'b1010011 : t_serialOut_payload_4 = t_serialOut_payload_3[1343 : 1328];
      7'b1010100 : t_serialOut_payload_4 = t_serialOut_payload_3[1359 : 1344];
      7'b1010101 : t_serialOut_payload_4 = t_serialOut_payload_3[1375 : 1360];
      7'b1010110 : t_serialOut_payload_4 = t_serialOut_payload_3[1391 : 1376];
      7'b1010111 : t_serialOut_payload_4 = t_serialOut_payload_3[1407 : 1392];
      7'b1011000 : t_serialOut_payload_4 = t_serialOut_payload_3[1423 : 1408];
      7'b1011001 : t_serialOut_payload_4 = t_serialOut_payload_3[1439 : 1424];
      7'b1011010 : t_serialOut_payload_4 = t_serialOut_payload_3[1455 : 1440];
      7'b1011011 : t_serialOut_payload_4 = t_serialOut_payload_3[1471 : 1456];
      7'b1011100 : t_serialOut_payload_4 = t_serialOut_payload_3[1487 : 1472];
      7'b1011101 : t_serialOut_payload_4 = t_serialOut_payload_3[1503 : 1488];
      7'b1011110 : t_serialOut_payload_4 = t_serialOut_payload_3[1519 : 1504];
      7'b1011111 : t_serialOut_payload_4 = t_serialOut_payload_3[1535 : 1520];
      7'b1100000 : t_serialOut_payload_4 = t_serialOut_payload_3[1551 : 1536];
      7'b1100001 : t_serialOut_payload_4 = t_serialOut_payload_3[1567 : 1552];
      7'b1100010 : t_serialOut_payload_4 = t_serialOut_payload_3[1583 : 1568];
      7'b1100011 : t_serialOut_payload_4 = t_serialOut_payload_3[1599 : 1584];
      7'b1100100 : t_serialOut_payload_4 = t_serialOut_payload_3[1615 : 1600];
      7'b1100101 : t_serialOut_payload_4 = t_serialOut_payload_3[1631 : 1616];
      7'b1100110 : t_serialOut_payload_4 = t_serialOut_payload_3[1647 : 1632];
      7'b1100111 : t_serialOut_payload_4 = t_serialOut_payload_3[1663 : 1648];
      7'b1101000 : t_serialOut_payload_4 = t_serialOut_payload_3[1679 : 1664];
      7'b1101001 : t_serialOut_payload_4 = t_serialOut_payload_3[1695 : 1680];
      7'b1101010 : t_serialOut_payload_4 = t_serialOut_payload_3[1711 : 1696];
      7'b1101011 : t_serialOut_payload_4 = t_serialOut_payload_3[1727 : 1712];
      7'b1101100 : t_serialOut_payload_4 = t_serialOut_payload_3[1743 : 1728];
      7'b1101101 : t_serialOut_payload_4 = t_serialOut_payload_3[1759 : 1744];
      7'b1101110 : t_serialOut_payload_4 = t_serialOut_payload_3[1775 : 1760];
      7'b1101111 : t_serialOut_payload_4 = t_serialOut_payload_3[1791 : 1776];
      7'b1110000 : t_serialOut_payload_4 = t_serialOut_payload_3[1807 : 1792];
      7'b1110001 : t_serialOut_payload_4 = t_serialOut_payload_3[1823 : 1808];
      7'b1110010 : t_serialOut_payload_4 = t_serialOut_payload_3[1839 : 1824];
      7'b1110011 : t_serialOut_payload_4 = t_serialOut_payload_3[1855 : 1840];
      7'b1110100 : t_serialOut_payload_4 = t_serialOut_payload_3[1871 : 1856];
      7'b1110101 : t_serialOut_payload_4 = t_serialOut_payload_3[1887 : 1872];
      7'b1110110 : t_serialOut_payload_4 = t_serialOut_payload_3[1903 : 1888];
      7'b1110111 : t_serialOut_payload_4 = t_serialOut_payload_3[1919 : 1904];
      7'b1111000 : t_serialOut_payload_4 = t_serialOut_payload_3[1935 : 1920];
      7'b1111001 : t_serialOut_payload_4 = t_serialOut_payload_3[1951 : 1936];
      7'b1111010 : t_serialOut_payload_4 = t_serialOut_payload_3[1967 : 1952];
      7'b1111011 : t_serialOut_payload_4 = t_serialOut_payload_3[1983 : 1968];
      7'b1111100 : t_serialOut_payload_4 = t_serialOut_payload_3[1999 : 1984];
      7'b1111101 : t_serialOut_payload_4 = t_serialOut_payload_3[2015 : 2000];
      7'b1111110 : t_serialOut_payload_4 = t_serialOut_payload_3[2031 : 2016];
      default : t_serialOut_payload_4 = t_serialOut_payload_3[2047 : 2032];
    endcase
  end

  assign cntAbout2Ovf = (cnt == 8'h7e);
  assign adaptedSerial_valid = (serialIn_valid && cntOvfReg);
  assign t_adaptedSerial_payload = serialIn_payload;
  assign adaptedSerial_payload = {t_adaptedSerial_payload,{t_adaptedSerial_payload_1,{t_adaptedSerial_payload_2,{t_adaptedSerial_payload_3,{t_adaptedSerial_payload_4,{t_adaptedSerial_payload_5,{t_adaptedSerial_payload_6,{t_adaptedSerial_payload_7,{t_adaptedSerial_payload_8,{t_adaptedSerial_payload_9,{t_adaptedSerial_payload_10,{t_adaptedSerial_payload_11,{t_adaptedSerial_payload_12,{t_adaptedSerial_payload_13,{t_adaptedSerial_payload_14,{t_adaptedSerial_payload_15,t_adaptedSerial_payload_128}}}}}}}}}}}}}}}};
  assign resBuf_io_push_valid = (inMuxSel ? adaptedSerial_valid : parallelIn_valid);
  assign resBuf_io_push_payload = (inMuxSel ? adaptedSerial_payload : parallelIn_payload);
  assign deMux_io_select = outMuxSel;
  assign serialOut_fire = (serialOut_valid && serialOut_ready);
  always @(*) begin
    t_serialOut_payload = 1'b0;
    if(serialOut_fire) begin
      t_serialOut_payload = 1'b1;
    end
  end

  assign t_io_outputs_0_ready = (t_serialOut_payload_2 == 7'h7f);
  always @(*) begin
    t_serialOut_payload_1 = (t_serialOut_payload_2 + t_t_serialOut_payload_1);
    if(1'b0) begin
      t_serialOut_payload_1 = 7'h0;
    end
  end

  assign serialOut_valid = deMux_io_outputs_0_valid;
  assign t_serialOut_payload_3 = deMux_io_outputs_0_payload;
  assign serialOut_payload = t_serialOut_payload_4;
  assign deMux_io_outputs_0_ready = (serialOut_ready && t_io_outputs_0_ready);
  assign parallelOut_valid = deMux_io_outputs_1_valid;
  assign parallelOut_payload = deMux_io_outputs_1_payload;
  assign serialOut_tvalid = serialOut_valid;
  assign serialOut_ready = serialOut_tready;
  assign serialOut_tdata = serialOut_payload;
  assign parallelOut_tvalid = parallelOut_valid;
  assign parallelOut_ready = parallelOut_tready;
  assign parallelOut_tdata = parallelOut_payload;
  assign bufInCntOvf = (bufInCnt == 4'b1011);
  assign resBuf_resBuf_io_push_fire = (resBuf_io_push_valid && resBuf_io_push_ready);
  assign bufOutCntOvf = (bufOutCnt == 4'b1011);
  assign resBuf_resBuf_io_pop_fire = (resBuf_io_pop_valid && deMux_io_input_ready);
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      serialIn_valid <= 1'b0;
      parallelIn_valid <= 1'b0;
      inMuxSel <= 1'b0;
      outMuxSel <= 1'b0;
      cnt <= 8'h0;
      cntOvfReg <= 1'b0;
      t_serialOut_payload_2 <= 7'h0;
      bufInCnt <= 4'b0000;
      bufOutCnt <= 4'b0000;
    end else begin
      serialIn_valid <= serialIn_tvalid;
      parallelIn_valid <= parallelIn_tvalid;
      if(serialIn_valid) begin
        cnt <= (cnt + 8'h01);
        if(cntAbout2Ovf) begin
          cntOvfReg <= 1'b1;
        end
        if(cntOvfReg) begin
          cnt <= 8'h0;
          cntOvfReg <= 1'b0;
        end
      end
      t_serialOut_payload_2 <= t_serialOut_payload_1;
      if(resBuf_resBuf_io_push_fire) begin
        bufInCnt <= (bufInCnt + 4'b0001);
        if(bufInCntOvf) begin
          bufInCnt <= 4'b0000;
          inMuxSel <= (! inMuxSel);
        end
      end
      if(resBuf_resBuf_io_pop_fire) begin
        bufOutCnt <= (bufOutCnt + 4'b0001);
        if(bufOutCntOvf) begin
          bufOutCnt <= 4'b0000;
          outMuxSel <= (! outMuxSel);
        end
      end
    end
  end

  always @(posedge clk_0_clk) begin
    serialIn_payload <= serialIn_tdata;
    parallelIn_payload <= parallelIn_tdata;
    if(serialIn_valid) begin
      t_adaptedSerial_payload_1 <= t_adaptedSerial_payload;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_2 <= t_adaptedSerial_payload_1;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_3 <= t_adaptedSerial_payload_2;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_4 <= t_adaptedSerial_payload_3;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_5 <= t_adaptedSerial_payload_4;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_6 <= t_adaptedSerial_payload_5;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_7 <= t_adaptedSerial_payload_6;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_8 <= t_adaptedSerial_payload_7;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_9 <= t_adaptedSerial_payload_8;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_10 <= t_adaptedSerial_payload_9;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_11 <= t_adaptedSerial_payload_10;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_12 <= t_adaptedSerial_payload_11;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_13 <= t_adaptedSerial_payload_12;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_14 <= t_adaptedSerial_payload_13;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_15 <= t_adaptedSerial_payload_14;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_16 <= t_adaptedSerial_payload_15;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_17 <= t_adaptedSerial_payload_16;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_18 <= t_adaptedSerial_payload_17;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_19 <= t_adaptedSerial_payload_18;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_20 <= t_adaptedSerial_payload_19;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_21 <= t_adaptedSerial_payload_20;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_22 <= t_adaptedSerial_payload_21;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_23 <= t_adaptedSerial_payload_22;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_24 <= t_adaptedSerial_payload_23;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_25 <= t_adaptedSerial_payload_24;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_26 <= t_adaptedSerial_payload_25;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_27 <= t_adaptedSerial_payload_26;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_28 <= t_adaptedSerial_payload_27;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_29 <= t_adaptedSerial_payload_28;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_30 <= t_adaptedSerial_payload_29;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_31 <= t_adaptedSerial_payload_30;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_32 <= t_adaptedSerial_payload_31;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_33 <= t_adaptedSerial_payload_32;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_34 <= t_adaptedSerial_payload_33;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_35 <= t_adaptedSerial_payload_34;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_36 <= t_adaptedSerial_payload_35;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_37 <= t_adaptedSerial_payload_36;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_38 <= t_adaptedSerial_payload_37;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_39 <= t_adaptedSerial_payload_38;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_40 <= t_adaptedSerial_payload_39;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_41 <= t_adaptedSerial_payload_40;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_42 <= t_adaptedSerial_payload_41;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_43 <= t_adaptedSerial_payload_42;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_44 <= t_adaptedSerial_payload_43;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_45 <= t_adaptedSerial_payload_44;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_46 <= t_adaptedSerial_payload_45;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_47 <= t_adaptedSerial_payload_46;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_48 <= t_adaptedSerial_payload_47;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_49 <= t_adaptedSerial_payload_48;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_50 <= t_adaptedSerial_payload_49;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_51 <= t_adaptedSerial_payload_50;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_52 <= t_adaptedSerial_payload_51;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_53 <= t_adaptedSerial_payload_52;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_54 <= t_adaptedSerial_payload_53;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_55 <= t_adaptedSerial_payload_54;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_56 <= t_adaptedSerial_payload_55;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_57 <= t_adaptedSerial_payload_56;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_58 <= t_adaptedSerial_payload_57;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_59 <= t_adaptedSerial_payload_58;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_60 <= t_adaptedSerial_payload_59;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_61 <= t_adaptedSerial_payload_60;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_62 <= t_adaptedSerial_payload_61;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_63 <= t_adaptedSerial_payload_62;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_64 <= t_adaptedSerial_payload_63;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_65 <= t_adaptedSerial_payload_64;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_66 <= t_adaptedSerial_payload_65;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_67 <= t_adaptedSerial_payload_66;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_68 <= t_adaptedSerial_payload_67;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_69 <= t_adaptedSerial_payload_68;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_70 <= t_adaptedSerial_payload_69;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_71 <= t_adaptedSerial_payload_70;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_72 <= t_adaptedSerial_payload_71;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_73 <= t_adaptedSerial_payload_72;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_74 <= t_adaptedSerial_payload_73;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_75 <= t_adaptedSerial_payload_74;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_76 <= t_adaptedSerial_payload_75;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_77 <= t_adaptedSerial_payload_76;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_78 <= t_adaptedSerial_payload_77;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_79 <= t_adaptedSerial_payload_78;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_80 <= t_adaptedSerial_payload_79;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_81 <= t_adaptedSerial_payload_80;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_82 <= t_adaptedSerial_payload_81;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_83 <= t_adaptedSerial_payload_82;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_84 <= t_adaptedSerial_payload_83;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_85 <= t_adaptedSerial_payload_84;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_86 <= t_adaptedSerial_payload_85;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_87 <= t_adaptedSerial_payload_86;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_88 <= t_adaptedSerial_payload_87;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_89 <= t_adaptedSerial_payload_88;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_90 <= t_adaptedSerial_payload_89;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_91 <= t_adaptedSerial_payload_90;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_92 <= t_adaptedSerial_payload_91;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_93 <= t_adaptedSerial_payload_92;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_94 <= t_adaptedSerial_payload_93;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_95 <= t_adaptedSerial_payload_94;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_96 <= t_adaptedSerial_payload_95;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_97 <= t_adaptedSerial_payload_96;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_98 <= t_adaptedSerial_payload_97;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_99 <= t_adaptedSerial_payload_98;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_100 <= t_adaptedSerial_payload_99;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_101 <= t_adaptedSerial_payload_100;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_102 <= t_adaptedSerial_payload_101;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_103 <= t_adaptedSerial_payload_102;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_104 <= t_adaptedSerial_payload_103;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_105 <= t_adaptedSerial_payload_104;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_106 <= t_adaptedSerial_payload_105;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_107 <= t_adaptedSerial_payload_106;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_108 <= t_adaptedSerial_payload_107;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_109 <= t_adaptedSerial_payload_108;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_110 <= t_adaptedSerial_payload_109;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_111 <= t_adaptedSerial_payload_110;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_112 <= t_adaptedSerial_payload_111;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_113 <= t_adaptedSerial_payload_112;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_114 <= t_adaptedSerial_payload_113;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_115 <= t_adaptedSerial_payload_114;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_116 <= t_adaptedSerial_payload_115;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_117 <= t_adaptedSerial_payload_116;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_118 <= t_adaptedSerial_payload_117;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_119 <= t_adaptedSerial_payload_118;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_120 <= t_adaptedSerial_payload_119;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_121 <= t_adaptedSerial_payload_120;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_122 <= t_adaptedSerial_payload_121;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_123 <= t_adaptedSerial_payload_122;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_124 <= t_adaptedSerial_payload_123;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_125 <= t_adaptedSerial_payload_124;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_126 <= t_adaptedSerial_payload_125;
    end
    if(serialIn_valid) begin
      t_adaptedSerial_payload_127 <= t_adaptedSerial_payload_126;
    end
  end


endmodule

