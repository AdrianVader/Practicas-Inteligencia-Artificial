
(mapclass Persona)
(mapclass Plato)
(mapclass Desayuno)
(mapclass Comida)
(mapclass Merienda)
(mapclass Cena)
(mapclass Alimento)


(deftemplate actividad
    (slot numero)
    (slot valor))

(deftemplate grasas
    (slot numeroG)
    (slot valorG))

(deftemplate hidratos
    (slot numeroH)
    (slot valorH))

(deffacts actividadIni
    (actividad (numero 0)))

;Según la actividad física que realice la persona usaremos un valor diferente para calcular la cantidad de calorías diaria recomendada
(defrule infoActividad
	?a<-(actividad (numero 0))
	=>
	(assert (actividad (numero 1) (valor 1.2)))
	(assert (actividad (numero 2) (valor 1.375)))
	(assert (actividad (numero 3) (valor 1.55)))
	(assert (actividad (numero 4) (valor 1.725)))
	(assert (actividad (numero 5) (valor 1.9)))
	(retract ?a))

(deffacts grasasIni
    (grasas (numeroG 0)))
		
;Según la actividad física que realice la persona se recomienda un porcentaje distinto de grasas en su dieta
(defrule infoGrasas
	?a<-(grasas (numeroG 0))
	=>
	(assert (grasas (numeroG 1) (valorG 0.15)))
	(assert (grasas (numeroG 2) (valorG 0.20)))
	(assert (grasas (numeroG 3) (valorG 0.25)))
	(assert (grasas (numeroG 4) (valorG 0.30)))
	(assert (grasas (numeroG 5) (valorG 0.35)))
	(retract ?a))

(deffacts hidratosIni
    (hidratos (numeroH 0)))

;Según la actividad física que realice la persona se recomienda un porcentaje distinto de hidratos de carbono en su dieta
(defrule infoHidratos
	?a<-(hidratos (numeroH 0))
	=>
	(assert (hidratos (numeroH 1) (valorH 0.65)))
	(assert (hidratos (numeroH 2) (valorH 0.60)))
	(assert (hidratos (numeroH 3) (valorH 0.55)))
	(assert (hidratos (numeroH 4) (valorH 0.50)))
	(assert (hidratos (numeroH 5) (valorH 0.45)))
	(retract ?a))
	

	
	
	
	
;************************************* Nutrientes *******************************************
	
	
	
	
	
	
;Regla para calcular la cantidad de calorías diaria recomendada para un hombre
;Además del sexo, se tienen en cuenta su edad, estatura, peso y actividad física
(defrule calculoKcalHombre
    ?p<-(object (is-a Persona) (sexoP m)(edadP ?edadP)(estaturaP ?estaturaP)(pesoP ?pesoP)(actividadP ?actividadP) (kcalP 0))
    (actividad (numero ?n&:(eq ?n ?actividadP))(valor ?v))
    =>
    (bind ?calculo (round (* ?v (- (+ (+ 66.5 (* 13.75 ?pesoP)) (* 5.003 ?estaturaP)) (* 6.775 ?edadP)))))
	(slot-set ?p kcalP ?calculo))

;Regla para calcular la cantidad de calorías diaria recomendada para una mujer
;Además del sexo, se tienen en cuenta su edad, estatura, peso y actividad física
(defrule calculoKcalMujer
    ?p<-(object (is-a Persona) (sexoP f)(edadP ?edadP)(estaturaP ?estaturaP)(pesoP ?pesoP)(actividadP ?actividadP) (kcalP 0))
    (actividad (numero ?n&:(eq ?n ?actividadP))(valor ?v))
    =>
    (bind ?calculo (round (* ?v (- (+ (+ 665.1 (* 9.563 ?pesoP)) (* 1.85 ?estaturaP)) (* 4.676 ?edadP)))))
    (slot-set ?p kcalP ?calculo))

;Regla para calcular la cantidad diaria de proteínas que la persona debe incluir en su dieta
;Equivale al 20% de la cantidad de calorías diarias recomendada, se divide entre 4 para pasarlo a gramos
(defrule calculoProteinas
    ?p<-(object (is-a Persona) (pesoP ?pesoP)(kcalP ?kcalP&:(> ?kcalP 0))(proteinasP 0))
    =>
    (bind ?calculo (round (* (* ?kcalP 0.2) 0.25)))
    (slot-set ?p proteinasP ?calculo))

