# Use an official Node.js image as the base
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app


# Copy the rest of the project files
COPY . .

# Install parcel globally inside container
RUN npm install -g parcel

#Build the static site
Run parcel build src/index.html --dit-dir --public-url ./

# Expose port (optional, for development)
EXPOSE 1234

# Command to run when container starts
CMD ["npx", "parcel", "serve", "src/index.html", "--port", "1234"]
