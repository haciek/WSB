;; autor: Maciej Habasiński
;; nr albumu: 152697

(defun increment-if-odd (i)
  (if (= (mod i 2) 1)
    (+ i 1)
    i))


(defun generate-list ()
  (loop for i below 100 collect (increment-if-odd (random 100))))


(defun bubble-sort (nums)
  (do ((i 0 (1+ i)))
    ((= i (length nums)) nums)
    (do ((j 0 (1+ j)))
      ((= j (- (length nums) i 1)))
      (when (< (nth j nums) (nth (1+ j) nums ))
        (rotatef (nth j nums) (nth (1+ j) nums))))))


;; Quicksort
(defun quicksort (nums)
  ;; 1 or 0 elements
  (if (or (null nums) (null (cdr nums)))
    nums
    (let* ((pivot (car nums))
           ;; Elements smaller than the pivot.
           (less (remove-if-not (lambda (x) (> x pivot)) (cdr nums)))  
           ;; Elements greater than or equal to the pivot.
           (greater (remove-if-not (lambda (x) (<= x pivot)) (cdr nums)))) 
      (append (quicksort less) (list pivot) (quicksort greater)))))  


(let ((l (generate-list)))
  (format t "Original: ~a~%" l)
  (setq new-l (copy-list l))
  (bubble-sort l)
  (format t "Bubble Sort: ~a~%" l)
  (format t "Quicksort: ~a~%" (quicksort new-l)))