;Regla para calcular la cantidad diaria de hidratos de carbono que la persona debe incluir en su dieta
;El porcentaje depende de la actividad física, pero está entre 45% y 65% de las calorías diarias, se divide entre 4 para pasarlo a gramos
(defrule calculoHidratos
    ?p<-(object (is-a Persona) (pesoP ?pesoP)(actividadP ?actividadP)(kcalP ?kcalP&:(> ?kcalP 0))(hidratosP 0))
    (hidratos (numeroH ?n&:(eq ?n ?actividadP))(valorH ?v))
    =>
    (bind ?calculo (round (* (* ?kcalP ?v) 0.25)))
    (slot-set ?p hidratosP ?calculo))

;Regla para calcular la cantidad diaria de grasas que la persona debe incluir en su dieta
;El porcentaje depende de la actividad física, pero está entre 15% y 35% de las calorías diarias, se divide entre 9 para pasarlo a gramos
(defrule calculoGrasas
    ?p<-(object (is-a Persona) (pesoP ?pesoP)(actividadP ?actividadP)(kcalP ?kcalP&:(> ?kcalP 0))(grasasP 0))
    (grasas (numeroG ?n&:(eq ?n ?actividadP))(valorG ?v))
    =>
    (bind ?calculo (round (/ (* ?kcalP ?v) 9)))
    (slot-set ?p grasasP ?calculo))

	
	
	
	
	

;********************************************************************************************
	
	
	
	
	
	
	
;Los porcentajes de calorías que se deben tomar en cada comida
;Los inicializamos a cero (valor por defecto)
(deftemplate porcentajes
    (slot desayunoP (default 0))
    (slot comidaP (default 0))
    (slot meriendaP (default 0))
    (slot cenaP (default 0)))

(deffacts porcentajesDia
    (porcentajes))

;Calculamos los valores de los porcentajes en una regla, ya que es información subjetiva
(defrule porcentajesDia
    ?p<-(porcentajes (desayunoP 0)(comidaP 0)(meriendaP 0)(cenaP 0))
    =>
	(modify ?p (desayunoP 0.2)(comidaP 0.35)(meriendaP 0.15)(cenaP 0.3)))

	
	
	
	
	
	
;************************************* Enfermedades *******************************************	






	
;Para un conjunto de ingredientes (alimentos) comprueba que no los odia
(deffunction compruebaNoOdia (?ing ?odia)
	(foreach ?i ?ing (if (member$ ?i ?odia) then (return FALSE)))
	(return TRUE)
)

;Función que devuelve TRUE si encuentra algún prohibido(atributo de alimento) en las enfermedades de una persona
(deffunction estaProhibido (?proh ?enf)
	(foreach ?e ?enf (if (member$ ?e ?proh) then (return TRUE)))
	(return FALSE)
)

;Función que devuelve TRUE si encuentra algún ingrediente que sea el alimento que se le pasa
(deffunction contiene (?alim ?ingredientes)
	(if (member$ ?alim ?ingredientes) then (return TRUE))
	(return FALSE)
)

;Si encuentra en un desayuno algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..2) no se utilizan, pero si no da error al compilar)
(defrule compruebaEnfermedadDesayuno "Si encuentra en un desayuno algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..2) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(enfermedadP $?enf))
	?d<-(object (is-a Desayuno) (personaDesayuno ?nombre)(nombrePrimeroDesayuno ?pla1)(nombreSegundoDesayuno ?pla2))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(kcalPlato ?kcalDes1)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(kcalPlato ?kcalDes2)(nombreIngredientesPlato $?nip2))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(prohibido $?proh))
	
	(test (estaProhibido $?proh $?enf))
	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2)))
	
	=>
	(unmake-instance ?d)
)

;Si encuentra en una comida algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)
(defrule compruebaEnfermedadComida "Si encuentra en una comida algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(enfermedadP $?enf))
	?c<-(object (is-a Comida) (personaComida ?nombre)(nombrePrimeroComida ?pla1)(nombreSegundoComida ?pla2)(nombrePostreComida ?pla3))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(kcalPlato ?kcalDes1)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(kcalPlato ?kcalDes2)(nombreIngredientesPlato $?nip2))
	?p5<-(object (is-a Plato) (nombrePlato ?pla3)(kcalPlato ?kcalDes3)(nombreIngredientesPlato $?nip3))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(prohibido $?proh))
	
	(test (estaProhibido $?proh $?enf))
	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2) (contiene ?nombreAl $?nip3)))
	
	=>
	(unmake-instance ?c)
)

