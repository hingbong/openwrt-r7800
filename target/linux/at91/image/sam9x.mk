define Device/default-nand
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  SUBPAGESIZE := 512
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 126KiB -c 2048
endef

define Device/at91sam9263ek
  $(Device/evaluation-dtb)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9263-EK
endef
TARGET_DEVICES += at91sam9263ek

define Device/at91sam9g15ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9G15-EK
endef
TARGET_DEVICES += at91sam9g15ek

define Device/at91sam9g20ek
  $(Device/evaluation-dtb)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9G20-EK
endef
TARGET_DEVICES += at91sam9g20ek

define Device/at91sam9g20ek_2mmc
  $(Device/evaluation-dtb)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9G20-EK
  DEVICE_VARIANT := 2MMC
endef
TARGET_DEVICES += at91sam9g20ek_2mmc

define Device/at91sam9g25ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9G25-EK
endef
TARGET_DEVICES += at91sam9g25ek

define Device/at91sam9g35ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9G35-EK
endef
TARGET_DEVICES += at91sam9g35ek

define Device/at91sam9m10g45ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9M10G45-EK
endef
TARGET_DEVICES += at91sam9m10g45ek

define Device/at91sam9x25ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9X25-EK
endef
TARGET_DEVICES += at91sam9x25ek

define Device/at91sam9x35ek
  $(Device/evaluation)
  DEVICE_VENDOR := Atmel
  DEVICE_MODEL := AT91SAM9X35-EK
endef
TARGET_DEVICES += at91sam9x35ek

define Device/lmu5000
  $(Device/production)
  DEVICE_VENDOR := CalAmp
  DEVICE_MODEL := LMU5000
  DEVICE_PACKAGES := kmod-rtc-pcf2123 kmod-usb-acm kmod-usb-serial \
    kmod-usb-serial-option kmod-usb-serial-sierrawireless kmod-gpio-mcp23s08
endef
TARGET_DEVICES += lmu5000

define Device/tny_a9260
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := TNYA9260
endef
TARGET_DEVICES += tny_a9260

define Device/tny_a9263
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := TNYA9263
endef
TARGET_DEVICES += tny_a9263

define Device/tny_a9g20
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := TNYA9G20
endef
TARGET_DEVICES += tny_a9g20

define Device/usb_a9260
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := USBA9260
endef
TARGET_DEVICES += usb_a9260

define Device/usb_a9263
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := USBA9263
endef
TARGET_DEVICES += usb_a9263

define Device/usb_a9g20
  $(Device/production-dtb)
  DEVICE_VENDOR := Calao
  DEVICE_MODEL := USBA9G20
endef
TARGET_DEVICES += usb_a9g20

define Device/ethernut5
  $(Device/evaluation)
  DEVICE_VENDOR := egnite
  DEVICE_MODEL := Ethernut 5
  UBINIZE_OPTS := -E 5
endef
TARGET_DEVICES += ethernut5

define Device/at91-q5xr5
  $(Device/production-dtb)
  DEVICE_VENDOR := Exegin
  DEVICE_MODEL := Q5XR5
  KERNEL_SIZE := 2048k
endef
#TARGET_DEVICES += at91-q5xr5

define Device/wb45n
  $(Device/evaluation-fit)
  DEVICE_VENDOR := Laird
  DEVICE_MODEL := WB45N
  DEVICE_PACKAGES := \
	kmod-mmc-at91 kmod-ath6kl-sdio ath6k-firmware \
	kmod-usb-storage kmod-fs-vfat kmod-fs-msdos \
	kmod-leds-gpio
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  SUBPAGESIZE := 2048
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 124KiB -c 955
endef
TARGET_DEVICES += wb45n
