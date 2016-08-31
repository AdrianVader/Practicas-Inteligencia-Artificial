

% Diccionario español
%*********************************************************************



verbo_esp(copulativo, es, singular).
verbo_esp(copulativo, son, plural).
verbo_esp(intransitivo, est, _).
verbo_esp(regular, beb, _).
verbo_esp(regular, com, _).

terminacion_esp(singular, regular, e).
terminacion_esp(plural, regular, en).
terminacion_esp(singular, intransitivo, a).
terminacion_esp(plural, intransitivo, an).

nombre_esp(_, niñ).
nombre_esp(femenino, manzan).
nombre_esp(masculino, batid).
nombre_esp(femenino, cas).
nombre_esp(masculino, libr).
nombre_esp(femenino, libreri).


morfema_esp(femenino, singular, regular, a).
morfema_esp(femenino, plural, regular, as).
morfema_esp(masculino, singular, regular, o).
morfema_esp(masculino, plural, regular, os).
morfema_esp(ninguno, singular, irregular, e).
morfema_esp(ninguno, plural, irregular, es).


adjetivo_esp(regular, pequeñ).
adjetivo_esp(irregular, grand).
adjetivo_esp(regular, bonit).
adjetivo_esp(regular, blanc).
adjetivo_esp(regular, roj).

articulo_esp(masculino, singular, el).
articulo_esp(masculino, plural, los).
articulo_esp(femenino, singular, la).
articulo_esp(femenino, plural, las).
articulo_esp(masculino, singular, un).
articulo_esp(femenino, singular, una).

preposicion_esp(en).



% Diccionario inglés
%*********************************************************************




verbo_ing(copulativo, is).
verbo_ing(copulativo, are).
verbo_ing(regular, eat).
verbo_ing(regular, drink).

terminacion_ing(singular, s).

nombre_ing(boy).
nombre_ing(girl).
nombre_ing(apple).
nombre_ing(milkshake).
nombre_ing(house).
nombre_ing(book).
nombre_ing(bookcase).

morfema_ing(plural, s).

adjetivo_ing(little).
adjetivo_ing(big).
adjetivo_ing(beautiful).
adjetivo_ing(white).
adjetivo_ing(red).

articulo_ing(_, the).
articulo_ing(singular, a).

preposicion_ing(in).






% Traducción
%*********************************************************************


trad_verbo(is, es, singular).
trad_verbo(are, son, plural).
trad_verbo(is, est, singular).
trad_verbo(are, est, plural).
trad_verbo(eat, com, _).
trad_verbo(drink, beb, _).

trad_nombre(boy, niñ, masculino).
trad_nombre(girl, niñ, femenino).
trad_nombre(apple, manzan, _).
trad_nombre(milkshake, batid, _).
trad_nombre(house, cas, _).
trad_nombre(book, libr, _).
trad_nombre(bookcase, libreri, _).

trad_adjetivo(little, pequeñ).
trad_adjetivo(big, grand).
trad_adjetivo(beautiful, bonit).
trad_adjetivo(white, blanc).
trad_adjetivo(red, roj).

trad_articulo(the, el, masculino, singular).
trad_articulo(the, la, femenino, singular).
trad_articulo(the, los, masculino, plural).
trad_articulo(the, las, femenino, plural).
trad_articulo(a, un, masculino, singular).
trad_articulo(a, una, femenino, singular).

trad_preposicion(in, en).




% Traductor de palabras enteras español-inglés
%*********************************************************************

% VERBOS
	% copulativo
traductor_verbo_esp(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_esp(Tipo,Verb, Num),name(Verb,Lista),trad_verbo(Trad,Verb,Num), Tipo=copulativo}.
	% regular o intransitivo (plural)
traductor_verbo_esp(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_esp(Tipo,Verb,_),name(Verb,Lista1),terminacion_esp(plural,Tipo,Term),name(Term,Lista2),concatenar(Lista1,Lista2,Lista),trad_verbo(Trad,Verb,plural)}.
	% regular (singular)
