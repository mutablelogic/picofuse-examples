cmake_minimum_required(VERSION 3.27)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Define the project
project(picofuse-examples LANGUAGES OBJC C)

# Allow manual override: -D PICOFUSE_PKG=picofuse-darwin-arm64
if(NOT PICOFUSE_PKG)
  string(TOLOWER "${CMAKE_SYSTEM_NAME}" _os)
  string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" _arch)
  set(PICOFUSE_PKG "picofuse-${_os}-${_arch}")
endif()

# pkgconfig
find_package(PkgConfig REQUIRED)
pkg_check_modules(PICOFUSE REQUIRED IMPORTED_TARGET ${PICOFUSE_PKG})

# Lowercase and uppercase system name
# SYSTEM_NAME_PICO // SYSTEM_NAME=pico
# SYSTEM_NAME_DARWIN // SYSTEM_NAME=darwin
# SYSTEM_NAME_LINUX // SYSTEM_NAME=linux
string(TOLOWER ${CMAKE_SYSTEM_NAME} SYSTEM_NAME_LOWER)
string(TOUPPER ${CMAKE_SYSTEM_NAME} SYSTEM_NAME_UPPER)
string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} PROCESSOR_NAME_LOWER)

# Compile options
add_compile_options(
    "-Wall"
    "-Wextra"
    "$<$<CONFIG:DEBUG>:-DDEBUG>"
    "$<$<CONFIG:RELEASE>:-O3>"
    "-DSYSTEM_NAME_${SYSTEM_NAME_UPPER}"
    "-DSYSTEM_NAME=\"${SYSTEM_NAME_LOWER}\""
    "-DSYSTEM_PROCESSOR=\"${PROCESSOR_NAME_LOWER}\""    
)

# Compile options for Objective-C
add_compile_options(
    # Use appropriate runtime flags based on compiler
    $<$<AND:$<COMPILE_LANGUAGE:OBJC>,$<C_COMPILER_ID:Clang>>:-fobjc-runtime=gcc>
    $<$<AND:$<COMPILE_LANGUAGE:OBJC>,$<C_COMPILER_ID:GNU>>:-fgnu-runtime>
    $<$<COMPILE_LANGUAGE:OBJC>:-fobjc-exceptions>
)

# Application examples
add_subdirectory("Application")
