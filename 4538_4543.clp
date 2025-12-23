; -------------CLASSES----------- ;;
(defclass Chemicals
	(is-a USER)
	(role abstract)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot specific_gravity
		(type FLOAT)
		(range 0.9 1.1)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot colour
		(type SYMBOL)
		(allowed-values white red none)
		(cardinality 1 1)
		(create-accessor read-write))
	(multislot spectroscopy
		(type SYMBOL)
		(allowed-values carbon sulphur metal sodium none)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot chemical_symbol
		(type STRING)
		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(cardinality 0 1)
		(create-accessor read-write))
	(multislot is_stored_at_warehouse
		(type INSTANCE)
		(allowed-classes Warehouse)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot radioactivity
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot is_explosive
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot smell
		(type SYMBOL)
		(allowed-values choking vinegar none)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble insoluble)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 0.0 14.0)
		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot english_name
		(type STRING)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot is_highly_toxic
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(cardinality 1 1)
		(create-accessor read-write)))

(defclass AcidChemicals
	(is-a Chemicals)
	(role abstract)
	(single-slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 0.0 5.99)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongAcid
	(is-a AcidChemicals)
	(role concrete)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values True)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values True)
		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 0.0 2.99)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakAcid
	(is-a AcidChemicals)
	(role concrete)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values False)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values False)
		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 3.0 5.99)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass BaseChemicals
	(is-a Chemicals)
	(role abstract)
	(single-slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values False)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values soluble)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 8.0 14.0)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass StrongBase
	(is-a BaseChemicals)
	(role concrete)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values True)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 11.0 14.0)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass WeakBase
	(is-a BaseChemicals)
	(role concrete)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values False)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 8.0 10.99)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass OilChemicals
	(is-a Chemicals)
	(role concrete)
	(single-slot are_corrosive
		(type SYMBOL)
		(allowed-values False)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot can_cause_burn_skin
;+		(comment "Acids can burn the skin, other chemicals dont")
		(type SYMBOL)
		(allowed-values False)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot solubility
;+		(comment "Can be disolved to water")
		(type SYMBOL)
		(allowed-values insoluble)
		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
		(type FLOAT)
		(range 6.0 7.99)
		(cardinality 0 1)
		(create-accessor read-write)))

(defclass FacilityNodes
	(is-a USER)
	(role concrete)
	(multislot forward_connected_to
		(type INSTANCE)
		(allowed-classes FacilityNodes)
		(create-accessor read-write))
	(multislot backward_connected_to
		(type INSTANCE)
		(allowed-classes FacilityNodes)
		(create-accessor read-write))
	(single-slot facility_name
		(type STRING)
		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Warehouse
	(is-a FacilityNodes)
	(role concrete)
	(multislot has_stored_chemicals
		(type INSTANCE)
		(allowed-classes Chemicals)
		(create-accessor read-write)))

(defclass Manhole
	(is-a FacilityNodes)
	(role concrete))

(defclass ControlStation
	(is-a FacilityNodes)
	(role concrete))



;;; -------------INSTANCES----------- ;;
(definstances starting-instances
([hydrochloric-acid] of  StrongAcid

	(are_corrosive True)
	(can_cause_burn_skin True)
	(chemical_symbol "HCI")
	(colour none)
	(english_name "Hydrochloric-acid")
	(is_stored_at_warehouse
		[warehouse2] ; +
		[warehouse7]) ; +
	(pH 2.04)
	(radioactivity FALSE)
	(smell choking)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy none))

([acetic-acid] of  WeakAcid

	(are_corrosive False)
	(can_cause_burn_skin False)
	(chemical_symbol "CH3COOH")
	(colour none)
	(english_name "Acetic-acid")
	(is_stored_at_warehouse
		[warehouse2] ; +
		[warehouse4] ; + 
		[warehouse8]) ; +
	(pH 3.39)
	(radioactivity FALSE)
	(smell vinegar)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy none))

([transformer-oil] of  OilChemicals

	(are_corrosive False)
	(can_cause_burn_skin False)
	(colour none)
	(english_name "Transformer-oil")
	(is_highly_toxic TRUE)
	(is_stored_at_warehouse
		[warehouse3] ; +
		[warehouse6]) ; +
	(pH 7.0)
	(radioactivity FALSE)
	(smell none)
	(solubility insoluble)
	(specific_gravity 1.0)
	(spectroscopy carbon))

([carbonic-acid] of  WeakAcid

	(are_corrosive False)
	(can_cause_burn_skin False)
	(chemical_symbol "H2CO3")
	(colour none)
	(english_name "Carbonic-Acid")
	(is_stored_at_warehouse
		[warehouse4] ; +
		[warehouse6] ; +
		[warehouse8]) ; +
	(pH 4.18)
	(radioactivity FALSE)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy carbon))

([sulphuric-acid] of  StrongAcid

	(are_corrosive True)
	(can_cause_burn_skin True)
	(chemical_symbol "H2SO4")
	(colour none)
	(english_name "Sulphuric-acid")
	(is_explosive FALSE)
	(is_stored_at_warehouse
		[warehouse1] ; +
		[warehouse5] ; +
		[warehouse7]) ; +
	(pH 1.87)
	(radioactivity FALSE)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.0)
	(spectroscopy sulphur))

([sodium-hydroxide] of  StrongBase

	(are_corrosive True)
	(can_cause_burn_skin False)
	(chemical_symbol "NaOH")
	(colour none)
	(english_name "Sodium-hydroxide")
	(is_stored_at_warehouse [warehouse8]) ; +
	(pH 11.95)
	(radioactivity FALSE)
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

	(are_corrosive False)
	(can_cause_burn_skin False)
	(colour red)
	(english_name "Chromogen-23")
	(is_stored_at_warehouse [warehouse5]) ; +
	(pH 9.5)
	(radioactivity FALSE)
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

	(are_corrosive False)
	(can_cause_burn_skin False)
	(chemical_symbol "AI(OH)3")
	(colour white)
	(english_name "Aluminium-hydroxide")
	(is_stored_at_warehouse [warehouse6]) ;+
	(pH 9.5)
	(radioactivity FALSE)
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

	(are_corrosive False)
	(can_cause_burn_skin False)
	(chemical_symbol "RbOH")
	(colour none)
	(english_name "Rubidium-hydroxide")
	(is_stored_at_warehouse [warehouse3]) ; +
	(pH 9.5)
	(radioactivity TRUE)
	(smell none)
	(solubility soluble)
	(specific_gravity 1.1)
	(spectroscopy metal))

([petrol] of  OilChemicals

	(are_corrosive False)
	(can_cause_burn_skin False)
	(colour none)
	(english_name "Petrol")
	(is_explosive TRUE)
	(is_stored_at_warehouse
		[warehouse1] ; +
		[warehouse4] ; +
		[warehouse5]) ; +
	(pH 7.0)
	(radioactivity FALSE)
	(smell none)
	(solubility insoluble)
	(specific_gravity 0.9)
	(spectroscopy carbon))

) ; end of definstances