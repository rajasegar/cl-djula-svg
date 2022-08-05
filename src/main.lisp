(defpackage cl-djula-svg
  (:use :cl)
	(:export :copy-svg))

(in-package :cl-djula-svg)

(defun copy-svg (from to)
	"Process and copy svg files from 'from' folder to 'to' folder"
	(let ((files (uiop:directory-files from)))
		(ensure-directories-exist to)
		(loop for f in files
				do
				(let ((out-file (merge-pathnames (concatenate 'string (pathname-name f) ".svg") to)))
				(with-open-file (file out-file :direction :output
																		:if-exists :supersede
																		:if-does-not-exist :create)
						(write-sequence (process-svg-attrs f) file))))))

(defun process-svg-attrs (svg-file)
	"Process attributes in SVG like width, height, class and fill
  to add Djula tags"
	(let ((svg (xmls:parse (uiop:read-file-string svg-file))))

		;; process height attribute
		(let ((height-attr (assoc "height" (xmls:node-attrs svg) :test #'string=)))
			(if height-attr
				(let ((height (car (cdr height-attr))))
				;; update height value
				(setf (cdr height-attr)
								(list (format nil "{% if height %}{{height}}{% else %}~A{% endif %}" height))))
				;; add height attribute
				(setf (xmls:node-attrs svg) (append (xmls:node-attrs svg) 
								(list '("height" "{% if height %}{{height}}{% else %}16{% endif %}"))))))

		;; process width attribute
		(let ((width-attr (assoc "width" (xmls:node-attrs svg) :test #'string=)))
			(if width-attr
				(let ((width (car (cdr width-attr))))
				;; update width value
				(setf (cdr (assoc "width" (xmls:node-attrs svg) :test #'string=))
								(list (format nil "{% if width %}{{width}}{% else %}~A{% endif %}" width))))
				;; add width attribute
						(setf (xmls:node-attrs svg) (append (xmls:node-attrs svg) 
										(list '("width" "{% if width %}{{width}}{% else %}16{% endif %}"))))))

		;; process fill attribute
		(let ((fill-attr (assoc "fill" (xmls:node-attrs svg) :test #'string=)))
			(if fill-attr
				(let ((fill (car (cdr fill-attr))))
				;;update fill value
				(setf (cdr (assoc "fill" (xmls:node-attrs svg) :test #'string=))
								(list (format nil "{% if fill %}{{fill}}{% else %}~A{% endif %}" fill))))
				;; add fill attribute 
								(setf (xmls:node-attrs svg) (append (xmls:node-attrs svg) 
												(list '("fill" "{% if fill %}{{fill}}{% else %}currentColor{% endif %}"))))))

		;; (print (xmls:node-attrs svg))
		;; (print (xmls:toxml svg))
		(xmls:toxml svg)
	))


;; (copy-svg "./quicklisp/local-projects/cl-djula-svg/static/svgs/" "./quicklisp/local-projects/cl-djula-svg/templates/svgs/")
