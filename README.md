# Stereo_SGM_Accelerator

## Env
WSL-linux

Install verilator dependencies & verilator v5.024

https://verilator.org/guide/latest/install.html

```
sudo apt install gtkwave
```

python = 3.10

```
pip install cocotb==1.8.1
pip install numpy
pip install einops
pip install torch
git clone https://github.com/Devil-SX/dlrtl.git
cd dlrtl
pip install -e .
```

# Reference

verilator

- `v5.024` 这个版本可以成功运行程序
- `v5.030` & `v5.032` 这两个版本在我的机器上无法运行，会卡在 await 的地方，似乎是个例

cocotb

v1.9.0 出bug无法dump 波形

- Cocotb with Debuggpy https://github.com/cocotb/cocotb/discussions/2652
- Cocotb with Tri-state https://github.com/cocotb/cocotb/discussions/3506
经过测试，直接驱动三态在 verilator 下无论是 Force/Release 方法还是 Deposit ，虽然 sda 波形显示正常驱动，但内部没有正确处理三态，I2C Slave 没有读入三态。还是选择写一层 HDL 用以转换