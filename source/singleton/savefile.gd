'''
	Modulo Save File
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 14 / 05 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa singleton de save file
'''

extends Node2D

func salva_partida():
	var datos = {
		"salud": GLOBAL.pers_salud,
		"pers_tieneLampara": GLOBAL.pers_tieneLampara,
		"paginas": GLOBAL.paginas,
		"contadorDia": GLOBAL.contador_dia,
		"markerActual": GLOBAL.marker_actual,
		"escenaActual": GLOBAL.escena_actual,
		"nombre": GLOBAL.pers_nombre,
		"pliego": GLOBAL.pliego,
		"naranjas":GLOBAL.naranjas,
		"torta":GLOBAL.torta
	}
	var jsonString = JSON.stringify(datos)
	if !FileAccess.file_exists("res://gamesave.json"):
		pass
	var jsonFile = FileAccess.open("res://gamesave.json", FileAccess.WRITE)
	jsonFile.store_line(jsonString)
	jsonFile.close()

func carga_partida():
	if !FileAccess.file_exists("res://gamesave.json"):
		return false
	var jsonFile = FileAccess.open("res://gamesave.json", FileAccess.READ)
	var jsonString=jsonFile.get_as_text()
	jsonFile.close()
	var datos=JSON.parse_string(jsonString)
	GLOBAL.pers_salud = datos.salud
	GLOBAL.pers_tieneLampara =datos.pers_tieneLampara
	GLOBAL.pliego = datos.pliego
	GLOBAL.naranjas=datos.naranjas
	GLOBAL.torta=datos.torta
	var contador:int = 0
	for pag in datos.paginas:
		GLOBAL.paginas.set(contador, pag)
		contador += 1
	GLOBAL.set("paginas", datos.paginas)
	GLOBAL.contador_dia = datos.contadorDia
	GLOBAL.marker_actual = datos.markerActual
	GLOBAL.escena_actual = datos.escenaActual
	GLOBAL.pers_nombre = datos.nombre

func elimina_partida():
	if FileAccess.file_exists("res://gamesave.json"):
		DirAccess.remove_absolute("res://gamesave.json")
