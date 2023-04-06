;; Auto-generated. Do not edit!


(when (boundp 'ssafyrari::GPS)
  (if (not (find-package "SSAFYRARI"))
    (make-package "SSAFYRARI"))
  (shadow 'GPS (find-package "SSAFYRARI")))
(unless (find-package "SSAFYRARI::GPS")
  (make-package "SSAFYRARI::GPS"))

(in-package "ROS")
;;//! \htmlinclude GPS.msg.html


(defclass ssafyrari::GPS
  :super ros::object
  :slots (_longitude _latitude _eastOffset _northOffset ))

(defmethod ssafyrari::GPS
  (:init
   (&key
    ((:longitude __longitude) 0.0)
    ((:latitude __latitude) 0.0)
    ((:eastOffset __eastOffset) 0.0)
    ((:northOffset __northOffset) 0.0)
    )
   (send-super :init)
   (setq _longitude (float __longitude))
   (setq _latitude (float __latitude))
   (setq _eastOffset (float __eastOffset))
   (setq _northOffset (float __northOffset))
   self)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:eastOffset
   (&optional __eastOffset)
   (if __eastOffset (setq _eastOffset __eastOffset)) _eastOffset)
  (:northOffset
   (&optional __northOffset)
   (if __northOffset (setq _northOffset __northOffset)) _northOffset)
  (:serialization-length
   ()
   (+
    ;; float64 _longitude
    8
    ;; float64 _latitude
    8
    ;; float64 _eastOffset
    8
    ;; float64 _northOffset
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _eastOffset
       (sys::poke _eastOffset (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _northOffset
       (sys::poke _northOffset (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _eastOffset
     (setq _eastOffset (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _northOffset
     (setq _northOffset (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ssafyrari::GPS :md5sum-) "873a81f2a8fa219c502e38ff7956f609")
(setf (get ssafyrari::GPS :datatype-) "ssafyrari/GPS")
(setf (get ssafyrari::GPS :definition-)
      "float64 longitude
float64 latitude
float64 eastOffset
float64 northOffset

")



(provide :ssafyrari/GPS "873a81f2a8fa219c502e38ff7956f609")


