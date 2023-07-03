## Contexto y Objetivos

¡Es hora de hacer una app de tres modelos! Y como lo sospechabas, vamos a introducir una relación de muchos a muchos (`n:n`). Bueno, ¿qué implica esto? Debes crear una Watch List para almacenar tus películas favoritas.

Aquí están las **acciones de usuario** que queremos implementar en nuestra aplicación:
- Como usuario, puedo ver todas mis listas de películas
- Como usuario, puedo crear una lista de películas
- Como usuario, puedo ver los detalles de una lista de películas
- Como usuario, puedo marcar (`bookmark`) una película dentro de una lista de películas
- Como usuario, puedo destruir un `bookmark`

**Advertencia** las películas se crearán en la base de datos con una seed, así que no hay necesidad implementar ninguna acción del usuario en torno al modelo `movie`.

## Creación de la app Rails app

a deberías tener [yarn](https://yarnpkg.com) instalado. Compruébalo con:

```bash
yarn -v
# You should see your yarn version here
```

Si no, vuelve a la sección correspondiente de la configuración de [macOS](https://github.com/lewagon/setup/blob/master/macos.md#yarn), [Linux](https://github.com/lewagon/setup/blob/master/ubuntu.md#yarn) o [Windows](https://github.com/lewagon/setup/blob/master/windows.md#yarn).

**Nota**: ¡Ya debes poder hacer esto sin ver estos apuntes! No olvides el `-d postgresql` (hablaremos de esto mañana). 😉

```bash
cd ~/code/<user.github_nickname>
rails new rails-watch-list -j webpack -d postgresql --skip-action-mailbox -T
cd rails-watch-list
```

Ahora debemos crear la base de datos postgresql para esta nueva app rails.

```bash
rails db:create
```

Configura git, crea un repositorio en GitHub y haz el push de nuestro esqueleto.

```bash
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

Importa las especificaciones del profesor para monitorear nuestro progreso con `rake`.

```bash
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
rails db:migrate
rails db:test:prepare
git submodule add https://github.com/lewagon/fullstack-challenges-04-Rails-watch-list-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

Podrás testear tu código con:

```bash
rails db:migrate RAILS_ENV=test  # If you added a migration
rspec spec/models                # Launch tests
```

Antes de comenzar a escribir tu código, no olvides configurar tu app Rails para el Front-end. Tal como se mencionó en la clase de esta mañana, agrega las dependencias de Bootstrap y JavaScript

```bash
yarn add bootstrap @popperjs/core
```

Para agregar los node modules al assets path, Agrega esta línea en `config/initializers/assets.rb`:

```ruby
# config/initializers/assets.rb
# [...]
Rails.application.config.assets.paths << Rails.root.join("node_modules")
```

Y agrega las gemas que vamos a necesitar:

```ruby
# Gemfile
[...]
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form", github: "heartcombo/simple_form"
gem "sassc-rails" # Uncomment this line
```

```bash
bundle install
rails generate simple_form:install --bootstrap
```

Después descarga los stylesheets de Le Wagon:

```bash
rm -rf app/assets/stylesheets
curl -L https://github.com/lewagon/stylesheets/archive/master.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets
```

Finalmente, importa la librería Boostrap JS utilizando webpack:

```js
// app/javascript/application.js
import 'bootstrap';
```

No olvides hacer el `commit` y el `push` de tu trabajo regularmente.

## Especificaciones

### 1 - Modelos

Ve a [db.lewagon.com](http://db.lewagon.com)
y dibuja el esquema con tu compañero. Necesitamos las siguientes tablas: `movies`, `lists` y `bookmarks`. Piensa en el tipo de relaciones entre las tablas y quién almacenará las *referencias*. 😉


![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/db.png)

**Importante**
No utilices `rake` sino:

```bash
rspec spec/models
```

para que solamente se corran los tests en la carpeta `spec/models`. Asegúrate de que todo esté en verde antes de continuar a la parte aplicada del desafío.

#### Atributos

- Una película **movie** tiene un título **title** (e.g. `"Wonder Woman 1984"`), una pequeña descripción **overview** (`"Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s!"`), un **poster url** y un **rating** (6.9).
- Una lista **list** tiene un nombre **name** (e.g. `"Drama"`, `"Comedy"`, `"Classic"`, `"To rewatch"`, ... )
- Un **bookmark** agrega una película a una lista (e.g. Wonder Woman has been added to the "Girl Power" watch list). Así que cada **bookmark** hace referencia a una película y a una lista con un **comment**. El campo del **comment** es para que el usuario agregue una nota en el bookmark (e.g. Alan Turing recommended this movie).

#### Validación

- Una película debe tener un título único y una descripción.
- Una lista debe tener un nombre único.
- Un bookmark debe estar enlazado a una película y a una lista, y los pares [movie, list] deben ser únicos.
- El comentario en el bookmark no puede ser de menos de 6 caracteres.

#### Asociaciones

- Una lista tiene muchos bookmarks
- Una lista tiene muchas películas a través de bookmarks
- Una película tiene muchos bookmarks
- Un bookmark pertenece a una película
- Un bookmark pertenece a una lista
- No se puede borrar una película si la misma está referenciada en al menos un bookmark.
- Cuando borras una lista, debes borrar todos los bookmarks asociados a la misma (pero no las películas ya que estas pueden estar referenciadas en otras listas).

### 2 - Seed de las películas

**Nuestra app no les permitirá a los usuarios crear películas**.
En cambio, generaremos un seed estático de películas para escoger.
Ejemplo de seed:

```ruby
# db/seeds.rb
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
```

### Opcional:

Diviértete y crea un seed de películas falsas utilizando la gema [faker](https://github.com/faker-ruby/faker).

Si quieres ir más lejos, puedes hacer un seed de películas reales utilizando [esta API](https://developers.themoviedb.org/3/movies/get-top-rated-movies) (con las librerías ruby `open-uri` y `json`).

**Configuración de la API**

Los endpoints de la API te piden que crees una cuenta de usuario y generes una API key. Dado que ese proceso toma tiempo, el equipo de Le Wagon te ha dado un **proxy** para esa API. Gracias a esta proxy podrás utilizar la API sin necesidad de generar la API key por tu cuenta. ¡Te pedimos que solo uses esta herramienta para este desafío! ¡Confiamos en ti!

A continuación te explicamos cómo funciona:

1. La API dirá: usa `https://api.themoviedb.org/3/movie/top_rated?api_key=<your_api_key>`
2. Lo que deberás hacer es reemplazar esta parte de la url `https://api.themoviedb.org/3` por `http://tmdb.lewagon.com`
3. Practica [aquí](http://tmdb.lewagon.com/movie/top_rated)

**Imágenes de las Películas**

Para entender cómo obtener imágenes de las películas de la API, asegúrate de leer cuidadosamente [esta página](https://developers.themoviedb.org/3/getting-started/images) que se encuentra en la documentación.

### 3 - Ruta, Controlador, Vistas para las Listas

**Importante**
No utilices `rake` para escribir el código de la parte aplicativa. Abre un `rails s` desde tu terminal y abre un navegador en [http://localhost:3000/](http://localhost:3000/). Siempre escribe código en silo:

- comienza con la **ruta**,
- luego empieza a escribir el código del **controlador**,
- finalmente comienza a escribir el código de la **vista** y refresca el navegador.

Cuando termines tu feature (y se vea bien), ¡comienza a trabajar en la siguiente y repite el procedimiento!

Cuando pienses que hayas terminado **todo** el desafío, usa `rake` para asegurarte que cumples con las especificaciones.

**Features**
Te recordamos nuevamente que debes tener una idea precisa de las features de tu app para crear las rutas. Aquí tienes la lista que las necesitas:

- Un usuario puede ver todas las listas

```
GET "lists"
```

- Un usuario puede ver el nombre y el detalle de una lista específica

```
GET "lists/42"
```

- Un usuario puede crear una nueva lista

```
GET "lists/new"
POST "lists"
```

### 4 - Routa, Controlador, Vista para los bookmarks

- Un usuario puede agregar un nuevo bookmark (par movie/list) en una lista existente
- Revisa la [documentación](https://github.com/heartcombo/simple_form#associations) de `simple_form` sobre `f.association` para crear de forma fácil un menú de selección desplegable para nuestra lista de películas.

```
GET "lists/42/bookmarks/new"
POST "lists/42/bookmarks"
```

- Un usuario puede borrar un bookmark de una lista. ¿Cómo podemos crear un link de delete?

```
DELETE "bookmarks/25"
```
¿Necesitamos un `MoviesController`?

### 5 - Diseño sobre la marcha

¡Es hora de crear un front-end cool jugando con CSS! 😊 Revisa [dribbble](https://dribbble.com/) o [onepagelove](https://onepagelove.com/)
para inspirarte.

No olvides que puedes tener imágenes locales en la carpeta `app/assets/images`. O aún mejor, puedes pedirle al usuario un `image_url` cuando agrege una nueva lista.

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/homepage.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/showpage.png)

### 6 - Formulario de nuevo bookmark en la página show de la lista (Opcional)

Intenta poner el "Formulario de nuevo bookmark" en la página de la propia lista, y no en una página por separado. ¡Así no tendrás que dejar la página de la lista para agregar una nueva película! ¿Qué cambia en las rutas y en los controladores?

### 7 - Tom Select en el dropdown de las películas (Opcional)

¡Agrega un paquete JavaScript a nuestra app Rails! Échale un vistazo a [nuestro tutorial](https://kitt.lewagon.com/knowledge/tutorials/tom_select)

Para hacerlo:
- Genera un controlodador de Stimulus dedicado a eso
- Conecta este controlador Stimulus al `select` tag del dropdown de las películas
- Adapta uno de los snipets de código de [ejemplos básicos](https://tom-select.js.org/examples/) para instanciar un Tom Select en el controlador Stimulus

### 8 - Reviews de la Lista (Opcional)

Todos deberían tener la opción de escribir comentarios y decirnos lo que piensan de nuestra selección de películas. ¡Agrega algunos reviews a tus listas!

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/reviews.png)

### 9 - Yendo más lejos

- Agrega la posibilidad de hacer una búsqueda de películas.
- Agrega [typed.js](http://www.mattboldt.com/demos/typed-js/) para tener títulos divertidos en tu home page.
- Agrega [animación con scroll](https://michalsnik.github.io/aos/) a tus bookmarks
- Usa [`star-rating.js`](https://kitt.lewagon.com/knowledge/tutorials/star_rating) para mostrar estrellas en lugar de una entrada normal en el formulario de reviews.

Te recordamos nuevamente que uses controladores Stimulus cuando implementes comportamiento JavaScript en tu aplicación ⚠️
