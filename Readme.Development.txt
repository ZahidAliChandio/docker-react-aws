Dockerfile for production
Dockerfile.dev for development

Docker build . (for production)
Docker build -f Dockerfile.dev (for development to specify dockerfile)

-> Take imageId (from above)
- docker run -p 3000:3000 imageId

To reflect the file changes in the running container.
- Use 'Docker Volumes' (keeping reference of files inside docker container)

- docker run -p 3000:3000 -v/app/node_modules -v$(pwd):/app <image_id>
->-v/app/node_modules: Put a bookmark on the node_modules(do not map node_modules against any thing in container).
->-v$(pwd): Map the pwd into the '/app' folder.
- docker run -p 3000:3000 -v/app/node_modules -v$(filepath_for_cmd):/app <image_id>

-> Testing
- docker run build -f Dockerfile.dev npm run test
- docker run -it imageId npm run test
-> -it to get interactive environment in the termial

-> To sync changes of app.test.js file
- docker-compose up
-> New Terminal
- docker exec -it dockerComposeContainerId npm run test

web-test containers (to linke our terminal with container terminal)
-> To connect our key press to test container
- docker ps
- docker attach containerId(whose command is "npm run test")
-> New Terminal
- docker exec -it containerId sh
- ps