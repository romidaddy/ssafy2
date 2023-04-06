; Auto-generated. Do not edit!


(cl:in-package ssafyrari-msg)


;//! \htmlinclude Velo.msg.html

(cl:defclass <Velo> (roslisp-msg-protocol:ros-message)
  ((velo
    :reader velo
    :initarg :velo
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Velo (<Velo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Velo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Velo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ssafyrari-msg:<Velo> is deprecated: use ssafyrari-msg:Velo instead.")))

(cl:ensure-generic-function 'velo-val :lambda-list '(m))
(cl:defmethod velo-val ((m <Velo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ssafyrari-msg:velo-val is deprecated.  Use ssafyrari-msg:velo instead.")
  (velo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Velo>) ostream)
  "Serializes a message object of type '<Velo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'velo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'velo))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Velo>) istream)
  "Deserializes a message object of type '<Velo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'velo) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'velo)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Velo>)))
  "Returns string type for a message object of type '<Velo>"
  "ssafyrari/Velo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Velo)))
  "Returns string type for a message object of type 'Velo"
  "ssafyrari/Velo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Velo>)))
  "Returns md5sum for a message object of type '<Velo>"
  "bed164f0ee5d61bd8bc4c275368453b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Velo)))
  "Returns md5sum for a message object of type 'Velo"
  "bed164f0ee5d61bd8bc4c275368453b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Velo>)))
  "Returns full string definition for message of type '<Velo>"
  (cl:format cl:nil "float64[] velo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Velo)))
  "Returns full string definition for message of type 'Velo"
  (cl:format cl:nil "float64[] velo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Velo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'velo) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Velo>))
  "Converts a ROS message object to a list"
  (cl:list 'Velo
    (cl:cons ':velo (velo msg))
))
