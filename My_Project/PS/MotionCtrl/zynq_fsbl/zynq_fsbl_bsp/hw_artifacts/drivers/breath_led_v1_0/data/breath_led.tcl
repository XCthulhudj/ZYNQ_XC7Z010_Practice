proc generate {drv_handle} {
  ::hsi::utils::define_include_file $drv_handle "xparameters.h" "Breath_led" "NUM_INSTANCES" "C_BASEADDR" "C_HIGHADDR" "DEVICE_ID"
  ::hsi::utils::define_canonical_xpars $drv_handle "xparameters.h" "Breath_led" "C_BASEADDR" "C_HIGHADDR" "DEVICE_ID"
}