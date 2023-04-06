
(cl:in-package :asdf)

(defsystem "ssafyrari-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GPS" :depends-on ("_package_GPS"))
    (:file "_package_GPS" :depends-on ("_package"))
    (:file "Velo" :depends-on ("_package_Velo"))
    (:file "_package_Velo" :depends-on ("_package"))
    (:file "global_data" :depends-on ("_package_global_data"))
    (:file "_package_global_data" :depends-on ("_package"))
    (:file "student" :depends-on ("_package_student"))
    (:file "_package_student" :depends-on ("_package"))
  ))