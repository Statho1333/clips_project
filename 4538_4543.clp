; -------------CLASSES----------- ;;

(defclass Chemicals
	(is-a USER)
	(role abstract)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values no yes)
;		(cardinality 1 1)
		(create-accessor read-write))
	(slot specific_gravity
		(type FLOAT)
		(range 0.9 1.1)
;		(cardinality 1 1)
		(create-accessor read-write))
	(slot colour
		(type SYMBOL)
		(allowed-values none white red)
;		(cardinality 1 1)
		(create-accessor read-write))
	(slot spectroscopy
		(type SYMBOL)
		(allowed-values none carbon sulphur metal sodium)
;+		(cardinality 1 4)
		(create-accessor read-write))
	(slot chemical_symbol
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values no yes)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot is_stored_at_warehouse
		(type INSTANCE)
		(allowed-classes Warehouse)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(slot radioactivity
		(type SYMBOL)
		(allowed-values no yes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot is_explosive
		(type SYMBOL)
		(allowed-values no yes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot smell
		(type SYMBOL)
		(allowed-values none choking vinegar)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble insoluble)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 0.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(slot english_name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot is_highly_toxic
		(type SYMBOL)
		(allowed-values no yes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot is_suspect
		(type SYMBOL)
		(allowed-values no yes)
		(default no)
		(create-accessor read-write)))

(defclass AcidChemicals
	(is-a Chemicals)
	(role abstract)
	(slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 0.0 5.99)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongAcid
	(is-a AcidChemicals)
	(role concrete)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values yes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values yes)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 0.0 2.99)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakAcid
	(is-a AcidChemicals)
	(role concrete)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 3.0 5.99)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass BaseChemicals
	(is-a Chemicals)
	(role abstract)
	(slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 8.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongBase
	(is-a BaseChemicals)
	(role concrete)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values yes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 11.0 14.0)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakBase
	(is-a BaseChemicals)
	(role concrete)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 8.0 10.99)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass OilChemicals
	(is-a Chemicals)
	(role concrete)
	(slot is_corrosive
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values insoluble)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(slot pH
		(type FLOAT)
		(range 6.0 7.99)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass FacilityNodes
	(is-a USER)
	(role abstract)
	(multislot forward_connected_to
		(type INSTANCE)
		(allowed-classes FacilityNodes)
		(create-accessor read-write))
	(multislot backward_connected_to
		(type INSTANCE)
		(allowed-classes FacilityNodes)
		(create-accessor read-write))
	(slot facility_name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Warehouse
	(is-a FacilityNodes)
	(role concrete)
	(pattern-match reactive)
	(multislot has_stored_chemicals
		(type INSTANCE)
		(allowed-classes Chemicals)
		(create-accessor read-write))
	(slot is_suspect
		(type SYMBOL)
		(allowed-values no yes)
		(create-accessor read-write)))

(defclass Manhole
	(is-a FacilityNodes)
	(pattern-match reactive)
	(role concrete)
	(slot is_suspect
		(type SYMBOL)
		(allowed-values no yes)
		(create-accessor read-write)))

(defclass ControlStation
	(is-a FacilityNodes)
	(role concrete)
	(pattern-match reactive))



;;; -------------INSTANCES----------- ;;
(definstances starting-instances
([hydrochloric-acid] of  StrongAcid

	(is_corrosive yes)
	(can_cause_burn_skin yes)
	(chemical_symbol "HCI")
	(colour none)
	(english_name "Hydrochloric-acid")
	(is_stored_at_warehouse
		[warehouse2] ; +
		[warehouse7]) ; +
	(pH 2.04)
	(radioactivity no)
	(smell choking)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy none))

([acetic-acid] of  WeakAcid

	(is_corrosive no)
	(can_cause_burn_skin no)
	(chemical_symbol "CH3COOH")
	(colour none)
	(english_name "Acetic-acid")
	(is_stored_at_warehouse
		[warehouse2] ; +
		[warehouse4] ; + 
		[warehouse8]) ; +
	(pH 3.39)
	(radioactivity no)
	(smell vinegar)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy none))

([transformer-oil] of  OilChemicals

	(is_corrosive no)
	(can_cause_burn_skin no)
	(colour none)
	(english_name "Transformer-oil")
	(is_highly_toxic yes)
	(is_stored_at_warehouse
		[warehouse3] ; +
		[warehouse6]) ; +
	(pH 7.0)
	(radioactivity no)
	(smell none)
	(solubility insoluble)
	(specific_gravity 1.0)
	(spectroscopy carbon))

