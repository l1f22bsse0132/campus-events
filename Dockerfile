# Step 1 — Build the static files using Parcel
FROM node:18-alpine AS builder
WORKDIR /app

# Copy and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all project files
COPY . .

# Build using Parcel → output goes to /app/dist
RUN npm run build


# Step 2 — Run server.js using Express to serve dist/
FROM node:18-alpine
WORKDIR /app

# Copy built dist folder from builder stage
COPY --from=builder /app/dist ./dist

# Copy server.js to final container
COPY server.js ./

# Copy package files again to install only production dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Expose port
EXPOSE 1234

# Start server
CMD ["node", "server.js"]
