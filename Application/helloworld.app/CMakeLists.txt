set(APP_NAME "helloworld.app")
add_executable(${APP_NAME} main.m)
target_link_libraries(${APP_NAME} PRIVATE PkgConfig::PICOFUSE)
