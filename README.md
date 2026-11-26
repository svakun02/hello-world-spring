# Hello World — Spring Boot 

A minimal example of a frontend communicating g Boowith a Sprint backend.

## Technologies

- Java 17 or later
- Spring Boot 4.1.2 (Spring Web MVC)
- Gradle 9.8.2
- HTML and JavaScript

## How to run

1. Open this folder in IntelliJ IDEA (open `build.gradle` as a Gradle project).
2. Select **JDK 17 or later** for the project and Gradle JVM.
3. Run `HelloWorldApplication.java`.
4. Open **http://localhost:8080** in your browser.

Alternatively, run from a terminal inside the project directory:

**Windows:**

```cmd
.\gradlew.bat bootRun
```

**macOS / Linux:**

```bash
./gradlew bootRun
```

> On the first run, the included launch scripts download Gradle 9.8.2 from the official distribution site, verify its SHA-256 checksum, and then run Gradle. These are lightweight bootstrap launchers, not the standard binary Gradle Wrapper JAR. An internet connection is also needed once for Spring Boot dependencies.

## Test

| URL | Expected result |
| --- | --- |
| http://localhost:8080 | Page shows **Hello World** |
| http://localhost:8080/api/hello | JSON: `{"message":"Hello World"}` |

## How it works

1. `HelloController.java` handles `GET /api/hello` and sends a JSON response.
2. `index.html` provides the frontend page. Spring Boot serves it from `src/main/resources/static/`.
3. `app.js` uses `fetch('/api/hello')` to request data from the backend.
4. JavaScript displays the message from the JSON response in the page.

## Project structure

```
src/main/java/kz/iitu/helloworld/
    HelloWorldApplication.java  # Starts Spring Boot
    HelloController.java        # Backend REST endpoint
src/main/resources/
    application.properties      # Server settings
    static/
        index.html             # Frontend HTML
        app.js                 # Fetches JSON from backend
```

