;; Auto-generated. Do not edit!


(when (boundp 'ssafyrari::Velo)
  (if (not (find-package "SSAFYRARI"))
    (make-package "SSAFYRARI"))
  (shadow 'Velo (find-package "SSAFYRARI")))
(unless (find-package "SSAFYRARI::VELO")
  (make-package "SSAFYRARI::VELO"))

(in-package "ROS")
;;//! \htmlinclude Velo.msg.html


(defclass ssafyrari::Velo
  :super ros::object
  :slots (_velo ))

(defmethod ssafyrari::Velo
  (:init
   (&key
    ((:velo __velo) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _velo __velo)
   self)
  (:velo
   (&optional __velo)
   (if __velo (setq _velo __velo)) _velo)
  (:serialization-length
   ()
   (+
    ;; float64[] _velo
    (* 8    (length _velo)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _velo
     (write-long (length _velo) s)
     (dotimes (i (length _velo))
       (sys::poke (elt _velo i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _velo
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velo (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velo i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ssafyrari::Velo :md5sum-) "bed164f0ee5d61bd8bc4c275368453b2")
(setf (get ssafyrari::Velo :datatype-) "ssafyrari/Velo")
(setf (get ssafyrari::Velo :definition-)
      "float64[] velo

")



(provide :ssafyrari/Velo "bed164f0ee5d61bd8bc4c275368453b2")


