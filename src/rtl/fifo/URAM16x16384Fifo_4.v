// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module URAM16x16384Fifo_4 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_last,
  input  wire [15:0]   io_push_payload_fragment,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_last,
  output wire [15:0]   io_pop_payload_fragment,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire       [71:0]   fifo_io_push_payload;
  reg                 fifo_io_pop_ready;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [71:0]   fifo_io_pop_payload;
  wire       [12:0]   fifo_io_occupancy;
  wire       [12:0]   fifo_io_availability;
  wire       [1:0]    t_io_push_widthAdapter_counter_valueNext;
  wire       [0:0]    t_io_push_widthAdapter_counter_valueNext_1;
  wire       [2:0]    t_vldElemIn_8;
  wire       [2:0]    t_vldElemIn_9;
  reg        [2:0]    t_vldElemIn_10;
  wire       [2:0]    t_vldElemIn_11;
  reg        [2:0]    t_vldElemIn_12;
  wire       [2:0]    t_vldElemIn_13;
  wire       [0:0]    t_vldElemIn_14;
  wire       [7:0]    t_vldElemOut;
  reg        [15:0]   t_selectSlice_1;
  wire                adaptIn_valid;
  wire                adaptIn_ready;
  wire                adaptIn_payload_last;
  wire       [63:0]   adaptIn_payload_fragment;
  reg        [3:0]    inAdapter_dataMask;
  wire                io_push_fire;
  reg                 io_push_widthAdapter_counter_willIncrement;
  reg                 io_push_widthAdapter_counter_willClear;
  reg        [1:0]    io_push_widthAdapter_counter_valueNext;
  reg        [1:0]    io_push_widthAdapter_counter_value;
  wire                io_push_widthAdapter_counter_willOverflowIfInc;
  wire                io_push_widthAdapter_counter_willOverflow;
  reg        [47:0]   io_push_widthAdapter_buffer;
  reg                 io_push_widthAdapter_sendIt;
  reg        [63:0]   io_push_widthAdapter_data;
  wire       [2:0]    t_vldElemIn;
  wire       [2:0]    t_vldElemIn_1;
  wire       [2:0]    t_vldElemIn_2;
  wire       [2:0]    t_vldElemIn_3;
  wire       [2:0]    t_vldElemIn_4;
  wire       [2:0]    t_vldElemIn_5;
  wire       [2:0]    t_vldElemIn_6;
  wire       [2:0]    t_vldElemIn_7;
  wire       [1:0]    vldElemIn;
  wire       [1:0]    vldElemOut;
  wire                lastOut;
  wire                pop_valid;
  reg                 pop_ready;
  wire                pop_payload_last;
  wire       [15:0]   pop_payload_fragment;
  reg        [1:0]    cnt;
  wire                cntOvf;
  wire                pop_fire;
  wire       [63:0]   t_selectSlice;
  wire       [15:0]   selectSlice;
  wire                pop_m2sPipe_valid;
  wire                pop_m2sPipe_ready;
  wire                pop_m2sPipe_payload_last;
  wire       [15:0]   pop_m2sPipe_payload_fragment;
  reg                 pop_rValid;
  reg                 pop_rData_last;
  reg        [15:0]   pop_rData_fragment;

  assign t_io_push_widthAdapter_counter_valueNext_1 = io_push_widthAdapter_counter_willIncrement;
  assign t_io_push_widthAdapter_counter_valueNext = {1'd0, t_io_push_widthAdapter_counter_valueNext_1};
  assign t_vldElemIn_8 = (t_vldElemIn_9 - 3'b001);
  assign t_vldElemIn_9 = (t_vldElemIn_10 + t_vldElemIn_12);
  assign t_vldElemIn_14 = inAdapter_dataMask[3];
  assign t_vldElemIn_13 = {2'd0, t_vldElemIn_14};
  assign t_vldElemOut = fifo_io_pop_payload[71 : 64];
  assign t_vldElemIn_11 = {inAdapter_dataMask[2],{inAdapter_dataMask[1],inAdapter_dataMask[0]}};
  StreamFifoPipe_9 fifo (
    .io_push_valid   (adaptIn_valid             ), //i
    .io_push_ready   (fifo_io_push_ready        ), //o
    .io_push_payload (fifo_io_push_payload[71:0]), //i
    .io_pop_valid    (fifo_io_pop_valid         ), //o
    .io_pop_ready    (fifo_io_pop_ready         ), //i
    .io_pop_payload  (fifo_io_pop_payload[71:0] ), //o
    .io_flush        (1'b0                      ), //i
    .io_occupancy    (fifo_io_occupancy[12:0]   ), //o
    .io_availability (fifo_io_availability[12:0]), //o
    .clk_0_clk       (clk_0_clk                 ), //i
    .clk_0_resetn    (clk_0_resetn              )  //i
  );
  always @(*) begin
    case(t_vldElemIn_11)
      3'b000 : t_vldElemIn_10 = t_vldElemIn;
      3'b001 : t_vldElemIn_10 = t_vldElemIn_1;
      3'b010 : t_vldElemIn_10 = t_vldElemIn_2;
      3'b011 : t_vldElemIn_10 = t_vldElemIn_3;
      3'b100 : t_vldElemIn_10 = t_vldElemIn_4;
      3'b101 : t_vldElemIn_10 = t_vldElemIn_5;
      3'b110 : t_vldElemIn_10 = t_vldElemIn_6;
      default : t_vldElemIn_10 = t_vldElemIn_7;
    endcase
  end

  always @(*) begin
    case(t_vldElemIn_13)
      3'b000 : t_vldElemIn_12 = t_vldElemIn;
      3'b001 : t_vldElemIn_12 = t_vldElemIn_1;
      3'b010 : t_vldElemIn_12 = t_vldElemIn_2;
      3'b011 : t_vldElemIn_12 = t_vldElemIn_3;
      3'b100 : t_vldElemIn_12 = t_vldElemIn_4;
      3'b101 : t_vldElemIn_12 = t_vldElemIn_5;
      3'b110 : t_vldElemIn_12 = t_vldElemIn_6;
      default : t_vldElemIn_12 = t_vldElemIn_7;
    endcase
  end

  always @(*) begin
    case(cnt)
      2'b00 : t_selectSlice_1 = t_selectSlice[15 : 0];
      2'b01 : t_selectSlice_1 = t_selectSlice[31 : 16];
      2'b10 : t_selectSlice_1 = t_selectSlice[47 : 32];
      default : t_selectSlice_1 = t_selectSlice[63 : 48];
    endcase
  end

  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    io_push_widthAdapter_counter_willIncrement = 1'b0;
    if(io_push_fire) begin
      io_push_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    io_push_widthAdapter_counter_willClear = 1'b0;
    if(((io_push_valid && io_push_payload_last) && adaptIn_ready)) begin
      io_push_widthAdapter_counter_willClear = 1'b1;
    end
  end

  assign io_push_widthAdapter_counter_willOverflowIfInc = (io_push_widthAdapter_counter_value == 2'b11);
  assign io_push_widthAdapter_counter_willOverflow = (io_push_widthAdapter_counter_willOverflowIfInc && io_push_widthAdapter_counter_willIncrement);
  always @(*) begin
    io_push_widthAdapter_counter_valueNext = (io_push_widthAdapter_counter_value + t_io_push_widthAdapter_counter_valueNext);
    if(io_push_widthAdapter_counter_willClear) begin
      io_push_widthAdapter_counter_valueNext = 2'b00;
    end
  end

  always @(*) begin
    io_push_widthAdapter_sendIt = io_push_widthAdapter_counter_willOverflowIfInc;
    if(io_push_payload_last) begin
      io_push_widthAdapter_sendIt = 1'b1;
    end
  end

  assign adaptIn_valid = (io_push_valid && io_push_widthAdapter_sendIt);
  assign adaptIn_payload_last = io_push_payload_last;
  assign io_push_ready = (adaptIn_ready || (! io_push_widthAdapter_sendIt));
  always @(*) begin
    io_push_widthAdapter_data = {io_push_payload_fragment,io_push_widthAdapter_buffer};
    case(io_push_widthAdapter_counter_value)
      2'b00 : begin
        io_push_widthAdapter_data[15 : 0] = io_push_payload_fragment;
      end
      2'b01 : begin
        io_push_widthAdapter_data[31 : 16] = io_push_payload_fragment;
      end
      2'b10 : begin
        io_push_widthAdapter_data[47 : 32] = io_push_payload_fragment;
      end
      default : begin
      end
    endcase
  end

  assign adaptIn_payload_fragment = io_push_widthAdapter_data;
  always @(*) begin
    inAdapter_dataMask[0] = (2'b00 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[1] = (2'b01 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[2] = (2'b10 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[3] = (2'b11 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[0] = (2'b00 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[1] = (2'b01 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[2] = (2'b10 <= io_push_widthAdapter_counter_value);
    inAdapter_dataMask[3] = (2'b11 <= io_push_widthAdapter_counter_value);
  end

  assign t_vldElemIn = 3'b000;
  assign t_vldElemIn_1 = 3'b001;
  assign t_vldElemIn_2 = 3'b001;
  assign t_vldElemIn_3 = 3'b010;
  assign t_vldElemIn_4 = 3'b001;
  assign t_vldElemIn_5 = 3'b010;
  assign t_vldElemIn_6 = 3'b010;
  assign t_vldElemIn_7 = 3'b011;
  assign vldElemIn = t_vldElemIn_8[1:0];
  assign adaptIn_ready = fifo_io_push_ready;
  assign fifo_io_push_payload = {{{adaptIn_payload_last,5'h0},vldElemIn},adaptIn_payload_fragment};
  assign vldElemOut = t_vldElemOut[1 : 0];
  assign lastOut = fifo_io_pop_payload[71];
  assign cntOvf = (cnt == vldElemOut);
  always @(*) begin
    fifo_io_pop_ready = 1'b0;
    if(pop_fire) begin
      if(cntOvf) begin
        fifo_io_pop_ready = 1'b1;
      end
    end
  end

  assign pop_fire = (pop_valid && pop_ready);
  assign t_selectSlice = fifo_io_pop_payload[63 : 0];
  assign selectSlice = t_selectSlice_1;
  assign pop_valid = fifo_io_pop_valid;
  assign pop_payload_fragment = selectSlice;
  assign pop_payload_last = (cntOvf && lastOut);
  always @(*) begin
    pop_ready = pop_m2sPipe_ready;
    if((! pop_m2sPipe_valid)) begin
      pop_ready = 1'b1;
    end
  end

  assign pop_m2sPipe_valid = pop_rValid;
  assign pop_m2sPipe_payload_last = pop_rData_last;
  assign pop_m2sPipe_payload_fragment = pop_rData_fragment;
  assign io_pop_valid = pop_m2sPipe_valid;
  assign pop_m2sPipe_ready = io_pop_ready;
  assign io_pop_payload_last = pop_m2sPipe_payload_last;
  assign io_pop_payload_fragment = pop_m2sPipe_payload_fragment;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      io_push_widthAdapter_counter_value <= 2'b00;
      cnt <= 2'b00;
      pop_rValid <= 1'b0;
    end else begin
      io_push_widthAdapter_counter_value <= io_push_widthAdapter_counter_valueNext;
      if(pop_fire) begin
        cnt <= (cnt + 2'b01);
        if(cntOvf) begin
          cnt <= 2'b00;
        end
      end
      if(pop_ready) begin
        pop_rValid <= pop_valid;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(io_push_fire) begin
      case(io_push_widthAdapter_counter_value)
        2'b00 : begin
          io_push_widthAdapter_buffer[15 : 0] <= io_push_payload_fragment;
        end
        2'b01 : begin
          io_push_widthAdapter_buffer[31 : 16] <= io_push_payload_fragment;
        end
        2'b10 : begin
          io_push_widthAdapter_buffer[47 : 32] <= io_push_payload_fragment;
        end
        default : begin
        end
      endcase
    end
    if(pop_ready) begin
      pop_rData_last <= pop_payload_last;
      pop_rData_fragment <= pop_payload_fragment;
    end
  end


endmodule

