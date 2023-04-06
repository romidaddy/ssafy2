;; Auto-generated. Do not edit!


(when (boundp 'ssafy_3::global_data)
  (if (not (find-package "SSAFY_3"))
    (make-package "SSAFY_3"))
  (shadow 'global_data (find-package "SSAFY_3")))
(unless (find-package "SSAFY_3::GLOBAL_DATA")
  (make-package "SSAFY_3::GLOBAL_DATA"))

(in-package "ROS")
;;//! \htmlinclude global_data.msg.html


(defclass ssafy_3::global_data
  :super ros::object
  :slots (_nodes_idx _links_idx ))

(defmethod ssafy_3::global_data
  (:init
   (&key
    ((:nodes_idx __nodes_idx) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:links_idx __links_idx) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _nodes_idx __nodes_idx)
   (setq _links_idx __links_idx)
   self)
  (:nodes_idx
   (&optional __nodes_idx)
   (if __nodes_idx (setq _nodes_idx __nodes_idx)) _nodes_idx)
  (:links_idx
   (&optional __links_idx)
   (if __links_idx (setq _links_idx __links_idx)) _links_idx)
  (:serialization-length
   ()
   (+
    ;; string[] _nodes_idx
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _nodes_idx)) 4
    ;; string[] _links_idx
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _links_idx)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _nodes_idx
     (write-long (length _nodes_idx) s)
     (dolist (elem _nodes_idx)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _links_idx
     (write-long (length _links_idx) s)
     (dolist (elem _links_idx)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _nodes_idx
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes_idx (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _nodes_idx i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _links_idx
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _links_idx (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _links_idx i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get ssafy_3::global_data :md5sum-) "02d022257e750283e1f48933d4a8d19c")
(setf (get ssafy_3::global_data :datatype-) "ssafy_3/global_data")
(setf (get ssafy_3::global_data :definition-)
      "string[] nodes_idx
string[] links_idx

")



(provide :ssafy_3/global_data "02d022257e750283e1f48933d4a8d19c")


