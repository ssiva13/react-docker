# React Docker

## Develop React in Docker

## Setting up Docker environment for react

_**NOTE - This is for development environment only**_

Build the docker container

```bash
docker compose -p react-docker up -d
```

1. ### From your project directory

    - change code directory ownership to logged-in user

      ```bash
      chown -R user:user code/
      ```

    - change code directory permission -assuming local user is same as docker user set 775 else set to 777

      ```bash
      chmod -R 775 code/
      ```

    NOTE - This is for development environment only

2. ### From your container terminal directory

    - Open container terminal

    ```bash
    docker exec -it react-app /bin/bash
    ```

    - Initialize react project - new project

    ```bash
    npx create-next-app .
    ```

    or

    ```bash
    npx create-react-app .
    ```
  
    - Clone react project - existing project

    ```bash
    git clone <repo_url> .
    
    npm install
    ```

    - Start the development server.

    ```bash
    npm start
    ```

    - View app in the browser at

    ```bash
    http://localhost:8300
    ```

    - Create a production build

    ```bash
    npm run build
    ```

    - View production build at

    ```bash
    http://localhost:8803
    ```

   Downside - You have to refresh browser manually.
