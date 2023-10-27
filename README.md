# Proyecto Autos Eléctricos

Este es un proyecto de demostración para una plataforma que muestra información sobre Autos Eléctricos, permite a los usuarios ver los detalles de cada automóvil y agregar comentarios a los automóviles.

## Descripción

Este proyecto se ha desarrollado como parte de un ejercicio de programación para mostrar cómo se puede crear una aplicación web simple utilizando Ruby on Rails. El objetivo principal es proporcionar una vista general de los autos eléctricos disponibles, permitir a los usuarios ver detalles específicos de un auto y agregar comentarios a los autos.

## Implementación

### Requisitos

- Ruby (versión 3.2.2)
- Ruby on Rails (versión 7.0.7)
- PostgreSQL (u otra base de datos compatible)
- Bundler

### Instalación

1. Clona el repositorio:

   ```bash
    git clone https://github.com/tuusuario/proyecto-autos-electricos.git
   ```

2. Navega al directorio del proyecto:

  ```bash
   cd proyecto-autos-electricos
  ```

3. Instala las gemas necesarias:

  ```bash
    bundle install
  ```

4. Configura la base de datos:

  ```bash
    rails db:create
    rails db:migrate
    rails db:seed
  ```

5. Inicia el servidor:
  
  ```bash
    rails server
  ```

6. Abre tu navegador web y navega a http://localhost:3000 para ver la aplicación en funcionamiento.

### Uso

La página principal muestra una lista de autos eléctricos disponibles.

Haz clic en el nombre de un auto para ver más detalles en la página de perfil del auto.

Puedes agregar comentarios al perfil de un auto si estás autenticado.

usuario cliente de prueba email: client@gmail.com pass: 123456

usuario administrador de prueba email: administrador@gmail.com pass: 123456