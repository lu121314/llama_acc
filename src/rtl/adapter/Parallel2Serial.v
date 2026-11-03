// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module Parallel2Serial (
  input  wire          io_input_valid,
  output wire          io_input_ready,
  input  wire [2047:0] io_input_tdata,
  input  wire [5:0]    io_input_tuser,
  output wire          io_output_valid,
  output wire [15:0]   io_output_tdata,
  output wire [5:0]    io_output_tuser,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire       [6:0]    t_t_output_payload_1;
  wire       [0:0]    t_t_output_payload_1_1;
  reg        [15:0]   t_output_payload_4;
  wire                input_valid;
  wire                input_ready;
  wire       [2047:0] input_payload;
  wire                output_valid;
  wire                output_ready;
  wire       [15:0]   output_payload;
  wire                output_fire;
  reg                 t_output_payload;
  reg        [6:0]    t_output_payload_1;
  reg        [6:0]    t_output_payload_2;
  wire                t_input_ready;
  wire       [2047:0] t_output_payload_3;

  assign t_t_output_payload_1_1 = t_output_payload;
  assign t_t_output_payload_1 = {6'd0, t_t_output_payload_1_1};
  always @(*) begin
    case(t_output_payload_2)
      7'b0000000 : t_output_payload_4 = t_output_payload_3[15 : 0];
      7'b0000001 : t_output_payload_4 = t_output_payload_3[31 : 16];
      7'b0000010 : t_output_payload_4 = t_output_payload_3[47 : 32];
      7'b0000011 : t_output_payload_4 = t_output_payload_3[63 : 48];
      7'b0000100 : t_output_payload_4 = t_output_payload_3[79 : 64];
      7'b0000101 : t_output_payload_4 = t_output_payload_3[95 : 80];
      7'b0000110 : t_output_payload_4 = t_output_payload_3[111 : 96];
      7'b0000111 : t_output_payload_4 = t_output_payload_3[127 : 112];
      7'b0001000 : t_output_payload_4 = t_output_payload_3[143 : 128];
      7'b0001001 : t_output_payload_4 = t_output_payload_3[159 : 144];
      7'b0001010 : t_output_payload_4 = t_output_payload_3[175 : 160];
      7'b0001011 : t_output_payload_4 = t_output_payload_3[191 : 176];
      7'b0001100 : t_output_payload_4 = t_output_payload_3[207 : 192];
      7'b0001101 : t_output_payload_4 = t_output_payload_3[223 : 208];
      7'b0001110 : t_output_payload_4 = t_output_payload_3[239 : 224];
      7'b0001111 : t_output_payload_4 = t_output_payload_3[255 : 240];
      7'b0010000 : t_output_payload_4 = t_output_payload_3[271 : 256];
      7'b0010001 : t_output_payload_4 = t_output_payload_3[287 : 272];
      7'b0010010 : t_output_payload_4 = t_output_payload_3[303 : 288];
      7'b0010011 : t_output_payload_4 = t_output_payload_3[319 : 304];
      7'b0010100 : t_output_payload_4 = t_output_payload_3[335 : 320];
      7'b0010101 : t_output_payload_4 = t_output_payload_3[351 : 336];
      7'b0010110 : t_output_payload_4 = t_output_payload_3[367 : 352];
      7'b0010111 : t_output_payload_4 = t_output_payload_3[383 : 368];
      7'b0011000 : t_output_payload_4 = t_output_payload_3[399 : 384];
      7'b0011001 : t_output_payload_4 = t_output_payload_3[415 : 400];
      7'b0011010 : t_output_payload_4 = t_output_payload_3[431 : 416];
      7'b0011011 : t_output_payload_4 = t_output_payload_3[447 : 432];
      7'b0011100 : t_output_payload_4 = t_output_payload_3[463 : 448];
      7'b0011101 : t_output_payload_4 = t_output_payload_3[479 : 464];
      7'b0011110 : t_output_payload_4 = t_output_payload_3[495 : 480];
      7'b0011111 : t_output_payload_4 = t_output_payload_3[511 : 496];
      7'b0100000 : t_output_payload_4 = t_output_payload_3[527 : 512];
      7'b0100001 : t_output_payload_4 = t_output_payload_3[543 : 528];
      7'b0100010 : t_output_payload_4 = t_output_payload_3[559 : 544];
      7'b0100011 : t_output_payload_4 = t_output_payload_3[575 : 560];
      7'b0100100 : t_output_payload_4 = t_output_payload_3[591 : 576];
      7'b0100101 : t_output_payload_4 = t_output_payload_3[607 : 592];
      7'b0100110 : t_output_payload_4 = t_output_payload_3[623 : 608];
      7'b0100111 : t_output_payload_4 = t_output_payload_3[639 : 624];
      7'b0101000 : t_output_payload_4 = t_output_payload_3[655 : 640];
      7'b0101001 : t_output_payload_4 = t_output_payload_3[671 : 656];
      7'b0101010 : t_output_payload_4 = t_output_payload_3[687 : 672];
      7'b0101011 : t_output_payload_4 = t_output_payload_3[703 : 688];
      7'b0101100 : t_output_payload_4 = t_output_payload_3[719 : 704];
      7'b0101101 : t_output_payload_4 = t_output_payload_3[735 : 720];
      7'b0101110 : t_output_payload_4 = t_output_payload_3[751 : 736];
      7'b0101111 : t_output_payload_4 = t_output_payload_3[767 : 752];
      7'b0110000 : t_output_payload_4 = t_output_payload_3[783 : 768];
      7'b0110001 : t_output_payload_4 = t_output_payload_3[799 : 784];
      7'b0110010 : t_output_payload_4 = t_output_payload_3[815 : 800];
      7'b0110011 : t_output_payload_4 = t_output_payload_3[831 : 816];
      7'b0110100 : t_output_payload_4 = t_output_payload_3[847 : 832];
      7'b0110101 : t_output_payload_4 = t_output_payload_3[863 : 848];
      7'b0110110 : t_output_payload_4 = t_output_payload_3[879 : 864];
      7'b0110111 : t_output_payload_4 = t_output_payload_3[895 : 880];
      7'b0111000 : t_output_payload_4 = t_output_payload_3[911 : 896];
      7'b0111001 : t_output_payload_4 = t_output_payload_3[927 : 912];
      7'b0111010 : t_output_payload_4 = t_output_payload_3[943 : 928];
      7'b0111011 : t_output_payload_4 = t_output_payload_3[959 : 944];
      7'b0111100 : t_output_payload_4 = t_output_payload_3[975 : 960];
      7'b0111101 : t_output_payload_4 = t_output_payload_3[991 : 976];
      7'b0111110 : t_output_payload_4 = t_output_payload_3[1007 : 992];
      7'b0111111 : t_output_payload_4 = t_output_payload_3[1023 : 1008];
      7'b1000000 : t_output_payload_4 = t_output_payload_3[1039 : 1024];
      7'b1000001 : t_output_payload_4 = t_output_payload_3[1055 : 1040];
      7'b1000010 : t_output_payload_4 = t_output_payload_3[1071 : 1056];
      7'b1000011 : t_output_payload_4 = t_output_payload_3[1087 : 1072];
      7'b1000100 : t_output_payload_4 = t_output_payload_3[1103 : 1088];
      7'b1000101 : t_output_payload_4 = t_output_payload_3[1119 : 1104];
      7'b1000110 : t_output_payload_4 = t_output_payload_3[1135 : 1120];
      7'b1000111 : t_output_payload_4 = t_output_payload_3[1151 : 1136];
      7'b1001000 : t_output_payload_4 = t_output_payload_3[1167 : 1152];
      7'b1001001 : t_output_payload_4 = t_output_payload_3[1183 : 1168];
      7'b1001010 : t_output_payload_4 = t_output_payload_3[1199 : 1184];
      7'b1001011 : t_output_payload_4 = t_output_payload_3[1215 : 1200];
      7'b1001100 : t_output_payload_4 = t_output_payload_3[1231 : 1216];
      7'b1001101 : t_output_payload_4 = t_output_payload_3[1247 : 1232];
      7'b1001110 : t_output_payload_4 = t_output_payload_3[1263 : 1248];
      7'b1001111 : t_output_payload_4 = t_output_payload_3[1279 : 1264];
      7'b1010000 : t_output_payload_4 = t_output_payload_3[1295 : 1280];
      7'b1010001 : t_output_payload_4 = t_output_payload_3[1311 : 1296];
      7'b1010010 : t_output_payload_4 = t_output_payload_3[1327 : 1312];
      7'b1010011 : t_output_payload_4 = t_output_payload_3[1343 : 1328];
      7'b1010100 : t_output_payload_4 = t_output_payload_3[1359 : 1344];
      7'b1010101 : t_output_payload_4 = t_output_payload_3[1375 : 1360];
      7'b1010110 : t_output_payload_4 = t_output_payload_3[1391 : 1376];
      7'b1010111 : t_output_payload_4 = t_output_payload_3[1407 : 1392];
      7'b1011000 : t_output_payload_4 = t_output_payload_3[1423 : 1408];
      7'b1011001 : t_output_payload_4 = t_output_payload_3[1439 : 1424];
      7'b1011010 : t_output_payload_4 = t_output_payload_3[1455 : 1440];
      7'b1011011 : t_output_payload_4 = t_output_payload_3[1471 : 1456];
      7'b1011100 : t_output_payload_4 = t_output_payload_3[1487 : 1472];
      7'b1011101 : t_output_payload_4 = t_output_payload_3[1503 : 1488];
      7'b1011110 : t_output_payload_4 = t_output_payload_3[1519 : 1504];
      7'b1011111 : t_output_payload_4 = t_output_payload_3[1535 : 1520];
      7'b1100000 : t_output_payload_4 = t_output_payload_3[1551 : 1536];
      7'b1100001 : t_output_payload_4 = t_output_payload_3[1567 : 1552];
      7'b1100010 : t_output_payload_4 = t_output_payload_3[1583 : 1568];
      7'b1100011 : t_output_payload_4 = t_output_payload_3[1599 : 1584];
      7'b1100100 : t_output_payload_4 = t_output_payload_3[1615 : 1600];
      7'b1100101 : t_output_payload_4 = t_output_payload_3[1631 : 1616];
      7'b1100110 : t_output_payload_4 = t_output_payload_3[1647 : 1632];
      7'b1100111 : t_output_payload_4 = t_output_payload_3[1663 : 1648];
      7'b1101000 : t_output_payload_4 = t_output_payload_3[1679 : 1664];
      7'b1101001 : t_output_payload_4 = t_output_payload_3[1695 : 1680];
      7'b1101010 : t_output_payload_4 = t_output_payload_3[1711 : 1696];
      7'b1101011 : t_output_payload_4 = t_output_payload_3[1727 : 1712];
      7'b1101100 : t_output_payload_4 = t_output_payload_3[1743 : 1728];
      7'b1101101 : t_output_payload_4 = t_output_payload_3[1759 : 1744];
      7'b1101110 : t_output_payload_4 = t_output_payload_3[1775 : 1760];
      7'b1101111 : t_output_payload_4 = t_output_payload_3[1791 : 1776];
      7'b1110000 : t_output_payload_4 = t_output_payload_3[1807 : 1792];
      7'b1110001 : t_output_payload_4 = t_output_payload_3[1823 : 1808];
      7'b1110010 : t_output_payload_4 = t_output_payload_3[1839 : 1824];
      7'b1110011 : t_output_payload_4 = t_output_payload_3[1855 : 1840];
      7'b1110100 : t_output_payload_4 = t_output_payload_3[1871 : 1856];
      7'b1110101 : t_output_payload_4 = t_output_payload_3[1887 : 1872];
      7'b1110110 : t_output_payload_4 = t_output_payload_3[1903 : 1888];
      7'b1110111 : t_output_payload_4 = t_output_payload_3[1919 : 1904];
      7'b1111000 : t_output_payload_4 = t_output_payload_3[1935 : 1920];
      7'b1111001 : t_output_payload_4 = t_output_payload_3[1951 : 1936];
      7'b1111010 : t_output_payload_4 = t_output_payload_3[1967 : 1952];
      7'b1111011 : t_output_payload_4 = t_output_payload_3[1983 : 1968];
      7'b1111100 : t_output_payload_4 = t_output_payload_3[1999 : 1984];
      7'b1111101 : t_output_payload_4 = t_output_payload_3[2015 : 2000];
      7'b1111110 : t_output_payload_4 = t_output_payload_3[2031 : 2016];
      default : t_output_payload_4 = t_output_payload_3[2047 : 2032];
    endcase
  end

  assign input_valid = io_input_valid;
  assign io_input_ready = input_ready;
  assign input_payload = io_input_tdata;
  assign output_fire = (output_valid && output_ready);
  always @(*) begin
    t_output_payload = 1'b0;
    if(output_fire) begin
      t_output_payload = 1'b1;
    end
  end

  assign t_input_ready = (t_output_payload_2 == 7'h7f);
  always @(*) begin
    t_output_payload_1 = (t_output_payload_2 + t_t_output_payload_1);
    if(1'b0) begin
      t_output_payload_1 = 7'h0;
    end
  end

  assign output_valid = input_valid;
  assign t_output_payload_3 = input_payload;
  assign output_payload = t_output_payload_4;
  assign input_ready = (output_ready && t_input_ready);
  assign output_ready = 1'b1;
  assign io_output_valid = output_valid;
  assign io_output_tdata = output_payload;
  assign io_output_tuser = io_input_tuser;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      t_output_payload_2 <= 7'h0;
    end else begin
      t_output_payload_2 <= t_output_payload_1;
    end
  end


endmodule

