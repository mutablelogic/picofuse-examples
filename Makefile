# Directory locations
BUILD_DIR ?= build
PKG_CONFIG_PATH ?= /opt/picofuse/lib/pkgconfig

# Build arguments
JOBS ?= $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
MAKEFLAGS += --no-print-directory

# check for RELEASE=1
ifdef RELEASE
	CMAKE_BUILD_TYPE := Release
else
	CMAKE_BUILD_TYPE := Debug
endif

# Configure and build the project
.PHONY: build
build:
	PKG_CONFIG_PATH=${PKG_CONFIG_PATH} cmake \
		-B ${BUILD_DIR} -Wno-dev \
		-D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} \
		-S .
	cmake --build ${BUILD_DIR} -j ${JOBS}

# Clean the build directory
.PHONY: clean
clean:
	@echo "Cleaning build directory"
	@rm -rf ${BUILD_DIR}
