(defpackage cl-djula-svg/tests/main
  (:use :cl
        :cl-djula-svg
        :rove))
(in-package :cl-djula-svg/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-djula-svg)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