;Si encuentra en una merienda algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (meriendaPlato y) no se utiliza, pero si no da error al compilar)
(defrule compruebaEnfermedadMerienda "Si encuentra en una merienda algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (meriendaPlato y) no se utiliza, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(enfermedadP $?enf))
	?m<-(object (is-a Merienda) (personaMerienda ?nombre)(nombrePrimeroMerienda ?pla1))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(meriendaPlato y)(nombreIngredientesPlato $?nip1))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(prohibido $?proh))
	
	(test (estaProhibido $?proh $?enf))
	(test (contiene ?nombreAl $?nip1))
	
	=>
	(unmake-instance ?m)
)

;Si encuentra en una cena algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (cenaPlato y) no se utilizan, pero si no da error al compilar)
(defrule compruebaEnfermedadCena "Si encuentra en una cena algún ingrediente que por enfermedad no debe comer una persona, se elimina (Anotación: (cenaPlato y) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(enfermedadP $?enf))
	?c<-(object (is-a Cena) (personaCena ?nombre)(nombrePrimeroCena ?pla1)(nombreSegundoCena ?pla2)(nombrePostreCena ?pla3))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(cenaPlato y)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(cenaPlato y)(nombreIngredientesPlato $?nip2))
	?p5<-(object (is-a Plato) (nombrePlato ?pla3)(cenaPlato y)(nombreIngredientesPlato $?nip3))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(prohibido $?proh))
	
	(test (estaProhibido $?proh $?enf))
	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2) (contiene ?nombreAl $?nip3)))
	
	=>
	(unmake-instance ?c)
)





;************************************* Vegetariano *******************************************	






;Si encuentra en un desayuno algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)
(defrule compruebaVegetarianoDesayuno "Si encuentra en un desayuno algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(vegetarianoP TRUE))
	?d<-(object (is-a Desayuno) (personaDesayuno ?nombre)(nombrePrimeroDesayuno ?pla1)(nombreSegundoDesayuno ?pla2))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(kcalPlato ?kcalDes1)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(kcalPlato ?kcalDes2)(nombreIngredientesPlato $?nip2))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(origen animal))

	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2)))
	
	=>
	(unmake-instance ?d)
)

;Si encuentra en una comida algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)
(defrule compruebaVegetarianoComida "Si encuentra en una comida algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (kcalPlato ?kcalDes1..3) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(vegetarianoP TRUE))
	?c<-(object (is-a Comida) (personaComida ?nombre)(nombrePrimeroComida ?pla1)(nombreSegundoComida ?pla2)(nombrePostreComida ?pla3))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(kcalPlato ?kcalDes1)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(kcalPlato ?kcalDes2)(nombreIngredientesPlato $?nip2))
	?p5<-(object (is-a Plato) (nombrePlato ?pla3)(kcalPlato ?kcalDes3)(nombreIngredientesPlato $?nip3))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(origen animal))
	
	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2) (contiene ?nombreAl $?nip3)))
	
	=>
	(unmake-instance ?c)
)

;Si encuentra en una merienda algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (meriendaPlato y) no se utiliza, pero si no da error al compilar)
(defrule compruebaVegetarianoMerienda "Si encuentra en una merienda algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (meriendaPlato y) no se utiliza, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(vegetarianoP TRUE))
	?m<-(object (is-a Merienda) (personaMerienda ?nombre)(nombrePrimeroMerienda ?pla1))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(meriendaPlato y)(nombreIngredientesPlato $?nip1))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(origen animal))
	
	(test (contiene ?nombreAl $?nip1))
	
	=>
	(unmake-instance ?m)
)

;Si encuentra en una cena algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (cenaPlato y) no se utilizan, pero si no da error al compilar)
(defrule compruebaVegetarianoCena "Si encuentra en una cena algún ingrediente que por ser vegetariano prefiere no comer una persona, se elimina (Anotación: (cenaPlato y) no se utilizan, pero si no da error al compilar)"

	?p<-(object (is-a Persona) (nombreP ?nombre)(vegetarianoP TRUE))
	?c<-(object (is-a Cena) (personaCena ?nombre)(nombrePrimeroCena ?pla1)(nombreSegundoCena ?pla2)(nombrePostreCena ?pla3))
	?p3<-(object (is-a Plato) (nombrePlato ?pla1)(cenaPlato y)(nombreIngredientesPlato $?nip1))
	?p4<-(object (is-a Plato) (nombrePlato ?pla2)(cenaPlato y)(nombreIngredientesPlato $?nip2))
	?p5<-(object (is-a Plato) (nombrePlato ?pla3)(cenaPlato y)(nombreIngredientesPlato $?nip3))
	?al<-(object (is-a Alimento) (nombre ?nombreAl)(calorias ?kc)(origen animal))
	
	(test (or (contiene ?nombreAl $?nip1) (contiene ?nombreAl $?nip2) (contiene ?nombreAl $?nip3)))
	
	=>
	(unmake-instance ?c)
)





