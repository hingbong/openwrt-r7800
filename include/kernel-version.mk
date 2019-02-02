# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

LINUX_VERSION-3.18 = .133
LINUX_VERSION-4.9 = .154
LINUX_VERSION-4.14 = .97
LINUX_VERSION-4.19 = .19

LINUX_KERNEL_HASH-3.18.133 = 3ec7f47365a8a050e629a5016e90e38a800e840c844901c979e9e796f8dc6711
LINUX_KERNEL_HASH-4.9.154 = 5b314f1ac16f78e10acea0053f0c758e696b28f80272064e0a06bc69dc9d5696
LINUX_KERNEL_HASH-4.14.97 = 8dd2c831ddabfc6241ddca946e600376785fd6f225a24655bc36a0c6b4e945f4
LINUX_KERNEL_HASH-4.19.19 = 99afcaf670479d696eb039e8e0a074988a44d5bd159a9cda5bff214e824669bd

remove_uri_prefix=$(subst git://,,$(subst http://,,$(subst https://,,$(1))))
sanitize_uri=$(call qstrip,$(subst @,_,$(subst :,_,$(subst .,_,$(subst -,_,$(subst /,_,$(1)))))))

ifneq ($(call qstrip,$(CONFIG_KERNEL_GIT_CLONE_URI)),)
  LINUX_VERSION:=$(call sanitize_uri,$(call remove_uri_prefix,$(CONFIG_KERNEL_GIT_CLONE_URI)))
  ifeq ($(call qstrip,$(CONFIG_KERNEL_GIT_REF)),)
    CONFIG_KERNEL_GIT_REF:=HEAD
  endif
  LINUX_VERSION:=$(LINUX_VERSION)-$(call sanitize_uri,$(CONFIG_KERNEL_GIT_REF))
else
ifdef KERNEL_PATCHVER
  LINUX_VERSION:=$(KERNEL_PATCHVER)$(strip $(LINUX_VERSION-$(KERNEL_PATCHVER)))
endif
endif

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
KERNEL_PATCHVER ?= $(KERNEL)

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_HASH:=$(LINUX_KERNEL_HASH-$(strip $(LINUX_VERSION)))
LINUX_KERNEL_HASH?=x