([carbonic-acid] of  WeakAcid

	(is_corrosive no)
	(can_cause_burn_skin no)
	(chemical_symbol "H2CO3")
	(colour none)
	(english_name "Carbonic-Acid")
	(is_stored_at_warehouse
		[warehouse4] ; +
		[warehouse6] ; +
		[warehouse8]) ; +
	(pH 4.18)
	(radioactivity no)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy carbon))

([sulphuric-acid] of  StrongAcid

	(is_corrosive yes)
	(can_cause_burn_skin yes)
	(chemical_symbol "H2SO4")
	(colour none)
	(english_name "Sulphuric-acid")
	(is_explosive no)
	(is_stored_at_warehouse
		[warehouse1] ; +
		[warehouse5] ; +
		[warehouse7]) ; +
	(pH 1.87)
	(radioactivity no)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy sulphur))

([sodium-hydroxide] of  StrongBase

	(is_corrosive yes)
	(can_cause_burn_skin no)
	(chemical_symbol "NaOH")
	(colour none)
	(english_name "Sodium-hydroxide")
	(is_stored_at_warehouse [warehouse8]) ; +
	(pH 11.95)
	(radioactivity no)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy sodium))

([warehouse1] of  Warehouse

	(facility_name "Warehouse1")
	(forward_connected_to [manhole1]) ; +
	(has_stored_chemicals
		[sulphuric-acid] ; +
		[petrol])) ; +

([manhole1] of  Manhole

	(backward_connected_to [warehouse1]) ; +
	(facility_name "Manhole1")
	(forward_connected_to [manhole9])) ; +

([warehouse2] of  Warehouse

	(facility_name "Warehouse2")
	(forward_connected_to [manhole2]) ; +
	(has_stored_chemicals
		[hydrochloric-acid]  ; +
		[acetic-acid])); +

([manhole2] of  Manhole

	(backward_connected_to [warehouse2]) ; +
	(facility_name "Manhole2")
	(forward_connected_to [manhole9])) ; +

([warehouse3] of  Warehouse

	(facility_name "Warehouse3")
	(forward_connected_to [manhole3]) ; +
	(has_stored_chemicals
		[rubidium-hydroxide] ; +
		[transformer-oil])); +

([manhole3] of  Manhole

	(backward_connected_to [warehouse3]) ; +
	(facility_name "Manhole3")
	(forward_connected_to [manhole9])) ; +

([warehouse4] of  Warehouse

	(facility_name "Warehouse4")
	(forward_connected_to [manhole4]) ; +
	(has_stored_chemicals
		[acetic-acid]; +
		[carbonic-acid]; +
		[petrol])) ; +

([manhole4] of  Manhole

	(backward_connected_to [warehouse4]) ; +
	(facility_name "Manhole4")
	(forward_connected_to [manhole10])) ; +

([warehouse5] of  Warehouse

	(facility_name "Warehouse5")
	(forward_connected_to [manhole5]) ; +
	(has_stored_chemicals
		[sulphuric-acid] ; +
		[chromogen-23] ; +
		[petrol])) ; +

([chromogen-23] of  WeakBase

	(is_corrosive no)
	(can_cause_burn_skin no)
	(colour red)
	(english_name "Chromogen-23")
	(is_stored_at_warehouse [warehouse5]) ; +
	(pH 9.5)
	(radioactivity no)
	(smell none)
	(solubility soluble)
	(specific_gravity 0.9)
	(spectroscopy none))

([manhole5] of  Manhole

	(backward_connected_to [warehouse5]) ; +
	(facility_name "Manhole5")
	(forward_connected_to [manhole10])) ; +

([warehouse6] of  Warehouse

	(facility_name "Warehouse6")
	(forward_connected_to [manhole6]) ; +
	(has_stored_chemicals
		[carbonic-acid]; +
		[aluminium-hydroxide] ; +
		[transformer-oil])); +

([manhole6] of  Manhole

	(backward_connected_to [warehouse6]) ; +
	(facility_name "Manhole6")
	(forward_connected_to [manhole11])) ; +

([warehouse7] of  Warehouse

	(facility_name "Warehouse7")
	(forward_connected_to [manhole7]) ; +
	(has_stored_chemicals
		[sulphuric-acid] ; +
		[hydrochloric-acid])) ; +

([manhole7] of  Manhole

	(backward_connected_to [warehouse7]) ; +
	(facility_name "Manhole7")
	(forward_connected_to [manhole11])) ; +

([warehouse8] of  Warehouse

	(facility_name "Warehouse8")
	(forward_connected_to [manhole8]) ; +
	(has_stored_chemicals
		[acetic-acid] ; +
		[carbonic-acid] ; +
		[sodium-hydroxide])) ; +

