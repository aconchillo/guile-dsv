;;; rfc4180.scm -- Tests for RFC 4180 parser.

;; Copyright (C) 2015 Artyom V. Poptsov <poptsov.artyom@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; The program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with the program.  If not, see <http://www.gnu.org/licenses/>.

(use-modules (srfi srfi-64)
             (srfi srfi-26)
             (dsv))

(test-begin "rfc4180")

(test-assert "dsv-string->list"
  (and (equal? '("a" "b")
               (dsv-string->list "a,b" #\, #:format 'rfc4180))
       (equal? '("a,b" "c")
               (dsv-string->list "\"a,b\",c" #\, #:format 'rfc4180))
       (equal? '("a,b\nc" "d")
               (dsv-string->list "\"a,b\nc\",d" #\, #:format 'rfc4180))))


(test-end "rfc4180")

(exit (= (test-runner-fail-count (test-runner-current)) 0))

;;; rfc4180.scm ends here.