;************************************* Comidas *******************************************	




	
;Regla que genera un desayuno basándose en las necesidades de la persona
(defrule generaDesayuno "Regla que genera un desayuno basándose en las necesidades de la persona"
    ?p<-(object (is-a Persona) (nombreP ?nombre)(kcalP ?kcalP)(proteinasP ?proteinasP)(grasasP ?grasasP)(hidratosP ?hidratosP)(odiaP $?odia)(enfermedadP $?enf))
    (porcentajes (desayunoP ?desP&:(> ?desP 0))(comidaP ?comidaP&:(> ?comidaP 0))(meriendaP ?meriendaP&:(> ?meriendaP 0))(cenaP ?cenaP&:(> ?cenaP 0)))
    
    ?p1<-(object (is-a Plato) (nombrePlato ?nombre1)(desayunoPlato y)(kcalPlato ?kcalDes1)(proteinasPlato ?proteinasDes1)(grasasPlato ?grasasDes1)(hidratosPlato ?hidratosDes1)(tipoPlato bebida)(ingredientesPlato $?ing1))   
    ?p2<-(object (is-a Plato) (nombrePlato ?nombre2)(desayunoPlato y)(kcalPlato ?kcalDes2)(proteinasPlato ?proteinasDes2)(grasasPlato ?grasasDes2)(hidratosPlato ?hidratosDes2)(tipoPlato ?tipoDes2)(ingredientesPlato $?ing2))
    
	(test (compruebaNoOdia $?ing1 $?odia))
	(test (compruebaNoOdia $?ing2 $?odia))
	
	;Comprobación de que está contenido dentro de los márgenes de error
    (test (<= (+ ?kcalDes1 ?kcalDes2) (* (+ ?desP 0.2) ?kcalP)))
    (test (<= (+ ?proteinasDes1 ?proteinasDes2) (* (+ ?desP 0.2) ?proteinasP)))
    (test (<= (+ ?grasasDes1 ?grasasDes2) (* (+ ?desP 0.2) ?grasasP)))
    (test (<= (+ ?hidratosDes1 ?hidratosDes2) (* (+ ?desP 0.2) ?hidratosP)))
    
    (test (neq ?tipoDes2 bebida))
    =>
	(make-instance of Desayuno (nombrePrimeroDesayuno ?nombre1)(nombreSegundoDesayuno ?nombre2)(primeroDesayuno ?p1)(segundoDesayuno ?p2)(personaDesayuno ?nombre)))
	
