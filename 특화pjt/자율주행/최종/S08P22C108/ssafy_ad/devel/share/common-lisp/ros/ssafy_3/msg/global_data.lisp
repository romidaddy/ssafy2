; Auto-generated. Do not edit!


(cl:in-package ssafy_3-msg)


;//! \htmlinclude global_data.msg.html

(cl:defclass <global_data> (roslisp-msg-protocol:ros-message)
  ((nodes_idx
    :reader nodes_idx
    :initarg :nodes_idx
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (links_idx
    :reader links_idx
    :initarg :links_idx
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass global_data (<global_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <global_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'global_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ssafy_3-msg:<global_data> is deprecated: use ssafy_3-msg:global_data instead.")))

(cl:ensure-generic-function 'nodes_idx-val :lambda-list '(m))
(cl:defmethod nodes_idx-val ((m <global_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ssafy_3-msg:nodes_idx-val is deprecated.  Use ssafy_3-msg:nodes_idx instead.")
  (nodes_idx m))

(cl:ensure-generic-function 'links_idx-val :lambda-list '(m))
(cl:defmethod links_idx-val ((m <global_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ssafy_3-msg:links_idx-val is deprecated.  Use ssafy_3-msg:links_idx instead.")
  (links_idx m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <global_data>) ostream)
  "Serializes a message object of type '<global_data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'nodes_idx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'nodes_idx))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'links_idx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'links_idx))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <global_data>) istream)
  "Deserializes a message object of type '<global_data>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'nodes_idx) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'nodes_idx)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'links_idx) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'links_idx)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<global_data>)))
  "Returns string type for a message object of type '<global_data>"
  "ssafy_3/global_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'global_data)))
  "Returns string type for a message object of type 'global_data"
  "ssafy_3/global_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<global_data>)))
  "Returns md5sum for a message object of type '<global_data>"
  "02d022257e750283e1f48933d4a8d19c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'global_data)))
  "Returns md5sum for a message object of type 'global_data"
  "02d022257e750283e1f48933d4a8d19c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<global_data>)))
  "Returns full string definition for message of type '<global_data>"
  (cl:format cl:nil "string[] nodes_idx~%string[] links_idx~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'global_data)))
  "Returns full string definition for message of type 'global_data"
  (cl:format cl:nil "string[] nodes_idx~%string[] links_idx~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <global_data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nodes_idx) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'links_idx) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <global_data>))
  "Converts a ROS message object to a list"
  (cl:list 'global_data
    (cl:cons ':nodes_idx (nodes_idx msg))
    (cl:cons ':links_idx (links_idx msg))
))
