cmake_minimum_required(VERSION 3.20)
project(COMPUTER)

# halfadd.v
add_custom_target(
    gen_halfadd_tb ALL
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/halfadd_tb
)
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/halfadd_tb
    COMMAND iverilog -o ${CMAKE_CURRENT_BINARY_DIR}/halfadd_tb ${CMAKE_SOURCE_DIR}/src/halfadd_tb.v ${CMAKE_SOURCE_DIR}/src/halfadd.v
    DEPENDS ${CMAKE_SOURCE_DIR}/src/halfadd_tb.v ${CMAKE_SOURCE_DIR}/src/halfadd.v
    COMMENT "Compiling halfadd_tb.v halfadd.v to halfadd_tb"
    VERBATIM
)
install( 
    FILES ${CMAKE_CURRENT_BINARY_DIR}/halfadd_tb 
    DESTINATION ${CMAKE_SOURCE_DIR}/bin
    PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
)

# fulladd.v
add_custom_target(
    gen_fulladd_tb ALL
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/fulladd_tb
)
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/fulladd_tb
    COMMAND iverilog -o ${CMAKE_CURRENT_BINARY_DIR}/fulladd_tb ${CMAKE_SOURCE_DIR}/src/fulladd_tb.v ${CMAKE_SOURCE_DIR}/src/fulladd.v ${CMAKE_SOURCE_DIR}/src/halfadd.v
    DEPENDS ${CMAKE_SOURCE_DIR}/src/fulladd_tb.v ${CMAKE_SOURCE_DIR}/src/fulladd.v ${CMAKE_SOURCE_DIR}/src/halfadd.v 
    COMMENT "Compiling fulladd_tb.v fulladd.v halfadd.v to fulladd_tb"
    VERBATIM
)
install( 
    FILES ${CMAKE_CURRENT_BINARY_DIR}/fulladd_tb 
    DESTINATION ${CMAKE_SOURCE_DIR}/bin
    PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
)
