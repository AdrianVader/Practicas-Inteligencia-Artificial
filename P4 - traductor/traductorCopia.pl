
% Diccionario español
%*********************************************************************



verbo_esp-->[es].
verbo_esp-->[son].
verbo_esp-->[est].
verbo_esp-->[beb].
verbo_esp-->[com].

terminacion_esp(singular)-->[e].
terminacion_esp(plural)-->[en].
terminacion_esp(singular)-->[a].
terminacion_esp(plural)-->[an].

nombre_esp(_)-->[niñ].
nombre_esp(femenino)-->[manzan].
nombre_esp(masculino)-->[batid].
nombre_esp(femenino)-->[cas].
nombre_esp(masculino)-->[libr].
nombre_esp(femenino)-->[libreri].


morfema_esp(femenino, singular)-->[a].
morfema_esp(femenino, plural)-->[as].
morfema_esp(masculino, singular)-->[o].
morfema_esp(masculino, plural)-->[os].
%morfema_esp(femenino, singular)-->[eria].
%morfema_esp(femenino, plural)-->[erias].
morfema_esp(_, singular)-->[e].
morfema_esp(_, plural)-->[es].


adjetivo_esp-->[pequeñ].
adjetivo_esp-->[grand].
adjetivo_esp-->[bonit].
adjetivo_esp-->[blanc].
adjetivo_esp-->[roj].

articulo_esp(masculino, singular)-->[el].
articulo_esp(masculino, plural)-->[los].
articulo_esp(femenino, singular)-->[la].
articulo_esp(femenino, plural)-->[las].
articulo_esp(masculino, singular)-->[un].
articulo_esp(masculino, plural)-->[unos].
articulo_esp(femenino, singular)-->[una].
articulo_esp(femenino, plural)-->[unas].

preposicion_esp-->[en].





% Diccionario inglés
%*********************************************************************




verbo_ing-->[is].
verbo_ing-->[are].
verbo_ing-->[eat].
verbo_ing-->[drink].

terminacion_ing(singular)-->[s].

nombre_ing-->[boy].
nombre_ing-->[girl].
nombre_ing-->[apple].
nombre_ing-->[milkshake].
nombre_ing-->[house].
nombre_ing-->[book].
nombre_ing-->[bookcase].

morfema_ing(plural)-->[s].
%morfema_ing(singular)-->[case].
%morfema_ing(plural)-->[cases].

adjetivo_ing-->[little].
adjetivo_ing-->[big].
adjetivo_ing-->[beautiful].
adjetivo_ing-->[white].
adjetivo_ing-->[red].

articulo_ing(singular)-->[the].
articulo_ing(plural)-->[the].
articulo_ing(singular)-->[a].

preposicion_ing-->[in].





% Analizador de frases en español
%*********************************************************************




% grupo nominal
frase_esp(Frase) :-
	grupo_nominal(Gen, Num, Frase).
	
% nombre, verbo
frase_esp(Frase) :- %% habrá que hacer varias versiones en las que se repartan más o menos(1, 2 ó 3) palabras.
	primero(Frase, Primero, Resto1),
	grupo_nominal(Gen, Num, [Primero]),
	grupo_verbal(Num, Resto1).
	
% articulo+nombre o nombre+adjetivo, verbo
frase_esp(Frase) :-
	primero(Frase, Primero, Resto1),
	primero(Resto1, Segundo, Resto2),
	grupo_nominal(Gen, Num, [Primero,Segundo]),
	grupo_verbal(Num, Resto2).
	
% articulo, nombre, adjetivo, verbo
frase_esp(Frase) :-
	primero(Frase, Primero, Resto1),
	primero(Resto1, Segundo, Resto2),
	primero(Resto2, Tercero, Resto3),
	grupo_nominal(Gen, Num, [Primero,Segundo,Tercero]),
	grupo_verbal(Num, Resto3).
		
% articulo, nombre, adjetivo, verbo, GN
frase_esp(Frase) :-
	primero(Frase, Primero, Resto1),
	primero(Resto1, Segundo, Resto2),
	primero(Resto2, Tercero, Resto3),
	primero(Resto3, Cuarto, Resto4),
	grupo_nominal(Gen, Num, [Primero,Segundo,Tercero]),
	grupo_verbal(Num, [Cuarto]),
	grupo_nominal(Gen1, Num1, Resto4).
	
% articulo, nombre, adjetivo, verbo+preposicion, GN
frase_esp(Frase) :-
	primero(Frase, Primero, Resto1),
	primero(Resto1, Segundo, Resto2),
	primero(Resto2, Tercero, Resto3),
	primero(Resto3, Cuarto, Resto4),
	primero(Resto4, Quinto, Resto5),
	grupo_nominal(Gen, Num, [Primero,Segundo,Tercero]),
	grupo_verbal(Num, [Cuarto, Quinto]),
	grupo_nominal(Gen1, Num1, Resto5).
	

	
% Grupos nominales o verbales en español
%*********************************************************************	
	

	
% nombre
grupo_nominal(Gen, Num, Frase):-
	primero(Frase, Primero, Resto1),
	nombre(Gen, Num, Primero),
	Resto1 = [].

% articulo, nombre	
grupo_nominal(Gen, Num, Frase):-
	primero(Frase, Primero, Resto1),
	articulo_esp(Gen, Num, [Primero],[]),
	primero(Resto1, Segundo, Resto2),
	nombre(Gen, Num, Segundo),
	Resto2 = [].

