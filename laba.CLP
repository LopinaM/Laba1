(deffunction ask-value (?question)
    (print ?question)
    (bind ?answer (read))
    ?answer
    )
(deffunction ask-question (?question $?allowed-values)
    (print ?question)
    (bind ?answer (read))
    (if (lexemep ?answer) 
        then (bind ?answer (lowcase ?answer))
	    )
    (while (not (member$ ?answer ?allowed-values)) do
        (print ?question)
        (bind ?answer (read))
        (if (lexemep ?answer) 
            then (bind ?answer (lowcase ?answer))
		    )
	    )
    ?answer
    )
(deffunction yes-or-no (?question)
    (bind ?response (ask-question ?question yes no y n))
    (if (or (eq ?response yes) (eq ?response y))
        then yes 
        else no))


(defrule Autorskay-igruska
    (not (solution ?)) 
    (or
    (Teckstilnua yes)
    (Teddi yes)) 
    =>
    (assert (solution yes))
    	(print "Autorskay-igruska" crlf)
    )

(defrule Teckstilnua
    (not (solution ?)) 
    (not (Teckstilnua ?)) 
    (Gruntovanui-teckstil yes)
        =>
    (assert (Teckstilnua yes))
    )

(defrule Gruntovanui-teckstil
    (not (solution ?)) 
    (not (Gruntovanui-teckstil ?)) 
    (Klei-PVA yes) 
    (Kraski yes) 
        =>
    (assert (Gruntovanui-teckstil yes))
    )

(defrule Klei-PVA
  (not (solution ?)) 
    (not (Klei-PVA ?)) 
    =>
    (assert (Klei-PVA (yes-or-no "Klei-PVA?: ")))
    )

(defrule Kraski
  (not (solution ?)) 
    (not (Kraski ?)) 
    =>
    (assert (Kraski (yes-or-no "Kraski?: ")))
    )


(defrule Teddi
    (not (solution ?)) 
    (not (Teddi ?)) 
    (and 
    (Vukroika yes)
    (Opilki yes))
        =>
    (assert (Teddi yes))
    )

(defrule Opilki
    (not (solution ?)) 
    (not (Opilki ?)) 
    (Plush yes)
    (Derevo yes)
    (Sherst no)
        =>
    (assert (Opilki yes))
    )

(defrule Plush
  (not (solution ?)) 
    (not (Plush ?)) 
    =>
    (assert (Plush (yes-or-no "Plush?: ")))
    )

(defrule Derevo
  (not (solution ?)) 
    (not (Derevo ?)) 
    =>
    (assert (Derevo (yes-or-no "Derevo?: ")))
    )

(defrule Sherst
    (not (solution ?)) 
    (not (Sherst ?)) 
    =>
    (assert (Sherst (yes-or-no "Sherst?: ")))
    )

(defrule Vukroika
    (not (solution ?)) 
    (not (Vukroika ?)) 
    (Tkani yes)
    (Nognitci yes)
    (Karandash yes)
        =>
    (assert (Vukroika yes))
    )

(defrule Tkani
  (not (solution ?)) 
    (not (Tkani ?)) 
    =>
    (assert (Tkani (yes-or-no "Tkani?: ")))
    )

(defrule Nognitci
  (not (solution ?)) 
    (not (Nognitci ?)) 
    =>
    (assert (Nognitci (yes-or-no "Nognitci?: ")))
    )

(defrule Karandash
    (not (solution ?)) 
    (not (Karandash ?)) 
    =>
    (assert (Karandash (yes-or-no "Karandash?: ")))
    )


(defrule Hudogestvenya-and-interernaya-igruska
    (not (solution ?)) 
    (and
    (Kuklu yes)
    (Teddi yes)) 
    =>
    (assert (solution yes))
    	(print "Hudogestvenya-and-interernaya-igruska" crlf)
    )


(defrule Kuklu
    (not (solution ?)) 
    (not (Kuklu ?)) 
    (or 
    (Vukroika yes)
    (Imeetsya-lekalo yes))
        =>
    (assert (Kuklu yes))
    )

(defrule Imeetsya-lekalo
    (not (solution ?)) 
    (not (Imeetsya-lekalo ?)) 
    (Prisytstvuet-karton yes)
    (Prisytstvuet-plastic no)
        =>
    (assert (Imeetsya-lekalo yes))
    )

(defrule Prisytstvuet-karton
  (not (solution ?)) 
    (not (Prisytstvuet-karton ?)) 
    =>
    (assert (Prisytstvuet-karton (yes-or-no "Prisytstvuet-karton?: ")))
    )

(defrule Prisytstvuet-plastic
  (not (solution ?)) 
    (not (Prisytstvuet-plastic ?)) 
    =>
    (assert (Prisytstvuet-plastic (yes-or-no "Prisytstvuet-plastic?: ")))
    )


(defrule Igrovaya-igruska
    (not (solution ?)) 
    (or
    (Kuklu yes)
    (Plushevaya yes)
    (Vazannaya yes)) 
    =>
    (assert (solution yes))
    	(print "Igrovaya-igruska" crlf)
    )


(defrule Plushevaya
    (not (solution ?)) 
    (not (Plushevaya ?)) 
    (and 
    (Magckaya-nabivka yes)
    (Imeetsya-lekalo yes))
        =>
    (assert (Plushevaya yes))
    )

(defrule Magckaya-nabivka
    (not (solution ?)) 
    (not (Magckaya-nabivka ?)) 
    (Iskustvenui-mex yes)
    (Prisytstvuet-nitok yes)
        =>
    (assert (Magckaya-nabivka yes))
    )

(defrule Iskustvenui-mex
  (not (solution ?)) 
    (not (Iskustvenui-mex ?)) 
    =>
    (assert (Iskustvenui-mex (yes-or-no "Iskustvenui-mex?: ")))
    )

(defrule Prisytstvuet-nitok
  (not (solution ?)) 
    (not (Prisytstvuet-nitok ?)) 
    =>
    (assert (Prisytstvuet-nitok (yes-or-no "Prisytstvuet-nitok?: ")))
    )


(defrule Vazannaya
    (not (solution ?)) 
    (not (Vazannaya ?)) 
    (and 
    (Magckaya-nabivka yes)
    (Sxema-dlya-vazaniya yes))
        =>
    (assert (Vazannaya yes))
    )

(defrule Sxema-dlya-vazaniya
    (not (solution ?)) 
    (not (Sxema-dlya-vazaniya ?)) 
    (Spicu yes)
    (kruchok yes)
    (Prisytstvuet-igl no)
        =>
    (assert (Sxema-dlya-vazaniya yes))
    )

(defrule Spicu
  (not (solution ?)) 
    (not (Spicu ?)) 
    =>
    (assert (Spicu (yes-or-no "Spicu?: ")))
    )

(defrule kruchok
  (not (solution ?)) 
    (not (kruchok ?)) 
    =>
    (assert (kruchok (yes-or-no "kruchok?: ")))
    )

(defrule Prisytstvuet-igl
  (not (solution ?)) 
    (not (Prisytstvuet-igl ?)) 
    =>
    (assert (Prisytstvuet-igl (yes-or-no "Prisytstvuet-igl?: ")))
    )













