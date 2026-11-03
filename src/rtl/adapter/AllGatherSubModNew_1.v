// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AllGatherSubModNew_1 (
  input  wire          dotOut_valid,
  input  wire [15:0]   dotOut_tdata,
  input  wire [5:0]    dotOut_tuser,
  input  wire          resOut_valid,
  input  wire          resOut_payload_last,
  input  wire [15:0]   resOut_payload_tdata,
  input  wire [5:0]    resOut_payload_tuser,
  input  wire          p2sOut_valid,
  input  wire          p2sOut_payload_last,
  input  wire [15:0]   p2sOut_payload_tdata,
  input  wire [5:0]    p2sOut_payload_tuser,
  output wire          allGatherOut_tvalid,
  output wire [15:0]   allGatherOut_tdata,
  output wire [5:0]    allGatherOut_tuser,
  output wire          allReduceOut_tvalid,
  output wire [15:0]   allReduceOut_tdata,
  output wire [5:0]    allReduceOut_tuser,
  input  wire          indexIn_valid,
  input  wire          indexIn_payload_last,
  input  wire [15:0]   indexIn_payload_tdata,
  input  wire [5:0]    indexIn_payload_tuser,
  input  wire          gateIndexIn_valid,
  input  wire          gateIndexIn_payload_last,
  input  wire [15:0]   gateIndexIn_payload_tdata,
  input  wire [5:0]    gateIndexIn_payload_tuser,
  input  wire          ugIndexIn_valid,
  input  wire          ugIndexIn_payload_last,
  input  wire [15:0]   ugIndexIn_payload_tdata,
  input  wire [5:0]    ugIndexIn_payload_tuser,
  output wire          indexOut_tvalid,
  output wire          indexOut_tlast,
  output wire [15:0]   indexOut_tdata,
  output wire [5:0]    indexOut_tuser,
  input  wire          c2c_from_valid,
  output wire          c2c_from_ready,
  input  wire          c2c_from_payload_last,
  input  wire [15:0]   c2c_from_payload_tdata,
  input  wire [5:0]    c2c_from_payload_tuser,
  input  wire [0:0]    c2c_from_payload_tdest,
  output wire          c2c_to_valid,
  output wire          c2c_to_payload_last,
  output wire [15:0]   c2c_to_payload_tdata,
  output wire [5:0]    c2c_to_payload_tuser,
  output wire [0:0]    c2c_to_payload_tdest,
  input  wire          clk_0_resetn,
  input  wire          clk_0_clk
);

  wire                node_io_output_valid;
  wire                node_io_output_payload_last;
  wire       [15:0]   node_io_output_payload_tdata;
  wire       [5:0]    node_io_output_payload_tuser;
  wire       [0:0]    node_io_output_payload_tdest;
  wire                node_io_to_valid;
  wire                node_io_to_payload_last;
  wire       [15:0]   node_io_to_payload_tdata;
  wire       [5:0]    node_io_to_payload_tuser;
  wire       [0:0]    node_io_to_payload_tdest;
  wire                reduce_output_tvalid;
  wire       [15:0]   reduce_output_tdata;
  wire       [5:0]    reduce_output_tuser;
  reg                 t_nodeIn_payload_last_1;
  reg        [15:0]   t_nodeIn_payload_tdata;
  reg        [5:0]    t_nodeIn_payload_tuser;
  reg                 t_indexOut_payload_last_4;
  reg        [15:0]   t_indexOut_payload_tdata_3;
  reg        [5:0]    t_indexOut_payload_tuser_3;
  wire       [5:0]    t_dotOut_valid;
  wire                dotOut_valid_1;
  wire                dotOut_payload_last;
  wire       [15:0]   dotOut_payload_tdata;
  wire       [5:0]    dotOut_payload_tuser;
  wire                resOut_valid_1;
  wire                resOut_payload_last_1;
  wire       [15:0]   resOut_payload_tdata_1;
  wire       [5:0]    resOut_payload_tuser_1;
  wire                p2sOut_valid_1;
  wire                p2sOut_payload_last_1;
  wire       [15:0]   p2sOut_payload_tdata_1;
  wire       [5:0]    p2sOut_payload_tuser_1;
  wire                nodeIn_valid;
  wire                nodeIn_payload_last;
  wire       [15:0]   nodeIn_payload_tdata;
  wire       [5:0]    nodeIn_payload_tuser;
  wire       [1:0]    t_nodeIn_payload_last;
  reg                 nodeIn_regNext_valid;
  reg                 nodeIn_regNext_payload_last;
  reg        [15:0]   nodeIn_regNext_payload_tdata;
  reg        [5:0]    nodeIn_regNext_payload_tuser;
  reg                 t_io_from_valid;
  reg                 t_io_from_payload_last;
  reg        [15:0]   t_io_from_payload_tdata;
  reg        [5:0]    t_io_from_payload_tuser;
  reg        [0:0]    t_io_from_payload_tdest;
  wire                nodeOutNoLast_valid;
  wire       [15:0]   nodeOutNoLast_tdata;
  wire       [5:0]    nodeOutNoLast_tuser;
  wire       [0:0]    nodeOutNoLast_tdest;
  reg                 node_reduce_output_regNext_valid;
  reg        [15:0]   node_reduce_output_regNext_tdata;
  reg        [5:0]    node_reduce_output_regNext_tuser;
  reg                 nodeOutNoLast_regNext_valid;
  reg        [15:0]   nodeOutNoLast_regNext_tdata;
  reg        [5:0]    nodeOutNoLast_regNext_tuser;
  reg        [0:0]    nodeOutNoLast_regNext_tdest;
  wire                directIndex_valid;
  wire                directIndex_payload_last;
  wire       [15:0]   directIndex_payload_tdata;
  wire       [5:0]    directIndex_payload_tuser;
  reg                 t_indexOut_valid;
  reg                 t_indexOut_payload_last;
  reg        [15:0]   t_indexOut_payload_tdata;
  reg        [5:0]    t_indexOut_payload_tuser;
  reg                 t_indexOut_valid_1;
  reg                 t_indexOut_payload_last_1;
  reg        [15:0]   t_indexOut_payload_tdata_1;
  reg        [5:0]    t_indexOut_payload_tuser_1;
  reg                 t_indexOut_valid_2;
  reg                 t_indexOut_payload_last_2;
  reg        [15:0]   t_indexOut_payload_tdata_2;
  reg        [5:0]    t_indexOut_payload_tuser_2;
  wire                indexOut_valid;
  wire                indexOut_payload_last;
  wire       [15:0]   indexOut_payload_tdata;
  wire       [5:0]    indexOut_payload_tuser;
  wire       [1:0]    t_indexOut_payload_last_3;

  AllGatherNode_1 node (
    .io_input_valid          (nodeIn_regNext_valid              ), //i
    .io_input_payload_last   (nodeIn_regNext_payload_last       ), //i
    .io_input_payload_tdata  (nodeIn_regNext_payload_tdata[15:0]), //i
    .io_input_payload_tuser  (nodeIn_regNext_payload_tuser[5:0] ), //i
    .io_output_valid         (node_io_output_valid              ), //o
    .io_output_payload_last  (node_io_output_payload_last       ), //o
    .io_output_payload_tdata (node_io_output_payload_tdata[15:0]), //o
    .io_output_payload_tuser (node_io_output_payload_tuser[5:0] ), //o
    .io_output_payload_tdest (node_io_output_payload_tdest      ), //o
    .io_from_valid           (t_io_from_valid                   ), //i
    .io_from_payload_last    (t_io_from_payload_last            ), //i
    .io_from_payload_tdata   (t_io_from_payload_tdata[15:0]     ), //i
    .io_from_payload_tuser   (t_io_from_payload_tuser[5:0]      ), //i
    .io_from_payload_tdest   (t_io_from_payload_tdest           ), //i
    .io_to_valid             (node_io_to_valid                  ), //o
    .io_to_payload_last      (node_io_to_payload_last           ), //o
    .io_to_payload_tdata     (node_io_to_payload_tdata[15:0]    ), //o
    .io_to_payload_tuser     (node_io_to_payload_tuser[5:0]     ), //o
    .io_to_payload_tdest     (node_io_to_payload_tdest          ), //o
    .clk_0_clk               (clk_0_clk                         ), //i
    .clk_0_resetn            (clk_0_resetn                      )  //i
  );
  AllReduce_1 reduce (
    .input_valid   (nodeOutNoLast_valid      ), //i
    .input_tdata   (nodeOutNoLast_tdata[15:0]), //i
    .input_tuser   (nodeOutNoLast_tuser[5:0] ), //i
    .input_tdest   (nodeOutNoLast_tdest      ), //i
    .output_tvalid (reduce_output_tvalid     ), //o
    .output_tdata  (reduce_output_tdata[15:0]), //o
    .output_tuser  (reduce_output_tuser[5:0] ), //o
    .clk_0_resetn  (clk_0_resetn             ), //i
    .clk_0_clk     (clk_0_clk                )  //i
  );
  always @(*) begin
    case(t_nodeIn_payload_last)
      2'b00 : begin
        t_nodeIn_payload_last_1 = resOut_payload_last_1;
        t_nodeIn_payload_tdata = resOut_payload_tdata_1;
        t_nodeIn_payload_tuser = resOut_payload_tuser_1;
      end
      2'b01 : begin
        t_nodeIn_payload_last_1 = dotOut_payload_last;
        t_nodeIn_payload_tdata = dotOut_payload_tdata;
        t_nodeIn_payload_tuser = dotOut_payload_tuser;
      end
      default : begin
        t_nodeIn_payload_last_1 = p2sOut_payload_last_1;
        t_nodeIn_payload_tdata = p2sOut_payload_tdata_1;
        t_nodeIn_payload_tuser = p2sOut_payload_tuser_1;
      end
    endcase
  end

  always @(*) begin
    case(t_indexOut_payload_last_3)
      2'b00 : begin
        t_indexOut_payload_last_4 = t_indexOut_payload_last;
        t_indexOut_payload_tdata_3 = t_indexOut_payload_tdata;
        t_indexOut_payload_tuser_3 = t_indexOut_payload_tuser;
      end
      2'b01 : begin
        t_indexOut_payload_last_4 = t_indexOut_payload_last_1;
        t_indexOut_payload_tdata_3 = t_indexOut_payload_tdata_1;
        t_indexOut_payload_tuser_3 = t_indexOut_payload_tuser_1;
      end
      default : begin
        t_indexOut_payload_last_4 = t_indexOut_payload_last_2;
        t_indexOut_payload_tdata_3 = t_indexOut_payload_tdata_2;
        t_indexOut_payload_tuser_3 = t_indexOut_payload_tuser_2;
      end
    endcase
  end

  assign t_dotOut_valid = dotOut_tuser;
  assign dotOut_valid_1 = (dotOut_valid && (((((t_dotOut_valid == 6'h1b) || (t_dotOut_valid == 6'h18)) || (t_dotOut_valid == 6'h16)) || (t_dotOut_valid == 6'h20)) || (t_dotOut_valid == 6'h23)));
  assign dotOut_payload_tdata = dotOut_tdata;
  assign dotOut_payload_last = 1'b1;
  assign dotOut_payload_tuser = t_dotOut_valid;
  assign resOut_valid_1 = (resOut_valid && (resOut_payload_tuser == 6'h10));
  assign resOut_payload_tdata_1 = resOut_payload_tdata;
  assign resOut_payload_last_1 = resOut_payload_last;
  assign resOut_payload_tuser_1 = resOut_payload_tuser;
  assign p2sOut_valid_1 = (p2sOut_valid && ((((p2sOut_payload_tuser == 6'h1f) || (p2sOut_payload_tuser == 6'h0)) || (p2sOut_payload_tuser == 6'h01)) || (p2sOut_payload_tuser == 6'h02)));
  assign p2sOut_payload_tdata_1 = p2sOut_payload_tdata;
  assign p2sOut_payload_last_1 = p2sOut_payload_last;
  assign p2sOut_payload_tuser_1 = p2sOut_payload_tuser;
  assign nodeIn_valid = (|{p2sOut_valid_1,{dotOut_valid_1,resOut_valid_1}});
  assign t_nodeIn_payload_last = {p2sOut_valid_1,dotOut_valid_1};
  assign nodeIn_payload_last = t_nodeIn_payload_last_1;
  assign nodeIn_payload_tdata = t_nodeIn_payload_tdata;
  assign nodeIn_payload_tuser = t_nodeIn_payload_tuser;
  assign c2c_to_valid = node_io_to_valid;
  assign c2c_to_payload_last = node_io_to_payload_last;
  assign c2c_to_payload_tdata = node_io_to_payload_tdata;
  assign c2c_to_payload_tuser = node_io_to_payload_tuser;
  assign c2c_to_payload_tdest = node_io_to_payload_tdest;
  assign c2c_from_ready = 1'b1;
  assign nodeOutNoLast_valid = node_io_output_valid;
  assign nodeOutNoLast_tdata = node_io_output_payload_tdata;
  assign nodeOutNoLast_tuser = node_io_output_payload_tuser;
  assign nodeOutNoLast_tdest = node_io_output_payload_tdest;
  assign allReduceOut_tvalid = node_reduce_output_regNext_valid;
  assign allReduceOut_tdata = node_reduce_output_regNext_tdata;
  assign allReduceOut_tuser = node_reduce_output_regNext_tuser;
  assign allGatherOut_tvalid = nodeOutNoLast_regNext_valid;
  assign allGatherOut_tdata = nodeOutNoLast_regNext_tdata;
  assign allGatherOut_tuser = nodeOutNoLast_regNext_tuser;
  assign directIndex_valid = (indexIn_valid && (indexIn_payload_tuser != 6'h1e));
  assign directIndex_payload_tdata = indexIn_payload_tdata;
  assign directIndex_payload_tuser = indexIn_payload_tuser;
  assign directIndex_payload_last = indexIn_payload_last;
  assign indexOut_valid = (|{t_indexOut_valid_2,{t_indexOut_valid_1,t_indexOut_valid}});
  assign t_indexOut_payload_last_3 = {t_indexOut_valid_2,t_indexOut_valid_1};
  assign indexOut_payload_last = t_indexOut_payload_last_4;
  assign indexOut_payload_tdata = t_indexOut_payload_tdata_3;
  assign indexOut_payload_tuser = t_indexOut_payload_tuser_3;
  assign indexOut_tvalid = indexOut_valid;
  assign indexOut_tlast = indexOut_payload_last;
  assign indexOut_tdata = indexOut_payload_tdata;
  assign indexOut_tuser = indexOut_payload_tuser;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      nodeIn_regNext_valid <= 1'b0;
      t_io_from_valid <= 1'b0;
      node_reduce_output_regNext_valid <= 1'b0;
      nodeOutNoLast_regNext_valid <= 1'b0;
      t_indexOut_valid <= 1'b0;
      t_indexOut_valid_1 <= 1'b0;
      t_indexOut_valid_2 <= 1'b0;
    end else begin
      nodeIn_regNext_valid <= nodeIn_valid;
      t_io_from_valid <= c2c_from_valid;
      node_reduce_output_regNext_valid <= reduce_output_tvalid;
      nodeOutNoLast_regNext_valid <= nodeOutNoLast_valid;
      t_indexOut_valid <= gateIndexIn_valid;
      t_indexOut_valid_1 <= ugIndexIn_valid;
      t_indexOut_valid_2 <= directIndex_valid;
    end
  end

  always @(posedge clk_0_clk) begin
    nodeIn_regNext_payload_last <= nodeIn_payload_last;
    nodeIn_regNext_payload_tdata <= nodeIn_payload_tdata;
    nodeIn_regNext_payload_tuser <= nodeIn_payload_tuser;
    t_io_from_payload_last <= c2c_from_payload_last;
    t_io_from_payload_tdata <= c2c_from_payload_tdata;
    t_io_from_payload_tuser <= c2c_from_payload_tuser;
    t_io_from_payload_tdest <= c2c_from_payload_tdest;
    node_reduce_output_regNext_tdata <= reduce_output_tdata;
    node_reduce_output_regNext_tuser <= reduce_output_tuser;
    nodeOutNoLast_regNext_tdata <= nodeOutNoLast_tdata;
    nodeOutNoLast_regNext_tuser <= nodeOutNoLast_tuser;
    nodeOutNoLast_regNext_tdest <= nodeOutNoLast_tdest;
    t_indexOut_payload_last <= gateIndexIn_payload_last;
    t_indexOut_payload_tdata <= gateIndexIn_payload_tdata;
    t_indexOut_payload_tuser <= gateIndexIn_payload_tuser;
    t_indexOut_payload_last_1 <= ugIndexIn_payload_last;
    t_indexOut_payload_tdata_1 <= ugIndexIn_payload_tdata;
    t_indexOut_payload_tuser_1 <= ugIndexIn_payload_tuser;
    t_indexOut_payload_last_2 <= directIndex_payload_last;
    t_indexOut_payload_tdata_2 <= directIndex_payload_tdata;
    t_indexOut_payload_tuser_2 <= directIndex_payload_tuser;
  end


endmodule

