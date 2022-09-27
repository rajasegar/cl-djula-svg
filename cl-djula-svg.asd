(defsystem "cl-djula-svg"
  :version "0.1.0"
  :author "Rajasegar Chandran"
  :license "MIT"
  :depends-on (:xmls :alexandria)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Handle SVGs in Djula Templates"
  :in-order-to ((test-op (test-op "cl-djula-svg/tests"))))

(defsystem "cl-djula-svg/tests"
  :author "Rajasegar Chandran"
  :license "MIT"
  :depends-on ("cl-djula-svg"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-djula-svg"
  :perform (test-op (op c) (symbol-call :rove :run c)))
