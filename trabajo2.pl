:- dynamic relacion/3,relacion/4.

ask(Atributo,Valor):-
relacion(si,Atributo,Valor),
!.

ask(Atributo,Valor):-
relacion(no,Atributo,Valor),
!,fail.
    
ask(Atributo,Valor):-
write(Atributo:Valor),
write("?(si/no) "),
read(R),
asserta(relacion(R,Atributo,Valor)),
R==si.

   
ask(Atributo,Objeto,Opciones):-
write(Atributo),
write(" de "),
write(" mamifero marino "),
write(" es "),
write(Opciones),
write("?"),
read(R),
(member(R,Opciones) -> asserta(relacion(si,Atributo,Objeto,R)),R==Opciones; writeln("Opcion no contemplada"),ask(Atributo,Objeto,Opciones)).


tamaño_cabeza(X):-ask(tamaño_cabeza,X).
forma_cabeza(X):-ask(la_cabeza_tiene_forma,X).
forma_aleta(X):-ask(forma_aleta,X).
piel_arrugada(X):-ask(piel_arrugada,X).
parche_gris_ojo(X):-ask(parche_gris_ojo,X).
color(X):-ask(color,X).
tamaño_aleta_dorsal(X):-ask(tamaño_aleta_dorsal,X).
marca_detras_del_ojo(X):-ask(tiene_una_marca_detras_del,X).
zona_ventral(X):-ask(el_color_ventral_es,X).
parche_gris(X):-ask(tiene_un_parche_desde_el_ojo_hasta_la_mitad_del_cuerpo_color,X).
manchas(X):-ask(tiene_manchas_color,X).
forma_hocico(X):-ask(tiene_el_hocico,X).


especie(ballena_azul) :- forma_cabeza(u),color(azul),tamaño_aleta_dorsal(pequeña),forma_aleta(triangular).
especie(ballena_fin) :- forma_cabeza(v),color(gris),tamaño_aleta_dorsal(pequeña),forma_aleta(hoz),zona_ventral(blanco).
especie(cachalote_gris) :- color(gris),tamaño_cabeza(grande),forma_aleta(triangular),piel_arrugada(si).
especie(delfin_austral) :- color(gris),parche_gris(gris).
especie(ballena_jorobada_gris) :- color(gris),tamaño_aleta_dorsal(pequeña),forma_aleta(triangular).
especie(lobo_fino_austral) :- color(gris),parche_gris_ojo(si),forma_hocico(puntiagudo).
especie(delfin_comun) :- color(gris),forma_aleta(triangular),zona_ventral(blanco).
especie(ballena_jorobada_negra) :- color(negro),tamaño_aleta_dorsal(pequeña),forma_aleta(triangular).
especie(orca) :- color(negro),forma_cabeza(redonda),marca_detras_del_ojo(ojo), manchas(blanco).
especie(cachalote_cafe) :- color(cafe),tamaño_cabeza(grande),forma_aleta(triangular),piel_arrugada(si).
especie(delfin_cruzado) :- forma_cabeza(redonda),tamaño_aleta_dorsal(grande),manchas(blancas),forma_hocico(corto).
especie(lobo_marino_comun) :- tamaño_cabeza(grande),manchas(amarillentas).




iniciar:-
retractall(relacion(_,_,_)),
retractall(relacion(_,_,_,_)),
especie(X),
write("probablemente es un/una "),write(X).


