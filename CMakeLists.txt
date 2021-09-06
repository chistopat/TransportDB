cmake_minimum_required(VERSION 2.8)
project(TransportDB)

set(CMAKE_CXX_STANDARD 17)

find_package(SOCI REQUIRED)

add_executable(TransportDB main.cpp)
target_link_libraries(TransportDB PRIVATE SOCI::soci_core SOCI::soci_sqlite)
