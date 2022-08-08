(defpackage cl-djula-svg/tests/main
  (:use :cl
        :cl-djula-svg
        :rove))
(in-package :cl-djula-svg/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-djula-svg)' in your Lisp.

(defvar *input-dir* (asdf:system-relative-pathname "cl-djula-svg" "static/svgs/"))
(defvar *output-dir* (asdf:system-relative-pathname "cl-djula-svg" "templates/svgs/"))

;; (deftest test-target-1
;;   (testing "should (= 1 1) to be true"
;;     (ok (= 1 1))))

(deftest test-all-attributes
	(testing "should process all attributes"
		(let ((input-file (merge-pathnames #P"chevron-left.svg" *input-dir*))
					(output-file (merge-pathnames #P"chevron-left.svg" *output-dir*)))
			(copy-svg *input-dir* *output-dir*)
		(ok (string= (process-svg-attrs input-file) (uiop:read-file-string output-file))))))

(deftest test-fill-attribute
	(testing "should add fill attribute"
		(let ((input-file (merge-pathnames #P"no-fill.svg" *input-dir*))
					(output-file (merge-pathnames #P"no-fill.svg" *output-dir*)))
			(copy-svg *input-dir* *output-dir*)
		(ok (string= (process-svg-attrs input-file) (uiop:read-file-string output-file))))))


(deftest test-height-attribute
	(testing "should add height attribute"
		(let ((input-file (merge-pathnames #P"no-height.svg" *input-dir*))
					(output-file (merge-pathnames #P"no-height.svg" *output-dir*)))
			(copy-svg *input-dir* *output-dir*)
		(ok (string= (process-svg-attrs input-file) (uiop:read-file-string output-file))))))

(deftest test-width-attribute
	(testing "should add width attribute"
		(let ((input-file (merge-pathnames #P"no-width.svg" *input-dir*))
					(output-file (merge-pathnames #P"no-width.svg" *output-dir*)))
			(copy-svg *input-dir* *output-dir*)
		(ok (string= (process-svg-attrs input-file) (uiop:read-file-string output-file))))))

(deftest test-class-attribute
	(testing "should add class attribute"
		(let ((input-file (merge-pathnames #P"no-class.svg" *input-dir*))
					(output-file (merge-pathnames #P"no-class.svg" *output-dir*)))
			(copy-svg *input-dir* *output-dir*)
		(ok (string= (process-svg-attrs input-file) (uiop:read-file-string output-file))))))

(deftest test-copy-operation
	(testing "should copy all the files"
		(copy-svg *input-dir* *output-dir*)
		(ok (= (length (uiop:directory-files *input-dir*)) (length (uiop:directory-files *output-dir*))))))