([manhole8] of  Manhole

	(backward_connected_to [warehouse8]) ; +
	(facility_name "Manhole8")
	(forward_connected_to [manhole13])) ; +

([manhole9] of  Manhole

	(backward_connected_to
		[manhole1] ; +
        [manhole2] ; +
		[manhole3]) ; +
	(facility_name "Manhole9")
	(forward_connected_to [manhole12])) ; +

([manhole10] of  Manhole

	(backward_connected_to
		[manhole4] ; +
		[manhole5]) ; +
	(facility_name "Manhole10")
	(forward_connected_to [manhole12])) ; +

([manhole11] of  Manhole

	(backward_connected_to
		[manhole6] ; +
		[manhole7]) ; +
	(facility_name "Manhole11")
	(forward_connected_to [manhole13])) ; +

([aluminium-hydroxide] of  WeakBase

	(is_corrosive no)
	(can_cause_burn_skin no)
	(chemical_symbol "AI(OH)3")
	(colour white)
	(english_name "Aluminium-hydroxide")
	(is_stored_at_warehouse [warehouse6]) ;+
	(pH 9.5)
	(radioactivity no)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.1)
	(spectroscopy metal))

([manhole12] of  Manhole

	(backward_connected_to
		[manhole10] ; +
		[manhole9]) ; +
	(facility_name "Manhole12")
	(forward_connected_to [control-station])) ; +

([manhole13] of  Manhole

	(backward_connected_to
		[manhole11] ; +
		[manhole8]) ; +
	(facility_name "Manhole13")
	(forward_connected_to [control-station])) ; +

([control-station] of  ControlStation
    (backward_connected_to
        [manhole12] ; +
        [manhole13]) ; +
	(facility_name "ControlStation"))

([rubidium-hydroxide] of  WeakBase

	(is_corrosive no)
	(can_cause_burn_skin no)
	(chemical_symbol "RbOH")
	(colour none)
	(english_name "Rubidium-hydroxide")
	(is_stored_at_warehouse [warehouse3]) ; +
	(pH 9.5)
	(radioactivity yes)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.1)
	(spectroscopy metal))

([petrol] of  OilChemicals

	(is_corrosive no)
	(can_cause_burn_skin no)
	(colour none)
	(english_name "Petrol")
	(is_explosive yes)
	(is_stored_at_warehouse
		[warehouse1] ; +
		[warehouse4] ; +
		[warehouse5]) ; +
	(pH 7.0)
	(radioactivity no)
	(smell none)
	(solubility insoluble)
	(specific_gravity 0.9)
	(spectroscopy carbon))

) ; end of definstances


;---------------- START OF THE PROGRAMM LOGIC ------------------



;----------------------- FUNCTIONS HERE ----------------------------
;Used for the starting question
;Returns the symbols that are available to be chosen at the beggining
(deffunction create-specs ()
	(create$ pH  solubility spectroscopy colour smell specific_gravity radioactivity))


;Evaluates the right answer for the user prompt.
;Nothing special
(deffunction return-proper-question (?measurement)
	(if (eq ?measurement pH) then (bind ?msg "Type pH measurement"))
	(if (eq ?measurement solubility) then (bind ?msg "Can the chemical be diluted to water? (soluble or insoluble)"))
	(if (eq ?measurement spectroscopy) then (bind ?msg "What is the output of the spectroscopy? (none, sulphur, carbon, sodium, metal)"))
	(if (eq ?measurement colour) then (bind ?msg "What is the colour of the chemical? (white, red, none)"))
	(if (eq ?measurement smell) then (bind ?msg "What is the smell of the chemical (choking, vinegar, none)"))
	(if (eq ?measurement specific_gravity) then (bind ?msg "What is the specific gravity of the chemical (provide a number between 0.9 to 1.1)"))
	(if (eq ?measurement radioactivity) then (bind ?msg "Is the chemical radioactive? (yes or no)"))
	(return ?msg))

;Boolean function to check if the measurement equals the slot value of the instance
(deffunction check-measurement (?s ?m ?v) ; ?s derives from suspect ?m from measurement ?v vfrom value
	(if (eq ?m pH) then (return (= ?v (send ?s get-pH)))) ; special treatment because it is float
	(return (eq ?v (send ?s (sym-cat get- ?m))))) ; all other cases are the same, concat the symbol with function sym-cat