traductor_verbo_esp(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_esp(Tipo,Verb,_),name(Verb,Lista1),terminacion_esp(singular,Tipo,Term),name(Term,Lista2),concatenar(Lista1,Lista2,Lista),trad_verbo(Trad1,Verb,singular),name(Trad1,ListaTrad1),terminacion_ing(singular,Termin),name(Termin,ListaTrad2),concatenar(ListaTrad1,ListaTrad2,ListaTrad),name(Trad,ListaTrad), Tipo\=intransitivo}.
	% intransitivo (singular)
traductor_verbo_esp(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_esp(Tipo,Verb,_),name(Verb,Lista1),terminacion_esp(singular,Tipo,Term),name(Term,Lista2),concatenar(Lista1,Lista2,Lista),trad_verbo(Trad,Verb,singular), Tipo=intransitivo}.


% NOMBRES
traductor_nombre_esp(Trad,Gen,Num) --> [P],{name(P,Lista), nombre_esp(Gen,Nombre),name(Nombre,Lista1),morfema_esp(Gen,Num,Reg,MorfEsp),name(MorfEsp,Lista2),concatenar(Lista1,Lista2,Lista),trad_nombre(Trad1,Nombre,Gen),(Num=plural,name(Trad1,ListaTrad1),morfema_ing(Num,MorfIng),name(MorfIng,ListaTrad2),concatenar(ListaTrad1,ListaTrad2,ListaTrad),name(Trad,ListaTrad);Num=singular,Trad1=Trad)}.

% ADJETIVOS
traductor_adjetivo_esp(Trad,Gen,Num) --> [P],{name(P,Lista),adjetivo_esp(Reg,Adjetivo),name(Adjetivo,Lista1),morfema_esp(Gen,Num,Reg,MorfEsp),name(MorfEsp,Lista2),concatenar(Lista1,Lista2,Lista),trad_adjetivo(Trad,Adjetivo)}.

% ARTICULOS
traductor_articulo_esp(Trad,Gen,Num) --> [P],{name(P,Lista),articulo_esp(Gen,Num,Articulo),name(Articulo,Lista),trad_articulo(Trad,Articulo,Gen,Num)}.

% PREPOSICIONES
traductor_preposicion_esp(Trad) --> [P],{name(P,Lista),preposicion_esp(Prep),name(Prep,Lista),trad_preposicion(Trad,Prep)}.






% Traductor de palabras enteras inglés-español
%*********************************************************************

% VERBOS
	% regular
traductor_verbo_ing(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_ing(Tipo,Verb),(Num=singular,name(Verb,Lista1),terminacion_ing(Num,TermIng),name(TermIng,Lista2),concatenar(Lista1,Lista2,Lista);Num=plural,name(Verb,Lista)),trad_verbo(Verb,Trad1,Num),verbo_esp(Reg,Trad1,Num),terminacion_esp(Num,Reg,Trad2),name(Trad1,ListaTrad1),name(Trad2,ListaTrad2),concatenar(ListaTrad1,ListaTrad2,ListaTrad),name(Trad,ListaTrad),Tipo=regular}.
	% intransitivo o copulativo
traductor_verbo_ing(Trad,Num,Tipo) --> [P],{name(P,Lista),verbo_ing(copulativo,Verb),name(Verb,Lista),trad_verbo(Verb,Trad1,Num),(verbo_esp(Tipo,Trad1,Num),terminacion_esp(Num,Tipo,Trad2),name(Trad1,ListaTrad1),name(Trad2,ListaTrad2),concatenar(ListaTrad1,ListaTrad2,ListaTrad),name(Trad,ListaTrad),Tipo=intransitivo;verbo_esp(copulativo,Trad1,Num),Trad1=Trad)}.


% NOMBRES
traductor_nombre_ing(Trad,Gen,Num) --> [P],{name(P,Lista),nombre_ing(Nombre),(Num=plural,name(Nombre,Lista1),morfema_ing(Num,MorfIng),name(MorfIng,Lista2),concatenar(Lista1,Lista2,Lista);Num=singular,name(Nombre,Lista)),trad_nombre(Nombre,Trad1,Gen),nombre_esp(Gen,Trad1),morfema_esp(Gen,Num,Reg,Trad2),name(Trad1,ListaTrad1),name(Trad2,ListaTrad2),concatenar(ListaTrad1,ListaTrad2,ListaTrad),name(Trad,ListaTrad)}.

