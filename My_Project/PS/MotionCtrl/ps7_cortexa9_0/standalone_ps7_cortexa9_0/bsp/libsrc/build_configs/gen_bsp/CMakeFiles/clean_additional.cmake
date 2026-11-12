# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\Data\\FPGA\\ZYNQ_XC7Z010_Practice\\My_Project\\PS\\MotionCtrl\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "D:\\Data\\FPGA\\ZYNQ_XC7Z010_Practice\\My_Project\\PS\\MotionCtrl\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "D:\\Data\\FPGA\\ZYNQ_XC7Z010_Practice\\My_Project\\PS\\MotionCtrl\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "D:\\Data\\FPGA\\ZYNQ_XC7Z010_Practice\\My_Project\\PS\\MotionCtrl\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
