# TRIGGER-CAPTURE

# 🎯 Triggered Data Capture Module (Verilog)

This Verilog module implements a **simple trigger-based data capture** system. When an external `trig` signal goes high, the module **latches the input data (`din`) into `dout`**, and asserts a confirmation signal (`crfm`) indicating successful data transfer.

---

## 📦 Module: `triggering`

### 🧠 Functional Description

- On every rising edge of the clock:
  - If `trig` is high → `din` is latched into `dout`
  - If `trig` is low → `dout` is cleared to `0`
- Continuously checks whether `dout` matches `din`
  - If yes → `crfm = 1` (data confirmed)
  - If no → `crfm = 0`

---

## 🔗 Port Details

| Signal | Direction | Description                                |
|--------|-----------|--------------------------------------------|
| `clk`  | Input     | System clock                               |
| `trig` | Input     | Trigger signal to initiate data latch      |
| `din`  | Input     | 8-bit input data to be latched             |
| `dout` | Output    | 8-bit latched data                         |
| `crfm` | Output    | Confirmation signal (high when valid data) |

---

## ⚙️ Internal Logic Summary

- **Latch Mechanism**: Trigger-controlled synchronous `dout` assignment
- **Comparator**: Checks if `dout == din` to raise the `crfm` flag
- **Asynchronous Combinational Block**: Ensures `crfm` updates in real time

---

## 🔄 Example Behavior

| clk ↑ | trig | din      | dout     | crfm |
|--------|------|-----------|----------|------|
| ✔️     | 1    | `8'hA5`  | `8'hA5` | 1    |
| ✔️     | 0    | `8'h00`  | `8'h00` | 1    |
| ✔️     | 1    | `8'hF0`  | `8'hF0` | 1    |
| ✔️     | 1    | `8'hAA`  | `8'hF0` | 0    ← mismatch until next clk |

---

## 🧪 Testbench Suggestion

```verilog
initial begin
  clk = 0;
  trig = 0;
  din = 8'h00;
  #10 din = 8'hA5; trig = 1;
  #10 trig = 0;
end


💡 Use Cases
FSM event triggering

Data buffering for protocol handshakes

Lightweight data validation and acknowledgment

Register capture systems


👤 Author
K Sree Sai Venkat
FPGA Design | Digital Logic | Embedded VLSI
