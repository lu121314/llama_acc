// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module MulAddEngineNew (
  input  wire          wkvIn_tvalid,
  output wire          wkvIn_tready,
  input  wire [511:0]  wkvIn_tdata,
  input  wire          dotIn_tvalid,
  output wire          dotIn_tready,
  input  wire [511:0]  dotIn_tdata,
  input  wire          axpyIn_tvalid,
  output wire          axpyIn_tready,
  input  wire [15:0]   axpyIn_tdata,
  input  wire          preScale_tvalid,
  output wire          preScale_tready,
  input  wire [15:0]   preScale_tdata,
  input  wire          resAdd_tvalid,
  output wire          resAdd_tready,
  input  wire [511:0]  resAdd_tdata,
  output wire          vecOut_tvalid,
  output wire [511:0]  vecOut_tdata,
  output wire [5:0]    vecOut_tuser,
  output wire          scalarOut_tvalid,
  output wire          scalarOut_tlast,
  output wire [15:0]   scalarOut_tdata,
  output wire [5:0]    scalarOut_tuser,
  input  wire          cfg_tvalid,
  output reg           cfg_tready,
  input  wire [31:0]   cfg_tdata,
  output wire [5:0]    preCfgTag,
  output wire [5:0]    postCfgTag,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                mul_wkvIn_tready;
  wire                mul_dotIn_tready;
  wire                mul_axpyIn_tready;
  wire                mul_scale_tready;
  wire                mul_output_tvalid;
  wire       [511:0]  mul_output_tdata;
  wire                mul_cfg_tready;
  wire       [5:0]    mul_preCfgTag;
  wire       [16:0]   mul_secondDim;
  wire                mul_popVldNext;
  wire                add_mulRes_tready;
  wire                add_resAdd_tready;
  wire                add_vecOut_tvalid;
  wire       [511:0]  add_vecOut_tdata;
  wire       [5:0]    add_vecOut_tuser;
  wire                add_scalarOut_tvalid;
  wire                add_scalarOut_tlast;
  wire       [15:0]   add_scalarOut_tdata;
  wire       [5:0]    add_scalarOut_tuser;
  wire                add_cfg_tready;
  wire       [5:0]    add_postCfgTag;
  wire                toMul_valid;
  reg                 toMul_ready;
  wire       [31:0]   toMul_payload;
  wire                toAdd_valid;
  reg                 toAdd_ready;
  wire       [31:0]   toAdd_payload;
  reg                 cfg_fork2_logic_linkEnable_0;
  reg                 cfg_fork2_logic_linkEnable_1;
  wire                toMul_fire;
  wire                toAdd_fire;
  wire                toMulPipe_valid;
  wire                toMulPipe_ready;
  wire       [31:0]   toMulPipe_payload;
  reg                 toMul_rValid;
  reg        [31:0]   toMul_rData;
  wire                toAddPipe_valid;
  wire                toAddPipe_ready;
  wire       [31:0]   toAddPipe_payload;
  reg                 toAdd_rValid;
  reg        [31:0]   toAdd_rData;

  MulEngine_3 mul (
    .wkvIn_tvalid  (wkvIn_tvalid           ), //i
    .wkvIn_tready  (mul_wkvIn_tready       ), //o
    .wkvIn_tdata   (wkvIn_tdata[511:0]     ), //i
    .dotIn_tvalid  (dotIn_tvalid           ), //i
    .dotIn_tready  (mul_dotIn_tready       ), //o
    .dotIn_tdata   (dotIn_tdata[511:0]     ), //i
    .axpyIn_tvalid (axpyIn_tvalid          ), //i
    .axpyIn_tready (mul_axpyIn_tready      ), //o
    .axpyIn_tdata  (axpyIn_tdata[15:0]     ), //i
    .scale_tvalid  (preScale_tvalid        ), //i
    .scale_tready  (mul_scale_tready       ), //o
    .scale_tdata   (preScale_tdata[15:0]   ), //i
    .output_tvalid (mul_output_tvalid      ), //o
    .output_tready (add_mulRes_tready      ), //i
    .output_tdata  (mul_output_tdata[511:0]), //o
    .cfg_tvalid    (toMulPipe_valid        ), //i
    .cfg_tready    (mul_cfg_tready         ), //o
    .cfg_tdata     (toMulPipe_payload[31:0]), //i
    .preCfgTag     (mul_preCfgTag[5:0]     ), //o
    .secondDim     (mul_secondDim[16:0]    ), //o
    .clk_1_clk     (clk_1_clk              ), //i
    .popVldNext    (mul_popVldNext         ), //o
    .clk_1_resetn  (clk_1_resetn           )  //i
  );
  AddEngineNew_3 add (
    .mulRes_tvalid    (mul_output_tvalid        ), //i
    .mulRes_tready    (add_mulRes_tready        ), //o
    .mulRes_tdata     (mul_output_tdata[511:0]  ), //i
    .resAdd_tvalid    (resAdd_tvalid            ), //i
    .resAdd_tready    (add_resAdd_tready        ), //o
    .resAdd_tdata     (resAdd_tdata[511:0]      ), //i
    .vecOut_tvalid    (add_vecOut_tvalid        ), //o
    .vecOut_tdata     (add_vecOut_tdata[511:0]  ), //o
    .vecOut_tuser     (add_vecOut_tuser[5:0]    ), //o
    .scalarOut_tvalid (add_scalarOut_tvalid     ), //o
    .scalarOut_tlast  (add_scalarOut_tlast      ), //o
    .scalarOut_tdata  (add_scalarOut_tdata[15:0]), //o
    .scalarOut_tuser  (add_scalarOut_tuser[5:0] ), //o
    .cfg_tvalid       (toAddPipe_valid          ), //i
    .cfg_tready       (add_cfg_tready           ), //o
    .cfg_tdata        (toAddPipe_payload[31:0]  ), //i
    .postCfgTag       (add_postCfgTag[5:0]      ), //o
    .popVldNext       (mul_popVldNext           ), //i
    .clk_1_clk        (clk_1_clk                ), //i
    .clk_1_resetn     (clk_1_resetn             )  //i
  );
  always @(*) begin
    cfg_tready = 1'b1;
    if(((! toMul_ready) && cfg_fork2_logic_linkEnable_0)) begin
      cfg_tready = 1'b0;
    end
    if(((! toAdd_ready) && cfg_fork2_logic_linkEnable_1)) begin
      cfg_tready = 1'b0;
    end
  end

  assign toMul_valid = (cfg_tvalid && cfg_fork2_logic_linkEnable_0);
  assign toMul_payload = cfg_tdata;
  assign toMul_fire = (toMul_valid && toMul_ready);
  assign toAdd_valid = (cfg_tvalid && cfg_fork2_logic_linkEnable_1);
  assign toAdd_payload = cfg_tdata;
  assign toAdd_fire = (toAdd_valid && toAdd_ready);
  always @(*) begin
    toMul_ready = toMulPipe_ready;
    if((! toMulPipe_valid)) begin
      toMul_ready = 1'b1;
    end
  end

  assign toMulPipe_valid = toMul_rValid;
  assign toMulPipe_payload = toMul_rData;
  always @(*) begin
    toAdd_ready = toAddPipe_ready;
    if((! toAddPipe_valid)) begin
      toAdd_ready = 1'b1;
    end
  end

  assign toAddPipe_valid = toAdd_rValid;
  assign toAddPipe_payload = toAdd_rData;
  assign wkvIn_tready = mul_wkvIn_tready;
  assign dotIn_tready = mul_dotIn_tready;
  assign axpyIn_tready = mul_axpyIn_tready;
  assign preScale_tready = mul_scale_tready;
  assign toMulPipe_ready = mul_cfg_tready;
  assign resAdd_tready = add_resAdd_tready;
  assign toAddPipe_ready = add_cfg_tready;
  assign vecOut_tvalid = add_vecOut_tvalid;
  assign vecOut_tdata = add_vecOut_tdata;
  assign vecOut_tuser = add_vecOut_tuser;
  assign scalarOut_tvalid = add_scalarOut_tvalid;
  assign scalarOut_tlast = add_scalarOut_tlast;
  assign scalarOut_tdata = add_scalarOut_tdata;
  assign scalarOut_tuser = add_scalarOut_tuser;
  assign preCfgTag = mul_preCfgTag;
  assign postCfgTag = add_postCfgTag;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      cfg_fork2_logic_linkEnable_0 <= 1'b1;
      cfg_fork2_logic_linkEnable_1 <= 1'b1;
      toMul_rValid <= 1'b0;
      toAdd_rValid <= 1'b0;
    end else begin
      if(toMul_fire) begin
        cfg_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(toAdd_fire) begin
        cfg_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cfg_tready) begin
        cfg_fork2_logic_linkEnable_0 <= 1'b1;
        cfg_fork2_logic_linkEnable_1 <= 1'b1;
      end
      if(toMul_ready) begin
        toMul_rValid <= toMul_valid;
      end
      if(toAdd_ready) begin
        toAdd_rValid <= toAdd_valid;
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(toMul_ready) begin
      toMul_rData <= toMul_payload;
    end
    if(toAdd_ready) begin
      toAdd_rData <= toAdd_payload;
    end
  end


endmodule