% nombre, adjetivo	
grupo_nominal(Gen, Num, Frase):-
	primero(Frase, Primero, Resto1),
	nombre(Gen, Num, Primero),
	primero(Resto1, Segundo, Resto2),
	adjetivo(Gen, Num, Segundo),
	Resto2 = [].

% articulo, nombre, adjetivo	
grupo_nominal(Gen, Num, Frase):-
	primero(Frase, Primero, Resto1),
	articulo_esp(Gen, Num, [Primero],[]),
	primero(Resto1, Segundo, Resto2),
	nombre(Gen, Num, Segundo),
	primero(Resto2, Tercero, Resto3),
	adjetivo(Gen, Num, Tercero),
	Resto3 = [].
	
% Los adjetivos por su cuenta no son grupo nominal
/*
% adjetivo
grupo_nominal(Gen, Num, Frase):-
	primero(Frase, Primero, Resto1),
	adjetivo(Gen, Num, Primero),
	Resto1 = [].
*/

% verbo
grupo_verbal(Num, Frase):-
	primero(Frase, Primero, Resto1),
	verbo(Num, Primero),
	Resto1 = [].

% verbo, preposicion	
grupo_verbal(Num, Frase):-
	primero(Frase, Primero, Resto1),
	verbo(Num, Primero),
	primero(Resto1, Segundo, Resto2),
	preposicion_esp([Segundo], []),
	Resto2 = [].


	
	
% Palabras en español
%*********************************************************************




nombre(Gen, Num, Palabra):-
	name(Palabra,ListaASCII),
	nombre_esp(Gen,Palabra1,[]),
	primero(Palabra1,Nombre,Resto1),
	name(Nombre,X),
	morfema_esp(Gen,Num,Palabra2,[]),
	primero(Palabra2,Morfema,Resto2),
	name(Morfema,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
adjetivo(Gen, Num, Palabra):-
	name(Palabra,ListaASCII),
	adjetivo_esp([Adjetivo],[]),
	name(Adjetivo,X),
	morfema_esp(Gen,Num,Palabra2,[]),
	primero(Palabra2,Morfema,Resto2),
	name(Morfema,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
verbo(Num, Palabra):-
	name(Palabra,ListaASCII),
	verbo_esp([Verbo], []),
	name(Verbo,X),
	terminacion_esp(Num, [Terminacion], []),
	name(Terminacion,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
	
	
	
	
% Analizador de frases en inglés
%*********************************************************************
	
	
% grupo nominal
frase_ing(Frase) :-
	grupo_nominal(Num, Frase).

/*
%
frase_ing(Frase) :-
	grupo_nominal(Num, Frase),
	grupo_verbal(Num, Frase).
*/
	
	
% Grupos nominales o verbales en inglés
%*********************************************************************	
	
	
	
% nombre
grupo_nominal(Num, Frase):-
	primero(Frase, Primero, Resto1),
	nombre([Primero], []).
	
% articulo, nombre	
grupo_nominal(Num, Frase):-
	primero(Frase, Primero, Resto1),
	articulo_ing(Num, [Primero],[]),
	primero(Resto1, Segundo, Resto2),
	nombre(Num, Segundo),
	Resto2 = [].
	
/*
grupo_nominal(Num):-
	primero(Frase, Primero, Resto1),
	nombreIng(Primero).




nombreIng(Palarba):-
	name(Palabra,ListaASCII).
	% ???????????????????????????????????????????????????????   =S Tiene que poder aceptar boy & boys, lo que implica lista vacía & lista con 's'.
*/



% Palabras en inglés
%*********************************************************************




nombre(Num, Palabra):-
	name(Palabra,ListaASCII),
	nombre_ing(Palabra1,[]),
	primero(Palabra1,Nombre,Resto1),
	name(Nombre,X),
	morfema_ing(Num,Palabra2,[]),
	primero(Palabra2,Morfema,Resto2),
	name(Morfema,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
adjetivo(Num, Palabra):-
	name(Palabra,ListaASCII),
	adjetivo_ing([Adjetivo],[]),
	name(Adjetivo,X),
	morfema_ing(Num,Palabra2,[]),
	primero(Palabra2,Morfema,Resto2),
	name(Morfema,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
verbo(Num, Palabra):-
	name(Palabra,ListaASCII),
	verbo_ing([Verbo], []),
	name(Verbo,X),
	terminacion_ing(Num, [Terminacion], []),
	name(Terminacion,Y),
	concatenar(X,Y,Resultado),
	ListaASCII = Resultado.
	
	
	
	
	
	
% Funciones auxiliares
%*********************************************************************
	
	
	
	
	
primero(Lista, Primero, Resto):-
	[Lista|Y] = [[Primero|Z]],
	Resto = Z.
	
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

% Basura	
%*********************************************************************		

	
	

%frase_ing --> grupo_nominal(Num).
%frase_ing --> grupo_nominal(Num), grupo_verbal(Num).

%grupo_nominal(Num)-->nombre_ing.
%grupo_nominal(Num)-->nombre_ing, morfema_ing(Num).
%grupo_nominal(Num)-->articulo_ing(Num), nombre_ing, morfema_ing(Num).
%grupo_nominal(Num)-->adjetivo_ing, nombre_ing, morfema_ing(Num).
%grupo_nominal(Num)-->articulo_ing(Num), adjetivo_ing, nombre_ing, morfema_ing(Num).
%grupo_nominal(Num)-->adjetivo_ing.


%grupo_verbal(Num)-->verbo_ing, terminacion_ing(Num).
%grupo_verbal(Num)-->verbo_ing, terminacion_ing(Num), preposicion_ing.