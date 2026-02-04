# boards/microchip/sam/sama7d65_curiosity/board.cmake

configure_file(
    ${BOARD_DIR}/support/at91bootstrap.jlink.in
    ${CMAKE_BINARY_DIR}/at91bootstrap.jlink
    @ONLY
)

board_runner_args(jlink 
    "--device=SAMA7D65" 
    "--speed=4000"
    "--iface=jtag"
    "--tool-opt=-jtagconf -1,-1"
    "--flash-script=${CMAKE_BINARY_DIR}/at91bootstrap.jlink"
    "--tool-opt=-jlinkscriptfile ${BOARD_DIR}/support/at91bootstrap.JLinkScript"
)

include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