% ADJETIVOS
traductor_adjetivo_ing(Trad,Gen,Num) --> [P],{name(P,Lista),adjetivo_ing(Adjetivo),name(Adjetivo,Lista),trad_adjetivo(Adjetivo,AdjTrad),adjetivo_esp(Reg,AdjTrad),morfema_esp(Gen,Num,Reg,TermTrad), name(AdjTrad,Lista1),name(TermTrad,Lista2),concatenar(Lista1,Lista2,ListaTrad),name(Trad,ListaTrad)}.

% ARTICULOS
traductor_articulo_ing(Trad,Gen,Num) --> [P],{name(P,Lista),articulo_ing(Num,Articulo),name(Articulo,Lista),trad_articulo(Articulo,Trad,Gen,Num)}.

% PREPOSICIONES
traductor_preposicion_ing(Trad) --> [P],{name(P,Lista),preposicion_ing(Prep),name(Prep,Lista),trad_preposicion(Prep,Trad)}.






% Analizador de frases en español
%*********************************************************************


%es_verbo_esp --> [P],{verbo_esp(copulativo,Verb),name(P,Lista),name(Verb,Lista);name(P,Lista),verbo_esp(regular,Verb),name(Verb,Lista1),terminacion_esp(Num,Term),name(Term,Lista2),concatenar(Lista1,Lista2,Lista)}.
%es_nombre_esp --> [P],{nombre_esp(Genero,Nombre),name(P,Lista),name(Nombre,Lista1),morfema_esp(Genero, Numero, regular, Morfema),name(Morfema,Lista2),concatenar(Lista1,Lista2,Lista)}.
%es_adjetivo_esp --> [P],{adjetivo_esp(Regular,Adjetivo),name(P,Lista),name(Adjetivo,Lista1),morfema_esp(Genero, Numero, Regular, Morfema),name(Morfema,Lista2),concatenar(Lista1,Lista2,Lista)}.
%es_articulo_esp --> [P],{articulo_esp(Gen,Num,P)}.
%es_preposicion_esp --> [P],{preposicion_esp(P)}.


grupo_nominal_esp([Trad],Gen,Num) --> traductor_nombre_esp(Trad,Gen,Num).
grupo_nominal_adj_esp([Trad],Gen,Num) --> traductor_adjetivo_esp(Trad,Gen,Num).
grupo_nominal_esp([Trad1,Trad2],Gen,Num) --> traductor_articulo_esp(Trad1,Gen,Num), traductor_nombre_esp(Trad2,Gen,Num).
grupo_nominal_na_esp([Trad1,Trad2],Gen,Num) --> traductor_nombre_esp(Trad2,Gen,Num), traductor_adjetivo_esp(Trad1,Gen,Num).
grupo_nominal_esp([Trad1,Trad3,Trad2],Gen,Num) --> traductor_articulo_esp(Trad1,Gen,Num), traductor_nombre_esp(Trad2,Gen,Num),traductor_adjetivo_esp(Trad3,Gen,Num). % Tenemos en cuenta el orden de la frase en ingés, adjetivo, nombre, no como el español, nombre, adjetivo.

grupo_verbal_esp([Trad],Num) --> traductor_verbo_esp(Trad,Num,Tipo).
grupo_verbal_esp([Trad1|Trad2],Num) --> traductor_verbo_esp(Trad1,Num,Tipo), grupo_nominal_esp(Trad2,Gen,_).
grupo_verbal_esp([Trad1|Trad2],Num) --> traductor_verbo_esp(Trad1,Num,Tipo), grupo_nominal_na_esp(Trad2,Gen,_).
grupo_verbal_esp([Trad1|Trad2],Num) --> traductor_verbo_esp(Trad1,Num,copulativo), grupo_nominal_adj_esp(Trad2,Gen,Num).
%grupo_verbal_esp([Trad1|Trad2],Num) --> traductor_verbo_esp(Trad1,Num,copulativo), grupo_nominal_na_esp(Trad2,Gen,_).
grupo_verbal_esp(Trad,Num) --> traductor_verbo_esp(Trad1,Num,Tipo), traductor_preposicion_esp(Trad2), grupo_nominal_esp(Trad3,Gen,Num1),{concatenar([Trad1], [Trad2], Trad4),concatenar(Trad4,Trad3,Trad), Tipo\=copulativo}.
grupo_verbal_esp(Trad,Num) --> traductor_verbo_esp(Trad1,Num,Tipo), traductor_preposicion_esp(Trad2), grupo_nominal_na_esp(Trad3,Gen,Num1),{concatenar([Trad1], [Trad2], Trad4),concatenar(Trad4,Trad3,Trad), Tipo\=copulativo}.


