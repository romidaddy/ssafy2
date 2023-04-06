# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ssafyrari: 4 messages, 0 services")

set(MSG_I_FLAGS "-Issafyrari:/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ssafyrari_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_custom_target(_ssafyrari_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ssafyrari" "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" ""
)

get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_custom_target(_ssafyrari_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ssafyrari" "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" ""
)

get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_custom_target(_ssafyrari_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ssafyrari" "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" ""
)

get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_custom_target(_ssafyrari_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ssafyrari" "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
)
_generate_msg_cpp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
)
_generate_msg_cpp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
)
_generate_msg_cpp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
)

### Generating Services

### Generating Module File
_generate_module_cpp(ssafyrari
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ssafyrari_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ssafyrari_generate_messages ssafyrari_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_cpp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_cpp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_cpp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_cpp _ssafyrari_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ssafyrari_gencpp)
add_dependencies(ssafyrari_gencpp ssafyrari_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ssafyrari_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
)
_generate_msg_eus(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
)
_generate_msg_eus(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
)
_generate_msg_eus(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
)

### Generating Services

### Generating Module File
_generate_module_eus(ssafyrari
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ssafyrari_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ssafyrari_generate_messages ssafyrari_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_eus _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_eus _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_eus _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_eus _ssafyrari_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ssafyrari_geneus)
add_dependencies(ssafyrari_geneus ssafyrari_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ssafyrari_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
)
_generate_msg_lisp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
)
_generate_msg_lisp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
)
_generate_msg_lisp(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
)

### Generating Services

### Generating Module File
_generate_module_lisp(ssafyrari
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ssafyrari_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ssafyrari_generate_messages ssafyrari_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_lisp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_lisp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_lisp _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_lisp _ssafyrari_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ssafyrari_genlisp)
add_dependencies(ssafyrari_genlisp ssafyrari_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ssafyrari_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
)
_generate_msg_nodejs(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
)
_generate_msg_nodejs(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
)
_generate_msg_nodejs(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ssafyrari
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ssafyrari_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ssafyrari_generate_messages ssafyrari_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_nodejs _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_nodejs _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_nodejs _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_nodejs _ssafyrari_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ssafyrari_gennodejs)
add_dependencies(ssafyrari_gennodejs ssafyrari_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ssafyrari_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
)
_generate_msg_py(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
)
_generate_msg_py(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
)
_generate_msg_py(ssafyrari
  "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
)

### Generating Services

### Generating Module File
_generate_module_py(ssafyrari
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ssafyrari_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ssafyrari_generate_messages ssafyrari_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/student.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_py _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/global_data.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_py _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/Velo.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_py _ssafyrari_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ssafy/mobility-autodriving-skeleton/ssafy_ad/src/ssafyrari/msg/GPS.msg" NAME_WE)
add_dependencies(ssafyrari_generate_messages_py _ssafyrari_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ssafyrari_genpy)
add_dependencies(ssafyrari_genpy ssafyrari_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ssafyrari_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ssafyrari
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ssafyrari_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ssafyrari
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ssafyrari_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ssafyrari
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ssafyrari_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ssafyrari
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ssafyrari_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ssafyrari
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ssafyrari_generate_messages_py std_msgs_generate_messages_py)
endif()
