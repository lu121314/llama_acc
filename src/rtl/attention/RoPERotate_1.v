// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module RoPERotate_1 (
  input  wire          io_input_valid,
  input  wire [15:0]   io_input_payload,
  output wire          io_output_valid,
  output wire [15:0]   io_output_payload_A,
  output wire [15:0]   io_output_payload_B,
  input  wire [6:0]    cfg_dim,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                rotateFifo_io_push_valid;
  reg                 rotateFifo_io_pop_ready;
  reg                 bypassFifo_io_pop_ready;
  wire                rotateFifo_io_push_ready;
  wire                rotateFifo_io_pop_valid;
  wire       [15:0]   rotateFifo_io_pop_payload;
  wire       [6:0]    rotateFifo_io_occupancy;
  wire       [6:0]    rotateFifo_io_availability;
  wire                bypassFifo_io_push_ready;
  wire                bypassFifo_io_pop_valid;
  wire       [15:0]   bypassFifo_io_pop_payload;
  wire       [6:0]    bypassFifo_io_occupancy;
  wire       [6:0]    bypassFifo_io_availability;
  wire       [5:0]    halfDim;
  reg        [5:0]    inCnt;
  wire                inCntOvf;
  reg                 inputSecondHalf;
  wire                rotateFifoPop_valid;
  wire                rotateFifoPop_ready;
  wire       [15:0]   rotateFifoPop_payload;
  reg                 rotator_rotateFifo_io_pop_rValid;
  reg        [15:0]   rotator_rotateFifo_io_pop_rData;
  wire                bypassFifoPop_valid;
  wire                bypassFifoPop_ready;
  wire       [15:0]   bypassFifoPop_payload;
  reg                 rotator_bypassFifo_io_pop_rValid;
  reg        [15:0]   rotator_bypassFifo_io_pop_rData;
  wire                rotateOut_valid;
  wire       [15:0]   rotateOut_payload;
  reg        [5:0]    rotateOutCnt;
  wire                rotateOutCntOvf;
  reg                 rotateSecondHalf;
  wire                in2Rotate_valid;
  wire       [15:0]   in2Rotate_payload;
  wire       [15:0]   r;

  StreamFifo_142 rotateFifo (
    .io_push_valid   (rotateFifo_io_push_valid       ), //i
    .io_push_ready   (rotateFifo_io_push_ready       ), //o
    .io_push_payload (io_input_payload[15:0]         ), //i
    .io_pop_valid    (rotateFifo_io_pop_valid        ), //o
    .io_pop_ready    (rotateFifo_io_pop_ready        ), //i
    .io_pop_payload  (rotateFifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                           ), //i
    .io_occupancy    (rotateFifo_io_occupancy[6:0]   ), //o
    .io_availability (rotateFifo_io_availability[6:0]), //o
    .clk_0_clk       (clk_0_clk                      ), //i
    .clk_0_resetn    (clk_0_resetn                   )  //i
  );
  StreamFifo_142 bypassFifo (
    .io_push_valid   (io_input_valid                 ), //i
    .io_push_ready   (bypassFifo_io_push_ready       ), //o
    .io_push_payload (io_input_payload[15:0]         ), //i
    .io_pop_valid    (bypassFifo_io_pop_valid        ), //o
    .io_pop_ready    (bypassFifo_io_pop_ready        ), //i
    .io_pop_payload  (bypassFifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                           ), //i
    .io_occupancy    (bypassFifo_io_occupancy[6:0]   ), //o
    .io_availability (bypassFifo_io_availability[6:0]), //o
    .clk_0_clk       (clk_0_clk                      ), //i
    .clk_0_resetn    (clk_0_resetn                   )  //i
  );
  assign halfDim = cfg_dim[6 : 1];
  assign inCntOvf = (inCnt == halfDim);
  always @(*) begin
    rotateFifo_io_pop_ready = rotateFifoPop_ready;
    if((! rotateFifoPop_valid)) begin
      rotateFifo_io_pop_ready = 1'b1;
    end
  end

  assign rotateFifoPop_valid = rotator_rotateFifo_io_pop_rValid;
  assign rotateFifoPop_payload = rotator_rotateFifo_io_pop_rData;
  assign rotateFifo_io_push_valid = (io_input_valid && (! inputSecondHalf));
  always @(*) begin
    bypassFifo_io_pop_ready = bypassFifoPop_ready;
    if((! bypassFifoPop_valid)) begin
      bypassFifo_io_pop_ready = 1'b1;
    end
  end

  assign bypassFifoPop_valid = rotator_bypassFifo_io_pop_rValid;
  assign bypassFifoPop_payload = rotator_bypassFifo_io_pop_rData;
  assign rotateOutCntOvf = (rotateOutCnt == halfDim);
  assign r = io_input_payload;
  assign in2Rotate_valid = (io_input_valid && inputSecondHalf);
  assign in2Rotate_payload = {(! r[15]),r[14 : 0]};
  assign rotateOut_valid = (rotateSecondHalf ? rotateFifoPop_valid : in2Rotate_valid);
  assign rotateOut_payload = (rotateSecondHalf ? rotateFifoPop_payload : in2Rotate_payload);
  assign rotateFifoPop_ready = rotateSecondHalf;
  assign io_output_valid = rotateOut_valid;
  assign io_output_payload_A = bypassFifoPop_payload;
  assign io_output_payload_B = rotateOut_payload;
  assign bypassFifoPop_ready = rotateOut_valid;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      inCnt <= 6'h0;
      inputSecondHalf <= 1'b0;
      rotator_rotateFifo_io_pop_rValid <= 1'b0;
      rotator_bypassFifo_io_pop_rValid <= 1'b0;
      rotateOutCnt <= 6'h0;
      rotateSecondHalf <= 1'b0;
    end else begin
      if(io_input_valid) begin
        inCnt <= (inCnt + 6'h01);
        if(inCntOvf) begin
          inCnt <= 6'h0;
          inputSecondHalf <= (! inputSecondHalf);
        end
      end
      if(rotateFifo_io_pop_ready) begin
        rotator_rotateFifo_io_pop_rValid <= rotateFifo_io_pop_valid;
      end
      if(bypassFifo_io_pop_ready) begin
        rotator_bypassFifo_io_pop_rValid <= bypassFifo_io_pop_valid;
      end
      if(rotateOut_valid) begin
        rotateOutCnt <= (rotateOutCnt + 6'h01);
        if(rotateOutCntOvf) begin
          rotateOutCnt <= 6'h0;
          rotateSecondHalf <= (! rotateSecondHalf);
        end
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(rotateFifo_io_pop_ready) begin
      rotator_rotateFifo_io_pop_rData <= rotateFifo_io_pop_payload;
    end
    if(bypassFifo_io_pop_ready) begin
      rotator_bypassFifo_io_pop_rData <= bypassFifo_io_pop_payload;
    end
  end


endmodule

//StreamDemux_15 replaced by StreamDemux_17

//StreamDemux_16 replaced by StreamDemux_17

//StreamFifo_119 replaced by StreamFifo_116

//StreamFifo_118 replaced by StreamFifo_116

//StreamFifo_117 replaced by StreamFifo_116

