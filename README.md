# Movies Test App

**Movies Test App** es una aplicación móvil desarrollada en **Flutter** que consume datos de la **TMDB API** para mostrar una lista de películas en cartelera y las mejor calificadas. Los usuarios pueden ver detalles de cada película y la lista de actores principales, todo con un diseño adaptado para ofrecer una experiencia de usuario fluida.

---

## Características

- **Interfaz de Usuario**: Basada en Material Design, con una interfaz clara y fácil de navegar.
- **Consumo de API**: Obtención de datos de películas de la API de TMDB.
- **Gestión de Estado**: Utilización de **Flutter Bloc** para manejar el estado de las pantallas y de las solicitudes de API.
- **Pantalla Principal**: Listado horizontal de películas en cartelera y las mejor calificadas.
- **Pantalla de Detalles**: Muestra información detallada sobre cada película seleccionada, incluidos los actores.

---

## Tecnologías Utilizadas

- **Frontend**: Flutter, Dart.
- **Gestión de Estado**: Flutter Bloc.
- **HTTP Requests**: Dio.
- **Tema de la Aplicación**: Personalización con **ThemeCubit**.
- **API de Películas**: **TMDB API**.

---

## Estructura del Proyecto

```plaintext
lib/
├── config/                 # Configuración general de la app.
│   ├── helpers/            # Helpers para la API y lógica de negocio.
│   │   └── getMoviesApi.dart  # Helper para obtener películas desde la API.
│   ├── router/             # Configuración de rutas.
│   │   └── app_router.dart  # Configuración de las rutas principales.
│   ├── theme/              # Estilos y temas de la app.
│   │   └── app_theme.dart  # Tema general de la aplicación.
│   ├── config.dart         # Configuración global.
│
├── domain/                 # Lógica de negocio y entidades.
│   ├── entities/           # Definición de las entidades.
│   │   ├── credits.entity.dart    # Datos de créditos de las películas.
│   │   ├── details.entity.dart    # Detalles de una película.
│   │   ├── model_test.dart        # Modelo de prueba (para testing).
│   │   └── movie.entity.dart     # Entidad de películas.
│   └── domain.dart          # Archivo que agrupa las entidades y servicios del dominio.
│
├── presentation/            # Lógica de presentación y UI.
│   ├── blocs/               # BLoC y cubits para manejar el estado.
│   │   ├── home_screen_cubit/     # Bloc para la pantalla principal.
│   │   │   ├── home_screen_bloc.dart  # Lógica para cargar la lista de películas.
│   │   │   ├── home_screen_event.dart  # Eventos para la pantalla principal.
│   │   │   └── home_screen_state.dart  # Estados para la pantalla principal.
│   │   ├── movie_details/    # BLoC para detalles de una película.
│   │   │   ├── movie_details_bloc.dart  # Lógica de detalles de la película.
│   │   │   ├── movie_details_event.dart  # Eventos para detalles.
│   │   │   └── movie_details_state.dart  # Estados para detalles.
│   │   ├── movie_details_credit/  # BLoC para créditos de la película.
│   │   │   ├── movie_details_credits_bloc.dart  # Lógica de créditos.
│   │   │   ├── movie_details_credits_event.dart  # Eventos de créditos.
│   │   │   └── movie_details_credits_state.dart  # Estados de créditos.
│   │   └── theme_dart_light/  # BLoC para el tema oscuro/claro.
│   │       ├── theme_cubit.dart  # Lógica para alternar entre modos.
│   │       └── theme_state.dart  # Estado del tema.
│   ├── screens/             # Pantallas principales de la aplicación.
│   │   ├── home/            # Pantalla principal con la lista de películas.
│   │   │   └── home_screen.dart  # UI de la pantalla principal.
│   │   └── movie_details/   # Pantalla de detalles de la película.
│   │       └── movie_details_screen.dart  # UI de detalles de la película.
│   ├── widgets/             # Componentes reutilizables.
│   │   ├── card_movies.dart  # Tarjeta con la información de cada película.
│   │   ├── image_card.dart  # Widget de imagen para las tarjetas.
│   │   └── image_credits.dart  # Widget para mostrar imágenes de los actores.
│
├── main.dart                # Punto de entrada de la aplicación.

```

## Estructura del Proyecto

### Requisitos Previos
+ **Flutter SDK:** Instalar Flutter.
+ **Dart:** Viene incluido con Flutter.
+ **Clave API de TMDB:**  Regístrate y genera una clave en TMDB API.

## Pasos para la configuración
**Clonar el repositorio:**

bash
Copy code
```
git clone https://github.com/tu-usuariomovies_test_app.git
cd movies_test_app
```
### Configurar la clave API:

Abre el archivo `lib/config/helpers/getMoviesApi.dart.`

**Agrega tu clave API en el archivo:**

```
final String apiKey = 'TU_CLAVE_API';
```
**Instalar dependencias:**

```
flutter pub get
```
**Ejecutar la aplicación:**

```
flutter run
```

# Endpoints de la API
+ Películas en cartelera (Now Playing):
URL: `/movie/now_playing`

+ Películas mejor calificadas (Top Rated):
URL: `/movie/top_rated`

+ Reparto y creditos:
URL: `/movie/$movieId/credits`

+ Detalles de la película:
URL: `/movie/$movieId`


## Pantalla Principal

La pantalla principal muestra dos listas horizontales de películas:

1. Películas en cartelera: Se muestran las películas actualmente en cartelera.

2. Películas mejor calificadas: Se muestran las películas mejor valoradas.

Cada película se presenta en una tarjeta que contiene el título, una imagen representativa y una pequeña descripción. Al hacer clic en una tarjeta, se navega a la pantalla de detalles de la película.

## Pantalla de Detalles
La pantalla de detalles muestra información adicional sobre una película, incluyendo:

+ Descripción completa.
+ Fecha de estreno.
+ Detalles de los actores principales.


### Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.