; Function to create a path from the warehouse to the control station
;Return a list (the path)
;The idea is that this list will be used for the final output aswell
(deffunction create-path (?ch ?sp) ; ?ch derives from chemical, ?sp derives from starting point
	(send ?sp put-is_suspect yes) ; mark the wh
	(bind $?L (create$ ?ch ?sp)); Create a list with the name of the chemical and the warehouse where it is stored
	(while (not (eq (class ?sp) ControlStation)) do ; check if it is not a CS (in this programm the control Station is the last facility, this is why it is the stopping rule) 
		(bind ?sp (nth$ 1 (send ?sp get-forward_connected_to)));get the name of the facility (forward-connected-to is multislot, but in our programm we know that we have only 1 forward connection)
		(if (eq (class ?sp) Manhole) then (send ?sp put-is_suspect yes))	
		(bind $?L (create$ $?L ?sp))); recreate the list with the new connection
	;(print "Path is " ?L crlf)
	(return $?L)) ; return the list


; Function to filter all the manholes
; AT LEAST one manhole must be already a suspect, if not out will be empty
(deffunction filter-manholes ($?L) ; a list of manholes
  (bind $?out (create$)) ; create an empty list
  (while (> (length$ $?L) 0) do 
    (bind ?n (nth$ 1 $?L)) ; examine the first element
    (if (eq (send ?n get-is_suspect) yes) ; if it is suspect
      then
        (bind $?out (create$ $?out ?n))) ; add it to the output list
    (bind $?L (rest$ $?L))) ; check the rest of the list
  (return $?out)) ; return all that are suspects

; Function to pick only one manhole from the suspect list
; AT LEAST  one manhole must be polluted each time it is called
(deffunction pick-one-manhole ($?L)
  (if (= (length$ $?L) 1) then ; if it only one element no need to ask,
  	(bind ?x (nth$ 1 $?L)) ; this is for sure the suspect
	(return ?x))

  (if (= (length$ $?L) 2) then ; special occasion where there are only 2 elements
  	(bind ?a (nth$ 1 $?L))
	(bind ?b (nth$ 2 $?L))
	(print "Is " ?a " polluted? (yes/no): ")
	(bind ?answer (read))
	(if (eq ?answer yes) then
		(send ?b put-is_suspect no)
		(return ?a)
	else
		(send ?a put-is_suspect no)
		(return ?b)))	

  (bind ?i 1) ; counter
  (while (<= ?i (length$ $?L)) do 
    (bind ?x (nth$ ?i $?L)) ; fetch me the ?i manhole ;;NEED TO ADD AN IF TO NOT PRINT MESSAGE IF THERE IS ONLY ONE PATH
    (print "Is " ?x " polluted? (yes/no): ") ; ask if it is polluted
    (bind ?answer (read)) ; bind the answer

    (if (eq ?answer yes) then ; if it is polluted
      (bind ?j (+ ?i 1))  ; make a counter for the rest of the list and turn suspect_is no
      (while (<= ?j (length$ $?L)) do
        (bind ?y (nth$ ?j $?L)) 
		(send ?y put-is_suspect no)
        (bind ?j (+ ?j 1))
      )
      (return ?x) ; return the manhole that is polluted on this stage
    else
      (send ?x put-is_suspect no); if it wasnt polluted, go on to next iteration
      (bind ?i (+ ?i 1))
    )
  )
  (return FALSE))

  ;Prints the potential hazards, that the chemical can cause
  (deffunction print-cautions (?ch)
	(if (eq yes (send ?ch get-is_corrosive)) then (print " Corrosive" crlf))
	(if (eq yes (send ?ch get-can_cause_burn_skin)) then (print " Can burn the skin" crlf))
	(if (eq yes (send ?ch get-is_explosive)) then (print " Highly Explosive!" crlf))
	(if (eq yes (send ?ch get-is_highly_toxic)) then (print " Highly toxic" crlf)))



  ;-------------------------------PROGRAMM FLOW------------------------------




;Starting rule, creates multifield "create-specs", which stores which data will user provide.
;Sets strategy mea
;Changes the target to goal make-questions
(defrule initial-question
	=>
	(readline)
	(bind $?measurements (create-specs))
	(bind $?chemicals (find-all-instances ((?c Chemicals)) TRUE))
	(set-strategy mea)
	(print "For which measurements will values be provided " ?measurements " ")
	(bind $?answer (explode$ (readline)))
	(assert (suspect-measurements $?answer))
	(assert (suspects ?chemicals))
	(assert (goal make-questions)))