;Regla que genera una comida basándose en las necesidades de la persona
(defrule generaComida "Regla que genera una comida basándose en las necesidades de la persona"
    ?p<-(object (is-a Persona) (nombreP ?nombre)(kcalP ?kcalP)(proteinasP ?proteinasP)(grasasP ?grasasP)(hidratosP ?hidratosP)(odiaP $?odia)(enfermedadP $?enf))
    (porcentajes (desayunoP ?desP&:(> ?desP 0))(comidaP ?comP&:(> ?comP 0))(meriendaP ?meriendaP&:(> ?meriendaP 0))(cenaP ?cenaP&:(> ?cenaP 0)))
    
    ?p1<-(object (is-a Plato) (nombrePlato ?nombre1)(comidaPlato y)(kcalPlato ?kcalCom1)(proteinasPlato ?proteinasCom1)(grasasPlato ?grasasCom1)(hidratosPlato ?hidratosCom1)(tipoPlato primero)(ingredientesPlato $?ing1))   
    ?p2<-(object (is-a Plato) (nombrePlato ?nombre2)(comidaPlato y)(kcalPlato ?kcalCom2)(proteinasPlato ?proteinasCom2)(grasasPlato ?grasasCom2)(hidratosPlato ?hidratosCom2)(tipoPlato segundo)(ingredientesPlato $?ing2))
    ?p3<-(object (is-a Plato) (nombrePlato ?nombre3)(comidaPlato y)(kcalPlato ?kcalCom3)(proteinasPlato ?proteinasCom3)(grasasPlato ?grasasCom3)(hidratosPlato ?hidratosCom3)(tipoPlato postre)(ingredientesPlato $?ing3))
    
	(test (compruebaNoOdia $?ing1 $?odia))
	(test (compruebaNoOdia $?ing2 $?odia))
	(test (compruebaNoOdia $?ing3 $?odia))
	
    ;Comprobación de que está contenido dentro de los márgenes de error
    (test (>= (+ ?kcalCom1 ?kcalCom2 ?kcalCom3) (* (- ?comP 0.1) ?kcalP)))
    (test (<= (+ ?kcalCom1 ?kcalCom2 ?kcalCom3) (* (+ ?comP 0.1) ?kcalP)))
    (test (>= (+ ?proteinasCom1 ?proteinasCom2 ?proteinasCom3) (* (- ?comP 0.1) ?proteinasP)))
    (test (<= (+ ?proteinasCom1 ?proteinasCom2 ?proteinasCom3) (* (+ ?comP 0.1) ?proteinasP)))
    (test (>= (+ ?grasasCom1 ?grasasCom2 ?grasasCom3) (* (- ?comP 0.1) ?grasasP)))
    (test (<= (+ ?grasasCom1 ?grasasCom2 ?grasasCom3) (* (+ ?comP 0.1) ?grasasP)))
    (test (>= (+ ?hidratosCom1 ?hidratosCom2 ?hidratosCom3) (* (- ?comP 0.1) ?hidratosP)))
    (test (<= (+ ?hidratosCom1 ?hidratosCom2 ?hidratosCom3) (* (+ ?comP 0.1) ?hidratosP)))
    =>
	(make-instance of Comida (nombrePrimeroComida ?nombre1)(nombreSegundoComida ?nombre2)(nombrePostreComida ?nombre3)(primeroComida ?p1)(segundoComida ?p2)(postreComida ?p3)(personaComida ?nombre)))

;Regla que genera una merienda basándose en las necesidades de la persona
(defrule generaMerienda "Regla que genera una merienda basándose en las necesidades de la persona"
    ?p<-(object (is-a Persona) (nombreP ?nombre)(kcalP ?kcalP)(proteinasP ?proteinasP)(grasasP ?grasasP)(hidratosP ?hidratosP)(odiaP $?odia)(enfermedadP $?enf))
    (porcentajes (desayunoP ?desP&:(> ?desP 0))(comidaP ?comidaP&:(> ?comidaP 0))(meriendaP ?merP&:(> ?merP 0))(cenaP ?cenaP&:(> ?cenaP 0)))
    
    ?p1<-(object (is-a Plato) (nombrePlato ?nombre1)(meriendaPlato y)(kcalPlato ?kcalMer)(proteinasPlato ?proteinasMer)(grasasPlato ?grasasMer)(hidratosPlato ?hidratosMer)(tipoPlato ?tipoMer)(ingredientesPlato $?ing))
    
	(test (compruebaNoOdia $?ing $?odia))
	
    ;Comprobación de que está contenido dentro de los márgenes de error
    (test (<= ?kcalMer (* (+ ?merP 0.15) ?kcalP)))
    (test (<= ?proteinasMer (* (+ ?merP 0.15) ?proteinasP)))
    (test (<= ?grasasMer (* (+ ?merP 0.15) ?grasasP)))
    (test (<= ?hidratosMer (* (+ ?merP 0.15) ?hidratosP)))
     =>
	(make-instance of Merienda (nombrePrimeroMerienda ?nombre1)(primeroMerienda ?p1)(personaMerienda ?nombre))
	)

