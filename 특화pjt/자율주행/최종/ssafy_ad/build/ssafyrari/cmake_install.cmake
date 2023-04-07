# Install script for directory: /home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ssafyrari/msg" TYPE FILE FILES
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ssafyrari/cmake" TYPE FILE FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/build/ssafyrari/catkin_generated/installspace/ssafyrari-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/include/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/share/roseus/ros/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/share/common-lisp/ros/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/share/gennodejs/ros/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/lib/python2.7/dist-packages/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/devel/lib/python2.7/dist-packages/ssafyrari")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/build/ssafyrari/catkin_generated/installspace/ssafyrari.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ssafyrari/cmake" TYPE FILE FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/build/ssafyrari/catkin_generated/installspace/ssafyrari-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ssafyrari/cmake" TYPE FILE FILES
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/build/ssafyrari/catkin_generated/installspace/ssafyrariConfig.cmake"
    "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/build/ssafyrari/catkin_generated/installspace/ssafyrariConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ssafyrari" TYPE FILE FILES "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/package.xml")
endif()

