# Clean Architecture - Flutter

Proyecto Flutter implementado con **Clean Architecture**, un patrón de arquitectura que separa el código en capas independientes con responsabilidades bien definidas.

## Estructura del Proyecto

```
lib/
├── domain/           # Capa de Dominio (Lógica de negocio)
├── data/             # Capa de Datos (Acceso a datos)
└── presentation/     # Capa de Presentación (UI)
```

---

##  Capas de la Arquitectura

### 1. **DOMAIN (Dominio)** 
La capa más independiente y pura. Contiene la lógica de negocio sin dependencias externas.

**Subdirectorios:**

- **`entities/`** - Las entidades del negocio
  - Clases que representan los objetos principales de la aplicación
  - Deben ser lo más limpias posibles, sin lógica compleja
  - Ejemplo: `Products` (id, name, valor)

- **`repositories/`** - Contratos (interfaces) de los repositorios
  - Define qué operaciones se pueden realizar con los datos
  - Son abstracciones que definen el contrato entre capas
  - Ejemplo: `Products_Repository` (getProducts, addProduct, updateProduct, deleteProduct)

- **`uses_cases/`** - Casos de uso de la aplicación
  - Cada caso de uso representa una acción específica del usuario
  - Usa los repositorios para acceder a datos
  - Contiene la lógica de orquestación del negocio
  - Ejemplo: `Add_Product`, `Get_Products`, `Update_Product`, `Delete_Product`

---

### 2. **DATA (Datos)** 
Capa responsable de la obtención y gestión de datos. Implementa los contratos definidos en Domain.

**Subdirectorios:**

- **`datasources/`** - Fuentes de datos
  - Implementaciones concretas para obtener datos
  - Pueden ser: APIs REST, bases de datos locales, memoria, etc.
  - Ejemplo: `product_memory_datasources.dart` (almacenamiento en memoria)

- **`repositories_data/`** - Implementaciones de repositorios
  - Implementa las interfaces definidas en `domain/repositories/`
  - Usa los datasources para obtener datos
  - Maneja la lógica de caché y transformación de datos
  - Ejemplo: `product_repository_impl.dart`

---

### 3. **PRESENTATION (Presentación)**
Capa de interfaz de usuario. Muestra datos al usuario e interactúa con los casos de uso.

**Subdirectorios:**

- **`layouts/`** - Componentes de diseño reutilizables
  - Widgets personalizados y comunes
  - Layouts específicos de la app

- **`providers/`** - Gestión de estado
  - Usando Provider, Riverpod, BLoC, etc.
  - Comunica la UI con los casos de uso
  - Maneja el estado de la aplicación

---

## Flujo de Datos

```
Usuario → Presentation (UI)
    ↓
Presentation llama Use Cases
    ↓
Use Cases llama Repository (interfaz)
    ↓
Data implementa Repository
    ↓
Data accede a DataSources
    ↓
DataSources retorna Entities
    ↓
El flujo vuelve hacia arriba actualizando la UI
```

---
## Recordatorio

al usarse Providers, debes instalar las dependencias 
```yaml
dependencies:
  provider: ^6.0.0
```

o por el terminal 
```bash flutter pub add provider
```