;Regla que genera una cena basándose en las necesidades de la persona
(defrule generaCena "Regla que genera una cena basándose en las necesidades de la persona"
    ?p<-(object (is-a Persona) (nombreP ?nombre)(kcalP ?kcalP)(proteinasP ?proteinasP)(grasasP ?grasasP)(hidratosP ?hidratosP)(odiaP $?odia)(enfermedadP $?enf))
    (porcentajes (desayunoP ?desP&:(> ?desP 0))(comidaP ?comidaP&:(> ?comidaP 0))(meriendaP ?meriendaP&:(> ?meriendaP 0))(cenaP ?cenP&:(> ?cenP 0)))
    
    ?p1<-(object (is-a Plato) (nombrePlato ?nombre1)(cenaPlato y)(kcalPlato ?kcalCen1)(proteinasPlato ?proteinasCen1)(grasasPlato ?grasasCen1)(hidratosPlato ?hidratosCen1)(tipoPlato primero)(ingredientesPlato $?ing1))   
    ?p2<-(object (is-a Plato) (nombrePlato ?nombre2)(cenaPlato y)(kcalPlato ?kcalCen2)(proteinasPlato ?proteinasCen2)(grasasPlato ?grasasCen2)(hidratosPlato ?hidratosCen2)(tipoPlato segundo)(ingredientesPlato $?ing2))
    ?p3<-(object (is-a Plato) (nombrePlato ?nombre3)(cenaPlato y)(kcalPlato ?kcalCen3)(proteinasPlato ?proteinasCen3)(grasasPlato ?grasasCen3)(hidratosPlato ?hidratosCen3)(tipoPlato postre)(ingredientesPlato $?ing3))
    
	(test (compruebaNoOdia $?ing1 $?odia))
	(test (compruebaNoOdia $?ing2 $?odia))
	(test (compruebaNoOdia $?ing3 $?odia))
	
    ;Comprobación de que está contenido dentro de los márgenes de error
    (test (>= (+ ?kcalCen1 ?kcalCen2 ?kcalCen3) (* (- ?cenP 0.1) ?kcalP)))
    (test (<= (+ ?kcalCen1 ?kcalCen2 ?kcalCen3) (* (+ ?cenP 0.1) ?kcalP)))
    (test (>= (+ ?proteinasCen1 ?proteinasCen2 ?proteinasCen3) (* (- ?cenP 0.1) ?proteinasP)))
    (test (<= (+ ?proteinasCen1 ?proteinasCen2 ?proteinasCen3) (* (+ ?cenP 0.1) ?proteinasP)))
    (test (>= (+ ?grasasCen1 ?grasasCen2 ?grasasCen3) (* (- ?cenP 0.1) ?grasasP)))
    (test (<= (+ ?grasasCen1 ?grasasCen2 ?grasasCen3) (* (+ ?cenP 0.1) ?grasasP)))
    (test (>= (+ ?hidratosCen1 ?hidratosCen2 ?hidratosCen3) (* (- ?cenP 0.1) ?hidratosP)))
    (test (<= (+ ?hidratosCen1 ?hidratosCen2 ?hidratosCen3) (* (+ ?cenP 0.1) ?hidratosP)))
    =>
    (make-instance of Cena (nombrePrimeroCena ?nombre1)(nombreSegundoCena ?nombre2)(nombrePostreCena ?nombre3)(primeroCena ?p1)(segundoCena ?p2)(postreCena ?p3)(personaCena ?nombre)))


	
	
	
	
	

;************************************* Menú *******************************************






;Si existen instancias de cada comida forma con estas un dia
(defrule generaDia "Si existen instancias de cada comida forma con estas un dia"

	?d <- (object (is-a Desayuno)(personaDesayuno ?persona)(primeroDesayuno ?d1)(segundoDesayuno ?d2)(usadoDesayuno FALSE))
	?co <- (object (is-a Comida)(personaComida ?persona)(primeroComida ?co1)(segundoComida ?co2)(postreComida ?co3)(usadoComida FALSE))
	?m <- (object (is-a Merienda)(personaMerienda ?persona)(primeroMerienda ?m1)(usadoMerienda FALSE))
	?ce <- (object (is-a Cena)(personaCena ?persona)(primeroCena ?ce1)(segundoCena ?ce2)(postreCena ?ce3)(usadoCena FALSE))

	(test (neq ?co3 ?m1))
	(test (neq ?co3 ?ce3))
	(test (neq ?ce3 ?m1))
	(test (neq ?co3 ?d2))
	(test (neq ?ce3 ?d2))
	(test (neq ?d1 ?m1))
	(test (neq ?co2 ?ce2))
	(test (neq ?co1 ?ce1))
	(test (neq ?d2 ?m1))

	=>
	(slot-set ?d usadoDesayuno TRUE)
	(slot-set ?co usadoComida TRUE)
	(slot-set ?m usadoMerienda TRUE)
	(slot-set ?ce usadoCena TRUE)
	(make-instance of Dia (personaDia ?persona)(desayunoDia ?d) (comidaDia ?co) (meriendaDia ?m) (cenaDia ?ce)))
	
	
	
(reset)
(run)
;(facts)