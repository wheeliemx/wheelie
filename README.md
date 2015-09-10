# Wheelie

Hola bienvenido a la documentación del api de wheelie.

## Requerimientos

	Elixir 1.0.4 o superior
	Postgresql
	
## Instalación.

Clonar el repo.

	$ git clone https://github.com/wheeliemx/wheelie
	$ cd wheelie
	
Instalar Phoenix Framework (opcional)

	$ mix local.hex
	$ mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v0.14.0/phoenix_new-0.14.0.ez

Crear esquema de base de datos.

Instalar dependencias y compilar

	$ mix do deps.get, compile
	# Instala dependencias de node para brunch
	$ npm install
	# Arrancar server
	$ mix phoenix.server
	
## Esquema de trabajo

[Github flow.](https://guides.github.com/introduction/flow/index.html)