FROM node:20-alpine AS runtime

# Set workdir
WORKDIR /app

# Install dependencies
COPY app/package*.json ./app/
RUN npm ci --prefix app --omit=dev

# Copy application source
COPY app ./app

# Expose the service port
EXPOSE 3000

# Start the service
CMD ["node", "app/src/index.js"]
