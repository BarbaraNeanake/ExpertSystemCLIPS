 Kecerdasan Buatan Membuat Sistem Pakar menggunakan CLIPS
; Barbara Neanake A. 922/494495/TK/54328
; Jasa Konsultasi Keuangan Mahasiswa "Nea's Consultant Academy"

; Introduction
(defrule introduction
   =>
   (printout t "************************************" crlf)
   (printout t "Hello!^^" crlf)
   (printout t "Welcome to Nea's Consultant Academy!" crlf)
   (printout t "************************************" crlf crlf)
   (printout t "Sistem ini akan membantu teman-teman dalam menganalisis masalah keuangan, khususnya bagi mahasiswa." crlf crlf))

;Warm up question
(defrule ask-ready
   =>
   (printout t crlf "Apakah kamu sudah siap untuk menganalisis keuanganmu? (siap/tidak): " crlf)
   (assert (ready (read))))

(defrule handle-response
   (ready siap)
   =>
   (printout t crlf "Okayyy! mari kita mulai!" crlf crlf))

(defrule handle-response
   (ready tidak)
   =>
   (printout t crlf "Baik, kapanpun kamu siap, silakan kembali^^" crlf))

; Input Fakta
(defrule input-facts
   =>
   (printout t crlf "Tolong masukkan informasi berikut berdasarkan dirimu:" crlf)
   (printout t crlf "1. Pendapatan bulanan mahasiswa: " crlf)
   (assert (pendapatan-bulanan (read)))
   (printout t crlf "2. Pengeluaran bulanan mahasiswa: " crlf)
   (assert (pengeluaran-bulanan (read)))
   (printout t crlf "3. Hutang mahasiswa (jika ada): " crlf)
   (assert (utang (read)))
   (printout t crlf "4. Kebutuhan dana darurat (ya/tidak): " crlf)
   (assert (dana-darurat (read))))

; Rules
(defrule rule-1
   (pendapatan-bulanan ?p&:(< ?p 1000000))
   =>
   (printout t crlf "Kamu memiliki pendapatan bulanan rendah, silakan pertimbangkan untuk mencari sumber pendapatan tambahan." crlf crlf))

(defrule rule-2
   (pengeluaran-bulanan ?p&:(> ?p 800000))
   =>
   (printout t crlf "Kamu memiliki kecenderungan pengeluaran bulanan yang tinggi. Cobalah untuk belajar berhemat!" crlf crlf))

(defrule rule-3
   (utang ?u&:(> ?u 500))
   =>
   (printout t crlf "Kamu memiliki hutang yang perlu kamu kelola dengan hati-hati. Prioritaskan pembayaran utang dan hindari menambah utang baru." crlf)
   (printout t "Bijaklah dalam mengambil keputusan!" crlf crlf))

(defrule rule-4
   (utang ?u&:(> ?u 0))
   =>
   (printout t crlf "Kamu memiliki hutang yang relatif lebih tinggi dibandingkan pengeluaran bulanan. Kurangi kebiasaan borosmu!" crlf crlf))

(defrule rule-5
   (dana-darurat ya)
   =>
   (printout t crlf "Kamu perlu segera menabung untuk dana darurat. Kita sebaiknya berjaga-jaga atas kejadian apapun." crlf crlf))

(defrule rule-6
   (and (<= ?p 300000)
        (>= ?q 500000))
   =>
   (printout t "Wah! Kamu memiliki kebiasaan menabung yang baik! Pertahankan kebiasaan tersebut untuk masa depan yang lebih stabil!" crlf crlf))

(defrule rule-7
   (and (<= ?p 2000000)
        (>= ?q 2000000))
   =>
   (printout t crlf "Kamu memiliki risiko mengalami kesulitan keuangan karena pengeluaran melebihi pendapatan. Cobalah untuk mengatur pengeluaranmu!" crlf crlf))

(defrule rule-8
   (and (<= ?p 500000)
        (<= ?q 300000))
   =>
   (printout t crlf "Kamu memiliki kebutuhan dana darurat yang sangat mendesak." crlf crlf))

(defrule rule-9
   (and (<= ?p 500000)
        (> ?q 300000))
   =>
   (printout t crlf "Kamu perlu segera meninjau ulang kebiasaan pengeluaranmu!" crlf crlf))

(defrule rule-10
   (and (<= ?p 1000000)
        (<= ?q 500000))
   =>
   (printout t crlf "Kamu memiliki kebiasaan menabung dengan baik dan bijak dalam mengelola keuangan." crlf crlf))

(defrule rule-11
   (and (<= ?p 3000000)
        (>= ?q 2000000)
        (<= ?u 1000000))
   =>
   (printout t crlf "Kamu memiliki pengeluaran yang tinggi namun masih dalam batas wajar dengan mengelola utang dengan baik." crlf crlf))

(defrule rule-12
   (and (<= ?p 5000000)
        (>= ?q 3000000)
        (<= ?u 2000000))
   =>
   (printout t crlf "Kamu memiliki pengeluaran yang cukup tinggi namun masih dalam batas wajar dengan mengelola utang secara bertanggung jawab." crlf crlf))

(defrule rule-13
   (and (<= ?p 10000000)
        (>= ?q 5000000)
        (<= ?u 5000000))
   =>
   (printout t crlf "Kamu memiliki pengeluaran yang tinggi namun masih dikelola dengan baik dengan mengurangi utang secara bertahap." crlf crlf))

(defrule rule-14
   (and (<= ?p 20000000)
        (>= ?q 10000000)
        (<= ?u 10000000))
   =>
   (printout t crlf "Kamu memiliki pengeluaran yang tinggi namun masih dalam batas wajar dengan mengelola utang secara hati-hati dan efisien." crlf crlf))

(defrule rule-15
   (and (<= ?p 20000000)
        (>= ?q 20000000)
        (<= ?u 20000000))
   =>
   (printout t crlf "Hati-hati, pengeluaranmu melebihi pendapatanmu dan kamu memiliki utang yang signifikan. Segera susun rencana keuangan yang lebih bijak untuk mengatasi situasi ini." crlf crlf))


; Analisis
(defrule analysis
   =>
   (printout t crlf "Terima kasih telah menggunakan Nea's Consultant Academy. Analisis telah selesai dilakukan. Semoga ini dapat membantu pengaturan keuanganmu kedepannya ya!" crlf)
   (printout t crlf "Ingat, You must gain control over your money or the lack of it will forever control you. Sampai Jumpa!^^" crlf crlf))