# Product extra packages+repos
-include vendor/orca/packages/$(PRODUCT_NAME).mk
REPOS_LIST := $(PRODUCT_NAME)

# CM extra packages+repos
ifeq ($(EXTRA_CM_PACKAGES),true)
include vendor/orca/packages/cm.mk
REPOS_LIST += cm
endif

# Remove/Get extra repos (roomservice.xml)
ADD_REPOS := $(shell vendor/orca/tools/removerepos.py $(REPOS_LIST))
REMOVE_REPOS := $(shell vendor/orca/tools/addrepos.py $(REPOS_LIST))
