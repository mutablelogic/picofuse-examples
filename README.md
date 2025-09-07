# Picofuse Examples

This repository contains example applications demonstrating the use of the [Picofuse](https://github.com/djthorpe/objc) library
for event-driven embedded hardware programming in Objective-C. You'll need the compiled Picofuse library installed on your system to build these examples,
and a compatible compiler toolchain, plus CMake and pkg-config.

## Building for Darwin (macOS) or Linux

To build the examples on macOS or Linux, ensure you have the Picofuse library installed (e.g., in `/opt/picofuse`). If building
for macOS, you'll need a gcc compiler toolchain (for example,
gcc version 15 installed via Homebrew). Then, you can build the examples using the following command:

```sh
TOOLCHAIN_PATH=/opt/homebrew CC=gcc-15 RELEASE=1 make
```

You can adjust the `TOOLCHAIN_PATH` and `CC` variables as needed for your setup. The `RELEASE=1` flag builds the examples in release mode; omit it for debug mode.
You can also specify the location of the picofuse installation with the `PKG_CONFIG_PATH` variable if it's not in the default location (`/opt/picofuse/lib/pkgconfig`). The output binaries will be located in the `build/Application` directory.

On Linux, any gcc or clang toolchain should work, and you can set the `CC` variable accordingly.

## Building for Pico (Raspberry Pi Pico)

To build the examples for the Raspberry Pi Pico, you'll need to have the Picofuse library compiled for the Pico architecture and a suitable cross-compilation toolchain installed. You can then build the examples using:

```sh
TOOLCHAIN_PATH=/opt/LLVM-ET-Arm-19.1.5-Darwin-universal CC=clang RELEASE=1 PICO_BOARD=pico make
```

You can see which boards are supported by looking at the list of directories in `/opt/picofuse/lib/pico`. Adjust the `TOOLCHAIN_PATH` and `CC` variables as needed for your setup. The output binaries will be located in the `build/Application` directory, with a `.uf2` extension, and you can flash them to your Pico using `picotool` in the `/opt/picofuse/bin` directory.
