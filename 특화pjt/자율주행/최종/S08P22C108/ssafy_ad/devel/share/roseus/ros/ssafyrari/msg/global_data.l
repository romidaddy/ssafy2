;; Auto-generated. Do not edit!


(when (boundp 'ssafyrari::global_data)
  (if (not (find-package "SSAFYRARI"))
    (make-package "SSAFYRARI"))
  (shadow 'global_data (find-package "SSAFYRARI")))
(unless (find-package "SSAFYRARI::GLOBAL_DATA")
  (make-package "SSAFYRARI::GLOBAL_DATA"))

(in-package "ROS")
;;//! \htmlinclude global_data.msg.html


(defclass ssafyrari::global_data
  :super ros::object
  :slots (_nodes_idx _links_idx _nodes_idx1 _links_idx1 _nodes_idx2 _links_idx2 _change _CC _DD ))

(defmethod ssafyrari::global_data
  (:init
   (&key
    ((:nodes_idx __nodes_idx) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:links_idx __links_idx) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:nodes_idx1 __nodes_idx1) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:links_idx1 __links_idx1) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:nodes_idx2 __nodes_idx2) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:links_idx2 __links_idx2) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:change __change) 0)
    ((:CC __CC) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:DD __DD) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _nodes_idx __nodes_idx)
   (setq _links_idx __links_idx)
   (setq _nodes_idx1 __nodes_idx1)
   (setq _links_idx1 __links_idx1)
   (setq _nodes_idx2 __nodes_idx2)
   (setq _links_idx2 __links_idx2)
   (setq _change (round __change))
   (setq _CC __CC)
   (setq _DD __DD)
   self)
  (:nodes_idx
   (&optional __nodes_idx)
   (if __nodes_idx (setq _nodes_idx __nodes_idx)) _nodes_idx)
  (:links_idx
   (&optional __links_idx)
   (if __links_idx (setq _links_idx __links_idx)) _links_idx)
  (:nodes_idx1
   (&optional __nodes_idx1)
   (if __nodes_idx1 (setq _nodes_idx1 __nodes_idx1)) _nodes_idx1)
  (:links_idx1
   (&optional __links_idx1)
   (if __links_idx1 (setq _links_idx1 __links_idx1)) _links_idx1)
  (:nodes_idx2
   (&optional __nodes_idx2)
   (if __nodes_idx2 (setq _nodes_idx2 __nodes_idx2)) _nodes_idx2)
  (:links_idx2
   (&optional __links_idx2)
   (if __links_idx2 (setq _links_idx2 __links_idx2)) _links_idx2)
  (:change
   (&optional __change)
   (if __change (setq _change __change)) _change)
  (:CC
   (&optional __CC)
   (if __CC (setq _CC __CC)) _CC)
  (:DD
   (&optional __DD)
   (if __DD (setq _DD __DD)) _DD)
  (:serialization-length
   ()
   (+
    ;; string[] _nodes_idx
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _nodes_idx)) 4
    ;; string[] _links_idx
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _links_idx)) 4
    ;; string[] _nodes_idx1
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _nodes_idx1)) 4
    ;; string[] _links_idx1
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _links_idx1)) 4
    ;; string[] _nodes_idx2
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _nodes_idx2)) 4
    ;; string[] _links_idx2
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _links_idx2)) 4
    ;; uint32 _change
    4
    ;; float64[] _CC
    (* 8    (length _CC)) 4
    ;; float64[] _DD
    (* 8    (length _DD)) 4
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
     ;; string[] _nodes_idx1
     (write-long (length _nodes_idx1) s)
     (dolist (elem _nodes_idx1)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _links_idx1
     (write-long (length _links_idx1) s)
     (dolist (elem _links_idx1)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _nodes_idx2
     (write-long (length _nodes_idx2) s)
     (dolist (elem _nodes_idx2)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _links_idx2
     (write-long (length _links_idx2) s)
     (dolist (elem _links_idx2)
       (write-long (length elem) s) (princ elem s)
       )
     ;; uint32 _change
       (write-long _change s)
     ;; float64[] _CC
     (write-long (length _CC) s)
     (dotimes (i (length _CC))
       (sys::poke (elt _CC i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _DD
     (write-long (length _DD) s)
     (dotimes (i (length _DD))
       (sys::poke (elt _DD i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; string[] _nodes_idx1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes_idx1 (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _nodes_idx1 i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _links_idx1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _links_idx1 (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _links_idx1 i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _nodes_idx2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes_idx2 (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _nodes_idx2 i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _links_idx2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _links_idx2 (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _links_idx2 i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; uint32 _change
     (setq _change (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _CC
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _CC (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _CC i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _DD
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _DD (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _DD i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ssafyrari::global_data :md5sum-) "835f29fffac894f6ad460b7c08855f8c")
(setf (get ssafyrari::global_data :datatype-) "ssafyrari/global_data")
(setf (get ssafyrari::global_data :definition-)
      "string[] nodes_idx
string[] links_idx
string[] nodes_idx1
string[] links_idx1
string[] nodes_idx2
string[] links_idx2
uint32 change
float64[] CC
float64[] DD

")



(provide :ssafyrari/global_data "835f29fffac894f6ad460b7c08855f8c")


