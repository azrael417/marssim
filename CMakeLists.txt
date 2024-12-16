cmake_minimum_required(VERSION 3.17)

cmake_policy(SET CMP0057 NEW)

set(LANGS Fortran)
project (marssim LANGUAGES ${LANGS})

add_subdirectory (src)