;Gets the user measurements for each measurement that the user proposed that he will use
(defrule measurements-questions
	(goal make-questions) ; if foal is make-questions
	(suspect-measurements $? ?m $?) ; then for each measurememnt that he will provide
	=>
	(readline) ; take spaces that might have been left
	(print (str-cat (return-proper-question ?m) " ")) ; print the right message
	(bind ?answer (explode$ (readline))) ; CHECK propably better with read instead of readline
	(assert (answer ?m ?answer))) ; assert the answer as a fact


;Reisignes the goal to make suspects
(defrule go-to-suspects
	?x <- (goal make-questions)
	=>
	(retract ?x)
	(assert (goal make-suspects)))

;Rule that keeps in a list the suspects
;Avoids duplicates lists
;At the start all are suspects, but if a suspect fails at least one answer, he is considered innocent and doesnt need to pass the next test
(defrule evaluate-suspects
	(goal make-suspects)
	?x <- (suspects $?start ?s $?finish) ; keep me the $start and the $finish, if $s is not a suspect i will need to remove him later
	(answer ?m ?v) ; for all the answers that the user gave me
	(test (not (check-measurement ?s ?m ?v))) ; evaluate if he is a suspect or not
	=>
	(retract ?x) ; he is, so retract the old list
	(assert (suspects $?start $?finish)) ; create the old list from start and finish remaining suspects, 
)

;Reisignes the goal to second phase
(defrule end-first-phase
	?x <- (goal make-suspects)
	=>
	(retract ?x)
	(assert (goal start-second-phase)))

;Collects all the possible paths from the warehouse to the collection, for each suspect chemical
;for each different warehouse it is stored
(defrule collect-paths
	(goal start-second-phase) 
	(suspects $? ?s $?) ; for each suspect in the suspects fact
	=>
	(bind $?whs (send ?s get-is_stored_at_warehouse)) ; fetch me all the warehouses the suspect is stored
	(while (> (length$ $?whs) 0) do ; while there are remaining warehouses in the $whs
		(bind ?w (nth$ 1 $?whs)) ; take the first
		(bind $?L (create-path ?s ?w)) ; ; find the path to the control station
		(assert (path $?L)) ; assert it in the facts
		(bind $?whs (rest$ $?whs)))) ; reduce the $?whs by one

(defrule continue-paths
	?x <- (goal start-second-phase)
	=>
	(retract ?x)
	(assert (goal exonerate-manholes))
	(assert (control-station start)))

;Every first step starts from CS
;It runs only 1 time
;Its goal is to evaluate the first polluted manhole
(defrule evaluate-suspect-manholes
	?z <- (goal exonerate-manholes) ; we wont use time more than 1 times
	?x <- (control-station start) ; flag
	(object (is-a ControlStation) ; find the control station
			(name ?cs) ; dont rly need the name for this project because there is only 1 cs
			(backward_connected_to $?B)) ; find all the manholes that upstream to the cs
	=>
	(retract ?x) ; it was a flag
	(retract ?z) ; wont use it again
	(bind $?NewB (filter-manholes $?B)) ; fetch me all the manholes that suspect 
	(bind ?y (pick-one-manhole $?NewB)) ; pick only one by questions from the user
	(assert (checking ?y)) ; keep which manhole we are checking
	(assert (goal evaluate-suspects-middle))) 


(defrule evaluate-suspects-go-on
	?x <- (goal evaluate-suspects-middle)
	=>
	(retract ?x)
	(assert (goal evaluate-suspect-manholes2)))

;If we find a wh, this means that we have found our suspect
(defrule eval-warehouse
  ?k <- (goal evaluate-suspect-manholes2)
  ?x <- (checking ?y) ; if this is a wh
  (object (is-a Warehouse) (name ?y)) ; with a name y 
  =>
  (retract ?k ?x) ; retract those facts
  (assert (goal announce-suspect-on-wh ?y)) ; 
)
;If we evaluate manholes
(defrule eval-manhole
  (goal evaluate-suspect-manholes2)
  ?x <- (checking ?y) 
  (object (is-a Manhole) (name ?y) (backward_connected_to $?B)); find me those facilities that this manhole is backwards connected
  =>
  (retract ?x) ; retract the old manhole
  (bind $?NewB (filter-manholes $?B)) ; fetch me the suspects only
  (bind ?z (pick-one-manhole $?NewB)) ; ask which one is the suspect
  (assert (checking ?z)) ; assert the new facility to investigate
)

(defrule announce-suspect
	(goal announce-suspect-on-wh ?wh)
	(path ?s ?wh $?)
	=>
	(print "The chemical that possible caused the contamination is " (instance-name-to-symbol ?s) crlf)
	(print "Potential dangers are: " crlf)
	(print-cautions ?s)
	(print "The root of the contamination is: " (instance-name-to-symbol ?wh) crlf))