frase(Trad) --> grupo_nominal_esp(Trad,Gen,Num).
frase(Trad) --> grupo_nominal_esp(Trad1,Gen,Num), grupo_verbal_esp(Trad2,Num),{concatenar(Trad1,Trad2,Trad)}.


% Analizador de frases en inglés
%*********************************************************************




%es_verbo_ing --> [P],{verbo_ing(Copulativo,Verb),name(P,Lista),name(Verb,Lista);name(P,Lista),verbo_ing(regular,Verb),name(Verb,Lista1),terminacion_ing(Num,Term),name(Term,Lista2),concatenar(Lista1,Lista2,Lista)}.
%es_nombre_ing --> [P],{nombre_ing(P)}.
%es_adjetivo_ing --> [P],{adjetivo_ing(P)}.
%es_articulo_ing --> [P],{articulo_ing(Num,P)}.
%es_preposicion_ing --> [P],{preposicion_ing(P)}.



grupo_nominal_ing([Trad],Gen,Num) --> traductor_nombre_ing(Trad,Gen,Num).
grupo_nominal_adj_ing([Trad],Gen,Num) --> traductor_adjetivo_ing(Trad,Gen,Num).
grupo_nominal_adj_ing([Trad],Gen,Num) --> traductor_adjetivo_ing(Trad,Gen,Num).
grupo_nominal_ing([Trad1,Trad2],Gen,Num) --> traductor_articulo_ing(Trad1,Gen,Num), traductor_nombre_ing(Trad2,Gen,Num).
grupo_nominal_ing([Trad1,Trad3,Trad2],Gen,Num) --> traductor_articulo_ing(Trad1,Gen,Num),traductor_adjetivo_ing(Trad2,Gen,Num), traductor_nombre_ing(Trad3,Gen,Num). % Tenemos en cuenta el orden de la frase en ingés, adjetivo, nombre, no como el español, nombre, adjetivo.

grupo_verbal_ing([Trad],Gen,Num) --> traductor_verbo_ing(Trad,Num,Tipo),{Tipo\=copulativo, Tipo\=intransitivo}.
grupo_verbal_ing([Trad1|Trad2],Gen,Num) --> traductor_verbo_ing(Trad1,Num,Tipo), grupo_nominal_ing(Trad2,Gen,Num1),{Tipo=copulativo; Tipo=regular}.
grupo_verbal_adj_ing([Trad1|Trad2],Gen,Num) --> traductor_verbo_ing(Trad1,Num,Tipo), grupo_nominal_adj_ing(Trad2,Gen,Num),{Tipo=copulativo}.
grupo_verbal_ing(Trad,Gen,Num) --> traductor_verbo_ing(Trad1,Num,Tipo), traductor_preposicion_ing(Trad2), grupo_nominal_ing(Trad3,Gen,Num1),{concatenar([Trad1], [Trad2], Trad4),concatenar(Trad4,Trad3,Trad),Tipo\=copulativo}.



frase(Trad) --> grupo_nominal_ing(Trad,Gen,Num).
frase(Trad) --> grupo_nominal_ing(Trad1,Gen,Num), grupo_verbal_ing(Trad2,Gen1,Num),{concatenar(Trad1,Trad2,Trad)}.
frase(Trad) --> grupo_nominal_ing(Trad1,Gen,Num), grupo_verbal_adj_ing(Trad2,Gen,Num),{concatenar(Trad1,Trad2,Trad)}.



	
% Auxiliar
%*********************************************************************




%primero(Lista, Primero, Resto):-[Lista|Y] = [[Primero|Z]],Resto = Z.
	
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).